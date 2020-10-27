# HNImageView

[![CI Status](https://img.shields.io/travis/15110046a@gmail.com/HNImageView.svg?style=flat)](https://travis-ci.org/15110046a@gmail.com/HNImageView)
[![Version](https://img.shields.io/cocoapods/v/HNImageView.svg?style=flat)](https://cocoapods.org/pods/HNImageView)
[![License](https://img.shields.io/cocoapods/l/HNImageView.svg?style=flat)](https://cocoapods.org/pods/HNImageView)
[![Platform](https://img.shields.io/cocoapods/p/HNImageView.svg?style=flat)](https://cocoapods.org/pods/HNImageView)

## Demo
[![Demo Zoom Media in Cell](https://media.giphy.com/media/cVo8DY8s5sS8CKjuFJ/giphy.gif)](https://www.youtube.com/watch?v=QH3bCLidm7M)

## Install

[CocoaPods](https://cocoapods.org)

```ruby
pod 'HNImageView'
```
## Example
For a detailed example, see the [Example!](https://github.com/15110046/HNImageView/tree/master/Example).

```swift

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
```
[alt text](https://drive.google.com/file/d/1grFqOzcBeFutKzsXFdLIWYmA23K5CQyz/view?usp=sharing)

## Author

15110046a@gmail.com, hieunguyenute@gmail.com

## License

HNImageView is available under the MIT license. See the LICENSE file for more info.

Copyright (c) 2020 HieuNguyen
