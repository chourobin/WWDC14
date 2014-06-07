import Cocoa

// Create an array
var solarSystem = ["Earth", "Sun", 1]

// Iterate
for name : AnyObject in solarSystem {
    println("This is the \(name)")
}

var sysFont : NSFont = NSFont.systemFontOfSize(0)

var number = sysFont.numberOfGlyphs

// Declare a protocol
protocol Scalable {
    func scaleBySizingFactor(factor: Double) -> Self
}

// Create extensions on classes w/ protocols
extension NSFont : Scalable {
    func scaleBySizingFactor(factor: Double) -> NSFont {
        return NSFont(name: self.fontName, size: pointSize * factor)
    }
}

var doubledSysFont = sysFont.scaleBySizingFactor(2)

var rect = CGRect(x: 0, y: 0, width: 10, height: 10)

// Extend structs with properties
extension CGRect {
    var area: Double { return width * height }
}

var area = rect.area

// Extend structs with protocols
extension CGRect : Scalable {
    func scaleBySizingFactor(factor: Double) -> CGRect {
        var newWidth = width * factor
        var newHeight = height * factor
        return CGRect(x: origin.x, y: origin.y, width: newWidth, height: newHeight)
    }
}

var doubledRect = rect.scaleBySizingFactor(2)

// Generic functions
func scaleBySizingFactor<T: Scalable>(array: T[], factor: Double) -> T[] {
//    return array.map({ item in item.scaleBySizingFactor(factor) })
      return array.map { $0.scaleBySizingFactor(factor) }
}

var scaledFonts = scaleBySizingFactor([sysFont, doubledSysFont], 2)

var scaledRects = scaleBySizingFactor([rect, doubledRect], 2)




