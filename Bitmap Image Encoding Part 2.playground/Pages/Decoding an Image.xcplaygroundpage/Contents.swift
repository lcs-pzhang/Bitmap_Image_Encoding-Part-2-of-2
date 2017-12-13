//: [Previous](@previous) / [Next](@next)
//: # Decoding an Image
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Decoding the text
 Now we will (at last!) decode the image.
 
 Recall, our rules are:
 
 * If a line starts with a 0, the first pixel is black.
 * If a line does not start with a 0, the first pixel is white.
 * When a comma is encountered, a new number begins, and the colour switches.
 * When a newline character is encountered, go to a new row in the image.
 * Once we have a new number, we draw that many pixels in the current colour.
 
 First, copy and paste your encoded image string to this page.
*/

// Copy your encoded image string here...
let encodedBitmap = """
w4,b4,w13
w4,b1,y2,w1,b2,w19,b2
w5,b1,y2,w1,y1,b15,w3,b1,y1,b1
w5,b1,y3,w1,y1,r1,y3,b2,w1,b1,y2,b1
w5,b1,y6,r1,w3,y1,b2,y2,b1
w4,b2,r1,y5,r1,y2,w2,y3,b1
w2,b3,r2,y7,o2,w2,y2,b1
w3,b1,y5,r1,y2,o2,y3,r1,y2,b1
w4,b1,y3,r1,p1,r1,y4,r2,y2,b1
w5,b1,y1,r1,p3,r1,y2,r2,y4,b1
w4,b1,y1,r1,p5,r2,y6,b1
w3,b1,y1,r1,p1,b2,p2,b3,r2,y4,b1
w3,b1,y1,r1,p1,w1,b1,p2,b2,w1,b1,w2,y4,b1
w2,b1,y2,b1,p1,w1,B1,p2,B1,w2,y3,w1,y2,b2
w3,b2,p2,w1,l1,p2,l1,B1,w1,y5,b1







"""

// Make a canvas
let canvas = Canvas(width: 502, height: 502)

// Make a grid
// NOTE: The code that builds the grid was tucked away in something called a *function* to keep things tidy. We'll learn about functions later.
drawGrid(on: canvas)

// Start drawing at left
var x = 0

// Set the size of a "pixel"
let cellSize = 20

// Keep track of current colour
var currentColor = "white"

// Start drawing at top of grid
var y = canvas.height - cellSize - 2

// Store the current number of pixels to draw
var drawThisManyPixels = 0

// Iterate over each character in the encoded bitmap string
for character in encodedBitmap {
    
    // Set colour at start of a line
    if character == "w" {
        
        canvas.fillColor = Color.white
        currentColor = "white"

    } else if character == "b" {
        
        canvas.fillColor = Color.black
        currentColor = "black"
        
    } else if character == "y" {
        
        canvas.fillColor = Color.init(hue: 58, saturation: 95, brightness: 95, alpha: 100)
        currentColor = "yellow"
        
    } else if character == "r" {
        
        canvas.fillColor = Color.init(hue: 0, saturation: 80, brightness: 80, alpha: 100)
    } else if character == "o" {
        
        canvas.fillColor = Color.orange
    
    } else if character == "p" {
        
        canvas.fillColor = Color.init(hue: 28, saturation: 40, brightness: 100, alpha: 100)
    } else if character == "B" {
    
    canvas.fillColor = Color.init(hue: 214, saturation: 95, brightness: 95, alpha: 100)
    
    } else if character == "l" {
        
        canvas.fillColor = Color.init(hue: 198, saturation: 90, brightness: 95, alpha: 100)
        
    } else if character == "," {
        
        
        
    } else if character == "\n" {
        
        // We are on a new line, so reduce the vertical position
        // and reset the horizontal position
        y = y - cellSize
        x = 0
        
        // Default colour after new line is white
        canvas.fillColor = Color.white
        currentColor = "white"
        
    } else {
        
        // What character is being used?
        print(character)
        
        // Get the new number of pixels to draw
        drawThisManyPixels = Int(String(character))!
        
        // Draw the pixels
        for _ in 1...drawThisManyPixels {

            // Draw the enlarged "pixel"
            canvas.drawRectangle(bottomLeftX: x, bottomLeftY: y, width: cellSize, height: cellSize)
            
            // Increase x so that the next pixel is drawn to the right of this one
            x += cellSize

        }

    }
    
}

/*:
 ### Check the results
 Does the output match what you'd expect, based on the values in the encoded string?
 
 How do you know?
 
 Write your ideas in the code comment below.
 */

// I notice that...
// I know this because...

/*:
 ## Extension
 Now that you have an understanding of how if statements (also called *selection* statements or *conditional* statements) work... extend this code.
 
 How could you adjust the rules so that pixels can be rendered in colour?
 
 What additions or changes would you need to make to the code above?
 
 Work with a partner to discuss possibilities and then make the changes in code.
 */


/*:
 Now, **remember to commit and push your work**.
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
