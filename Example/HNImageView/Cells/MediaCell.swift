//
//  MediaCell.swift
//  ExampleZoomCell
//
//  Created by Azibai on 11/03/2020.
//  Copyright © 2020 Azibai. All rights reserved.
//

import UIKit
import HNImageView

class MediaCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: HNImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let configZoomImageView = HNImageViewConfigure(backgroundColor: .black,
                                             durationDismissZoom: 0.2,
                                             maxZoom: 3,
                                             minZoom: 0.8,
                                             vibrateWhenStop: false,
                                             autoStopWhenZoomMin: false,
                                             isUpdateAlphaWhenHandle: true)
        imageView.config(configZoomImageView)
        
        imageView.image = UIImage.init(named: ["pic1", "pic2", "pic3", "pic4", "pic5"].randomElement() ?? "pic1")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.prepareForReuse()
    }
}
