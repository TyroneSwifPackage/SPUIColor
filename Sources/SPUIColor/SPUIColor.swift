import UIKit

extension UIColor {
    
    public convenience init(_ hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red     = CGFloat(r) / 255.0
        let green   = CGFloat(g) / 255.0
        let blue    = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
    public convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 黑色透明度
    public convenience init(alpha: CGFloat) {
        self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: alpha)
    }

    
    /// 随机色
    public class func random() -> UIColor {
        return UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
    }
}
