
import Cocoa

var solarSystem = ["Earth", "Sun", 1]

for name : AnyObject in solarSystem {
    println("This is the \(name)")
}

var sysFont: NSFont = NSFont.systemFontOfSize(0)

var number = sysFont.numberOfGlyphs

protocol Scalable {
    func scaleBySizingFactor(factor: Double) -> Self
}

extension NSFont : Scalable {
    func scaleBySizingFactor(factor: Double) -> NSFont {
        return NSFont(name: self.fontName, size: pointSize * factor)
    }
}

var doubledSysFont = sysFont.scaleBySizingFactor(2)

var rect = CGRect(x: 0, y: 0, width: 10, height: 10)

extension CGRect {
    var area: Double { return width * height }
}

rect.area

extension CGRect : Scalable {
    func scaleBySizingFactor(factor: Double) -> CGRect {
        var newWidth = width * factor
        var newHeight = height * factor
        return CGRect(x: origin.x, y: origin.y, width: newWidth, height: newHeight)
    }
}

