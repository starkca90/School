/*
 * mydrawing.cpp
 *
 *  Created on: Feb 1, 2012
 *      Author: casey
 */

#include <stdlib.h>
#include <math.h>
#include <fstream>
#include "mydrawing.h"
#include "gcontext.h"

// Constructor
MyDrawing::MyDrawing()
{
	// Set some default values for some controlles

	dragging = false;
	point = false;
	line = false;
	rectangle = false;
	circle = false;
	polygon = false;
	drawingPoly = false;
	x0 = x1 = y0 = y1 = 0;
	paintBucket = false;
	image = new Image();
	curColor = GraphicsContext::GREEN;
	return;
}

MyDrawing::~MyDrawing()
{
	delete image;
}

/*
 * No changes were made to this code, this is the default code that
 * Professor Rothe made
 */
void MyDrawing::paint(GraphicsContext* gc)
{
	// for fun, let's draw a "fixed" shape in the middle of the screen
	// it will only show up after an exposure
	int middlex = gc->getWindowWidth()/2;
	int middley = gc->getWindowHeight()/2;

	gc->setColor(GraphicsContext::MAGENTA);

	for (int yi=middley-50;yi<=middley+50;yi++)
	{
		gc->drawLine(middlex-50,yi,middlex+50,yi);
	}

	return;
}

/*
 * Iterates through several switch cases to determine if the passed in keycode matches
 * any keycode for available functions. See README to determine what functions are available
 * and how to access them
 *
 * Arguments:
 * 	GraphicsContext* gc 	GraphicsContext to set some functions if applicable
 * 	unsigned int keycode 	keycode value that user pressed
 */
void MyDrawing::keyUp(GraphicsContext* gc, unsigned int keycode)
{
	// Determine if the user is in process of drawing a line or drawing a shape
	// if they are, ignore the key press.
	// Otherwise, determine if the key corresponds to a correct key, and take the
	// corresponding actions
	if(!dragging)
	{
		// User specified they wanted to change the current color, figure out what color they wanted
		if(color)
		{
			switch(keycode)
			{
			// 1
			case 49:
				gc->setColor(gc->BLUE);
				curColor = gc->BLUE;
				std::cout << "Key 1 Pressed: Setting Color to Blue" << std::endl;
				break;
				// 2
			case 50:
				gc->setColor(gc->GREEN);
				curColor = gc->GREEN;
				std::cout << "Key 2 Pressed: Setting Color to Green" << std::endl;
				break;
				// 3
			case 51:
				gc->setColor(gc->RED);
				curColor = gc->RED;
				std::cout << "Key 3 Pressed: Setting Color to Red" << std::endl;
				break;
				// 4
			case 52:
				gc->setColor(gc->CYAN);
				curColor = gc->CYAN;
				std::cout << "Key 4 Pressed: Setting Color to Cyan" << std::endl;
				break;
				// 5
			case 53:
				gc->setColor(gc->YELLOW);
				curColor = gc->YELLOW;
				std::cout << "Key 5 Pressed: Setting Color to Yellow" << std::endl;
				break;
				// 6
			case 54:
				gc-> setColor(gc->WHITE);
				curColor = gc->WHITE;
				std::cout << "Key 6 Pressed: Setting Color to White" << std::endl;
				break;
				// 0
			case 48:
				gc->setColor(gc->BLACK);
				curColor = gc->BLACK;
				std::cout << "Key 0 Pressed: Setting Color to Black" << std::endl;
				break;
				// Unknown Key Pressed
			default:
				gc->setColor(gc->MAGENTA);
				curColor = gc->MAGENTA;
				std::cout << "Unknown Color Code: Setting Color to Magenta" << std::endl;
				break;
			}
			// Color set, no need to keep entering this function
			color = false;
		}
		// User is in process of drawing a polygon, check if they pressed the Esc key
		else if(polygon && drawingPoly)
		{
			// User did press Esc key, they are done drawing, finish up the polygon
			if(keycode == 65307)
			{
				// Undraw the current line, more than likely just the mouse was dragged
				gc->drawLine(x0,y0,x1,y1);
				// go back to COPY mode
				gc->setMode(GraphicsContext::MODE_NORMAL);
				image->add(poly);
				poly->draw(gc);
				polygon = false;
				drawingPoly = false;
			}
		}
		// User is currently not wanting to do any of the above functions, figure out if they want to do a different function
		else
		{
			switch(keycode)
			{
			// p
			case 112:
				std::cout << "Key p Pressed: Enable Point Draw" << std::endl;
				reset();
				point = true;
				break;
				// l
			case 108:
				std::cout << "Key l Pressed: Enable Line Draw" << std::endl;
				reset();
				line = true;
				break;
				// c
			case 99:
				std::cout << "Key c Pressed: Enable Circle Draw" << std::endl;
				reset();
				circle = true;
				break;
				// r
			case 114:
				std::cout << "Key r Pressed: Enable Rectangle Draw" << std::endl;
				reset();
				rectangle = true;
				break;
				// x
			case 120:
				std::cout << "Key x Pressed: Enable Polygon Draw" << std::endl;
				reset();
				polygon = true;
				break;
				// q
			case 113:
				color = true;
				std::cout << "Key q Pressed: Now Select Color Number" << std::endl;
				break;
				// f
			case 102:
				fill = !fill;
				std::cout << "Key f Pressed: Fill is now " << fill << std::endl;
				break;
				// i
			case 105:
				std::cout << "Key i Pressed: Reading image from File" << std::endl;
				gc->clear();
				imageIn();
				image->draw(gc);
				break;
				// o
			case 111:
				std::cout << "Key o pressed: Saving Image to File" << std::endl;
				imageOut();
				break;
				// F
			case 70:
				std::cout << "Key F Pressed: Paint Bucket Function Enabled" << std::endl;
				reset();
				paintBucket = true;
				break;
				// e
			case 101:
				std::cout << "Key e Pressed: Erasing the display" << std::endl;
				image->erase();
				gc->clear();
				break;
			default:
				std::cout << "Unknown Code: " << keycode << std::endl;
				break;
			}

		}
	}
}

void MyDrawing::mouseButtonDown(GraphicsContext* gc, unsigned int button, int x, int y)
{
	gc->setMode(GraphicsContext::MODE_XOR);

	// User is drawing a standard shape that does not require any special treatment
	if(!polygon && !paintBucket)
	{
		x0 = x1 = x;
		y0 = y1 = y;

		dragging = true;
	}

	// User is drawing a polygon, but did not establish the initial point yet
	// Set the proper values, and start running
	else if(polygon && !drawingPoly)
	{
		x0 = x1 = x;
		y0 = y1 = y;
		poly = new Polygon(x0,y0,curColor,fill);
		drawingPoly = true;
	}
	return;
}

void MyDrawing::mouseButtonUp(GraphicsContext* gc, unsigned int button, int x, int y)
{
	// User is using the Paint Bucket Function, call flood fill, passing in the right values, and go
	if(paintBucket)
	{
		gc->fFill(x,y,gc->getPixel(x,y));
	}
	// User is drawing a polygon
	else if(polygon)
	{
		// Undraw the "rubber band" line
		gc->drawLine(x0,y0,x1,y1);

		// update
		x1 = x;
		y1 = y;

		// User is still in the process of drawing, draw the new line, add it to the polygon
		// and move on waiting for the next click/release.
		gc->drawLine(x0,y0,x1,y1);
		poly->addVertex(x1,y1,curColor);

		// Set the starting point of the line to the end point of this line
		x0=x1;
		y0=y1;
	}
	else if(dragging)
	{
		if(point)
		{
			gc->setPixel(x1,y1);
		}
		else if(line)
		{
			gc->drawLine(x0,y0,x1,y1);
		}
		else if(circle)
		{
			gc->drawCircle(x0,y0,calcRadius(x0,y0,x1,y1));
		}
		else if(rectangle)
		{
			calcRectangle(x0,y0,x1,y1);
			drawRectangle(gc);
		}
		else if(polygon)
		{
			// Should never get here seen as dragging is disabled for polygon
			// If program does get here??? Good Luck
			std::cout << "How Did I Possibly get here?" << std::endl;
		}

		// update
		x1 = x;
		y1 = y;

		// go back to COPY mode
		gc->setMode(GraphicsContext::MODE_NORMAL);

		if(point)
		{
			Shape* point1 = new Point(x1,y1,curColor);
			image->add(point1);
			point1->draw(gc);
		}
		else if(line)
		{
			Shape* line1 = new Line(x0,y0,x1,y1,curColor);
			image->add(line1);
			line1->draw(gc);
		}
		else if(circle)
		{
			Shape* circle1 = new Circle(x0,y0,calcRadius(x0,y0,x1,y1),curColor,fill);
			image->add(circle1);
			circle1->draw(gc);
		}
		else if(rectangle)
		{
			calcRectangle(x0,y0,x1,y1);
			Shape* rec = new Rectangle(verticies[0],verticies[1],verticies[2],verticies[3],fill);
			image->add(rec);
			rec->draw(gc);
		}
		else if(polygon)
		{
			// Should never get here seen as dragging is disabled for polygon
			// If program does get here??? Good Luck
			std::cout << "How Did I Possibly get here?" << std::endl;
		}

		// clear flag
		dragging = false;
	}
	return;
}

void MyDrawing::mouseMove(GraphicsContext* gc, int x, int y)
{
	// In the process of drawing a polygon, and the mouse moved,
	// rubber band the line, and keep moving
	if(drawingPoly)
	{
		gc->drawLine(x0,y0,x1,y1);

		// update
		x1 = x;
		y1 = y;

		gc->drawLine(x0,y0,x1,y1);
	}

	if(dragging)
	{
		// mouse moved - "undraw" old shape, then re-draw in new position
		// will already be in XOR mode if dragging

		if(point)
		{
			gc->setPixel(x1,y1);
		}
		else if(line)
		{
			gc->drawLine(x0,y0,x1,y1);
		}
		else if(circle)
		{
			gc->drawCircle(x0,y0,calcRadius(x0,y0,x1,y1));
		}
		else if(rectangle)
		{
			calcRectangle(x0,y0,x1,y1);
			drawRectangle(gc);
		}
		else if(polygon)
		{
			// Should never get here seen as dragging is disabled for polygon
			// If program does get here??? Good Luck
			std::cout << "How Did I Possibly get here?" << std::endl;
		}

		// update
		x1 = x;
		y1 = y;

		if(point)
		{
			gc->setPixel(x1,y1);
		}
		else if(line)
		{
			gc->drawLine(x0,y0,x1,y1);
		}
		else if(circle)
		{
			gc->drawCircle(x0,y0,calcRadius(x0,y0,x1,y1));
		}
		else if(rectangle)
		{
			calcRectangle(x0,y0,x1,y1);
			drawRectangle(gc);
		}
		else if(polygon)
		{
			// Should never get here seen as dragging is disabled for polygon
			// If program does get here??? Good Luck
			std::cout << "How Did I Possibly get here?" << std::endl;
		}
	}

	return;
}

/*
 * Calculates the radius of a circle, could technically find the radius of any other given line,
 * but kind of not necessary. Using pythagrium theorem, calculates the radius of a circle.
 *
 * 	c^2 = a^2 + b^2
 *
 * Arguments:
 * 	int x0 and y0 specify the starting point of the leg of the right triangle
 * 	int x1 and y0 specify the end point of the leg of the right triangle
 */
int MyDrawing::calcRadius(int x0,int y0,int x1,int y1)
{
	int a = abs(y1-y0);
	int b = abs(x1-x0);

	int aSqr = pow(a,2);
	int bSqr = pow(b,2);

	return sqrt(aSqr + bSqr);
}

/*
 * Calculates the vertices of a rectangle being drawn, assumes the rectangle is
 * perfectly horizontal and vertical, ie:
 * 				 (x1,y1)
 * 		---------
 * 		|		|
 * 		---------
 * (x0,y0)
 *
 * Arguments:
 * x0 and y0 specify the origin of the rectangle
 * x1 and y1 specify the diagonal point of the rectangle
 */
void MyDrawing::calcRectangle(int x0,int y0,int x1, int y1)
{
	verticies[0].x = x0;
	verticies[0].y = y0;
	verticies[0].color = curColor;

	verticies[1].x = x1;
	verticies[1].y = y0;
	verticies[1].color = curColor;

	verticies[2].x = x1;
	verticies[2].y = y1;
	verticies[2].color = curColor;

	verticies[3].x = x0;
	verticies[3].y = y1;
	verticies[3].color = curColor;
}

/*
 * Iterate through the array of rectangle vertex to draw the rectangle
 */
void MyDrawing::drawRectangle(GraphicsContext* gc)
{
	for(int i = 0; i < 3; i++)
	{
		gc->drawLine(verticies[i].x,verticies[i].y,verticies[i+1].x,verticies[i+1].y);
	}
	gc->drawLine(verticies[3].x,verticies[3].y,verticies[0].x,verticies[0].y);
}

/*
 * Opens up a file then calls the image out function to save the image to the file
 */
void MyDrawing::imageOut()
{
	std::ofstream imageFileOut;
	imageFileOut.open("resources/image.txt",std::ofstream::out);
	image->out(imageFileOut);
	imageFileOut.close();
}

/*
 * Opens up a file that should contain the output of a image, read the file into the
 * image
 */
void MyDrawing::imageIn()
{
	image->erase();
	std::ifstream imageFileIn;
	imageFileIn.open("resources/image.txt",std::ofstream::in);
	image->in(imageFileIn);
	imageFileIn.close();
}

/*
 * Clear any flags that may be set that should not always be set for
 * every function
 */
void MyDrawing::reset()
{
	dragging = false;
	point = false;;
	line = false;
	circle = false;
	rectangle = false;
	polygon = false;
	color = false;
	fill = false;
	drawingPoly = false;
	paintBucket = false;
}

