
//  Created by NguyenHieu on 11/03/2020.
//  Copyright © 2020 Azibai. All rights reserved.
//

import UIKit

extension HNImageView: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == pinch, otherGestureRecognizer == pan {
            return true
        }
        else {
            if gestureRecognizer == pan, otherGestureRecognizer == pinch {
                return true
            }
            else {
                if otherGestureRecognizer == pan || gestureRecognizer == pan {
                    return true
                }
                return false
            }
        }
    }
    
}
