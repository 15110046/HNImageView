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

    @IBOutlet weak var imageView: HImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let configZoom = HImageViewConfigure(backgroundColor: .black,
                                             durationDismissZoom: 0.2,
                                             maxZoom: 3,
                                             minZoom: 0.8,
                                             vibrateWhenStop: false,
                                             autoStopWhenZoomMin: false,
                                             isUpdateAlphaWhenHandle: true)
        imageView.config(configZoom)
        imageView.image = UIImage.init(named: ["a","c","d"].randomElement() ?? "a")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.prepareForReuse()
    }
}
