
//  Created by NguyenHieu on 11/03/2020.
//  Copyright © 2020 Azibai. All rights reserved.
//

import UIKit

public class HNImageView: UIImageView {
    
    public enum StateZoomImageView {
        case start
        case changed
        case end
    }
    
    //MARK: Delegate + Config
    public weak var delegate: HNImageViewDelegate?
    var config: HNImageViewConfigure = HNImageViewConfigure()
    
    //MARK: Varible
    var isZooming = false
    var originalImageCenter: CGPoint?
    var frameImageOriginal: CGRect = .zero
    var alphaComponent: ((CGFloat)->())?
    public var pinch = UIPinchGestureRecognizer()
    public var pan = UIPanGestureRecognizer()

    //MARK: UI
    var viewContainer: UIView? = nil
    var imageView: UIImageView? = UIImageView(frame: .zero)
    
    public func config(_ model: HNImageViewConfigure) {
        self.config = model
    }
    
    //MARK: Set up
    private func initPanGesture() {
        pinch.addTarget(self, action: #selector(pinchGestureHandle(_:)))
        pinch.delegate = self
        self.addGestureRecognizer(pinch)
        
        pan.addTarget(self, action: #selector(panGestureHandle(_:)))
        pan.delegate = self
        self.addGestureRecognizer(pan)
        
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
    }
    
    private func listenHandleChangeAlpha() {
        alphaComponent = { [weak self] (newValue) in
            self?.viewContainer?.backgroundColor = self?.config.backgroundColor.withAlphaComponent(newValue)
        }
    }
    
    fileprivate func setUpViews() {
        
    }
    
    //MARK: Init
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    public override func awakeFromNib() {
        super.awakeFromNib()
        initPanGesture()
        listenHandleChangeAlpha()
    }
    
    public func prepareForReuse() {
        viewContainer?.removeFromSuperview()
        imageView = nil
        isZooming = false
        originalImageCenter = nil
        frameImageOriginal = .zero
    }
    
    //MARK: Action
    @objc private func panGestureHandle(_ sender: UIPanGestureRecognizer) {
        guard let imageView = imageView else { return }
        
        if isZooming, sender.state == .began {
            originalImageCenter = imageView.center
        }
        else
            if isZooming, sender.state == .changed {
                let translation = sender.translation(in: self)
                let newX: CGFloat = imageView.center.x + translation.x
                let newY: CGFloat = imageView.center.y + translation.y
                imageView.center = CGPoint(x: newX, y: newY)
                sender.setTranslation(CGPoint.zero, in: self)
                delegate?.hnImageView(state: .changed)
        }
    }
    
    @objc private func pinchGestureHandle(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .began:    setupUIWhenStartPinch(scale: sender.scale)
        case .changed:  reloadUIWhenPinchChanged(sender: sender)
        case .ended, .failed, .cancelled: stopZoom()
        default: break
        }
        acceptNewValueAlpha()
    }
    
    func dismiss(completion: @escaping ()->()) {
        UIView.animate(withDuration: config.durationDismissZoom, animations: {
            self.imageView?.center = self.originalImageCenter ?? CGPoint()
            self.imageView!.transform = CGAffineTransform.identity
            self.alphaComponent?(0)
        }) { (finished) in
            self.isZooming = false
            self.image = self.imageView?.image
            self.backgroundColor = .clear
            self.viewContainer?.removeFromSuperview()
            self.imageView?.removeFromSuperview()
            self.viewContainer = nil
            completion()
        }
    }
    
    deinit {
        
    }
}
