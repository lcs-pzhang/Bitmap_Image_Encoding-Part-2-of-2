import Foundation

public func drawGrid(on c : Canvas) {
    
    // Shift the origin a little bit
    c.translate(byX: 1, byY: 1)

    // Each enlarged pixel on the grid will be 20x20 actual pixels in size
    c.fillColor = Color.white
    c.borderColor = Color.black
    for y in stride(from: 0, to: 800, by: 20) {
        for x in stride(from: 0, to: 500, by: 20) {
            c.drawRectangle(bottomLeftX: x, bottomLeftY: y, width: 20, height: 20)
        }
    }

}
