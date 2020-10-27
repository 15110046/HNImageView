
//  Created by NguyenHieu on 11/03/2020.
//  Copyright © 2020 Azibai. All rights reserved.
//

import UIKit

public struct HNImageViewConfigure {
    
    public var backgroundColor:         UIColor          = .clear
    public var durationDismissZoom:     TimeInterval     = 0.2
    public var maxZoom:                 CGFloat?         = 4
    public var minZoom:                 CGFloat          = 0.8
    public var vibrateWhenStop:         Bool             = false
    public var autoStopWhenZoomMin:     Bool             = false
    public var isUpdateAlphaWhenHandle: Bool             = true
    
    public var licensedZoom:            Bool             = false

    public init(backgroundColor:         UIColor          = .clear,
                durationDismissZoom:     TimeInterval     = 0.2,
                maxZoom:                 CGFloat?         = 4,
                minZoom:                 CGFloat          = 0.8,
                vibrateWhenStop:         Bool             = false,
                autoStopWhenZoomMin:     Bool             = false,
                isUpdateAlphaWhenHandle: Bool             = true,
                licensedZoom:            Bool             = false) {
        self.backgroundColor = backgroundColor
        self.durationDismissZoom = durationDismissZoom
        self.maxZoom = maxZoom
        self.minZoom = minZoom
        self.vibrateWhenStop = vibrateWhenStop
        self.autoStopWhenZoomMin = autoStopWhenZoomMin
        self.isUpdateAlphaWhenHandle = isUpdateAlphaWhenHandle
        self.licensedZoom = licensedZoom
    }
    
}
