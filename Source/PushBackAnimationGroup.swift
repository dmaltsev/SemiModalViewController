import Foundation
import UIKit

public class PushBackAnimationGroup: CAAnimationGroup {
    public convenience init(forward: Bool, viewHeight: CGFloat, options: [SemiModalOption: Any]) {
        self.init()
                
        var id1 = CATransform3DIdentity
        id1.m34 = 1.0 / -900
        id1 = CATransform3DScale(id1, 0.95, 0.95, 1)
        
        let animation = CABasicAnimation(keyPath: "transform")
        animation.toValue = NSValue(caTransform3D: forward ? id1 : CATransform3DIdentity)
        
        let roundedCornersAnimation = CABasicAnimation(keyPath: "cornerRadius")
        roundedCornersAnimation.toValue = NSNumber(value: forward ? 14 : 0)
        
        let animationDuration = options[.animationDuration] as! Double
        animation.duration = animationDuration / 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        fillMode = CAMediaTimingFillMode.forwards
        isRemovedOnCompletion = false
        duration = animation.duration
        animations = [animation, roundedCornersAnimation]
    }
}
