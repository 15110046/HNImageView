
//  Created by NguyenHieu on 11/03/2020.
//  Copyright © 2020 Azibai. All rights reserved.
//

import UIKit

extension HNImageView {
    
    func addViewContainer() {
        guard let window = UIApplication.shared.keyWindow else { return }
        viewContainer = UIView(frame: window.frame)
        guard let viewContainer = viewContainer else { return }
        window.addSubview(viewContainer)
    }
    
    func viewContainnerAddImageView() {
        imageView = UIImageView(frame: self.globalFrame ?? CGRect())
        imageView?.image = self.image
        imageView?.contentMode = self.contentMode
        guard let imageView = imageView else { return }
        viewContainer?.addSubview(imageView)
    }
    
    func updateFlags() {
        guard let imageView = imageView else { return }
        frameImageOriginal = imageView.frame
        originalImageCenter = imageView.center
        isZooming = true
    }
    
    func setupUIWhenStartPinch(scale: CGFloat) {
        if scale > config.minZoom, viewContainer == nil, self.image?.hasContent ?? false {
            addViewContainer()
            viewContainnerAddImageView()
            updateFlags()
            self.backgroundColor = .black
            self.image = nil
            delegate?.hnImageView(state: .start)
        }
    }
    
    func stopZoom() {
        if viewContainer != nil {
            dismiss { [weak self] in
                self?.delegate?.hnImageView(state: .end)
            }
        }
    }
    
    func reloadUIWhenPinchChanged(sender: UIPinchGestureRecognizer) {
        guard let view = imageView else { return }
            
            let currentScale = view.frame.size.width / view.bounds.size.width
            var newScale = currentScale*sender.scale
            
            let pinchCenter = CGPoint(x: sender.location(in: view).x - view.bounds.midX,
                                      y: sender.location(in: view).y - view.bounds.midY)
                    
            let transform = view.transform
                                    .translatedBy(x: pinchCenter.x,  y: pinchCenter.y)
                                    .scaledBy    (x: sender.scale,   y: sender.scale)
                                    .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
        
            if newScale < config.minZoom {
                if config.autoStopWhenZoomMin {
                    dismiss{ [weak self] in
                        self?.delegate?.hnImageView(state: .end)
                    }
                }
                else {
                    newScale = 1
                    let transform = CGAffineTransform(scaleX: newScale, y: newScale)
                    self.transform = transform
                    sender.scale = 1
                }
            }
            else {
                if let maxZoom = config.maxZoom, newScale >= maxZoom  {
                    view.transform = view.transform
                    .translatedBy(x: pinchCenter.x,  y: pinchCenter.y)
                    .scaledBy    (x: 1,   y: 1)
                    .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
                    sender.scale = 1
                }
                else {
                    view.transform = transform
                    sender.scale = 1
                }
            }
        delegate?.hnImageView(state: .changed)
    }
    
    func acceptNewValueAlpha() {
        let areaImageView = (imageView?.frame.height ?? 1) * (imageView?.frame.width ?? 1)
        let areaImageViewOriginal = frameImageOriginal.height * frameImageOriginal.width
        let result = 1.2 - areaImageViewOriginal/areaImageView
        if result >= 0.9 {
            alphaComponent?(0.9)
        }
        else {
            alphaComponent?(result)
        }
    }
    
}
