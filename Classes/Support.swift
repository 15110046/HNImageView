
//  Created by NguyenHieu on 11/03/2020.
//  Copyright © 2020 Azibai. All rights reserved.
//

import UIKit

//extension NSNotification.Name {
//    
//    public static let CellisZooming = Notification.Name("CellisZooming")
//    public static let CellStopZoom = Notification.Name("CellStopZoom")
//
//}

extension UIView {

    var globalFrame :CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
    
}
public extension UIImage {
  public var hasContent: Bool {
    return cgImage != nil || ciImage != nil
  }
}
