import Foundation
import UIKit

public class PushBackAnimationGroup: CAAnimationGroup {
    public convenience init(forward: Bool, viewHeight: CGFloat, options: [SemiModalOption: Any]) {
        self.init()
        
        var id1 = CATransform3DIdentity
        id1.m34 = 1.0 / -900
        id1 = CATransform3DScale(id1, 0.95, 0.95, 1)
        
        let animation = CABasicAnimation(keyPath: "transform")
        animation.toValue = NSValue(caTransform3D: id1)
        
        let animationDuration = options[.animationDuration] as! Double
        animation.duration = animationDuration / 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
//        let animation2 = CABasicAnimation(keyPath: "transform")
//        animation2.toValue = NSValue(caTransform3D: forward ? id2 : CATransform3DIdentity)
//        animation2.beginTime = animation.duration
//        animation2.duration = animation.duration
//        animation2.fillMode = CAMediaTimingFillMode.forwards
//        animation2.isRemovedOnCompletion = false
        
        fillMode = CAMediaTimingFillMode.forwards
        isRemovedOnCompletion = false
        duration = animation.duration
        animations = [animation]
    }
}
