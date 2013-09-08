/*
 * 1.	While working on this lab, the main issue that I ran into was loading the font file. It was a rather stupid error that I made
 * 		basically I had the letterIndex variable inside the while(!strm.eof) loop, and no letters were working, it took a while for me
 * 		to realize that this variable should be outside, otherwise the 'A' spot would constantly be overwritten. So I made this correction
 * 		and all was good afterwards.
 *
 * 		The other "issue" that I had, was making the font file itself, it wasn't really an issue, just more of a very tedious process that I
 * 		never want to do again, but probably will.
 *
 * 2.	To read in a image from file, I first knew that each image was stored on its own line on the file, and each image was denoted by a one letter char
 * 		at the start of the line. Using the one letter char as a switch element, I used a switch-case to create the appropriate inherited Shape*, loaded the
 * 		parameters from file using the corresponding classes in function, and then stored the temporary Shape* into a vector that holds are Shape*s.
 *
 * 3.	I tested the Image assignment operator by first opening a image from a file, I then assigned a new Image (assignedImage) equal to the Image created by the file.
 * 		I then called the draw method on the assignedImage, and verified it was drawn exactly like the original image.
 */
/*
 * main.cpp
 *
 *  Created on: Jan 13, 2012
 *      Author: Casey Stark
 */


#include "polygon.h"
#include "rectangle.h"
#include "circle.h"
#include "line.h"
#include "point.h"
#include "shape.h"
#include "x11context.h"
#include "bitmapfont.h"
#include "image.h"
#include <fstream>


int main()
{
	// Make Circles
	Shape* circle = new Circle(350,300,50,0x000000,true);

	// Make Rectangle
	Vertex recVer[4];
	recVer[0].x=50;recVer[0].y=50;recVer[0].color=0x0000ff;
	recVer[1].x=50;recVer[1].y=200;recVer[1].color=0xffffff;
	recVer[2].x=300;recVer[2].y=200;recVer[2].color=0x080808;
	recVer[3].x=300;recVer[3].y=50;recVer[3].color=0x808080;

	Shape* rec = new Rectangle(recVer[0],recVer[1],recVer[2],recVer[3],true);

	Shape* polygon = new Polygon(5,400,0x696969,true);
	polygon->addVertex(400,400,0x895436);
	polygon->addVertex(197.5,5,0x741258);

	Image* image = new Image();
	image->add(polygon);
	image->add(rec);
	image->add(circle);

	GraphicsContext* originalGc = new X11Context(800,600,GraphicsContext::WHITE);

	std::ifstream fontFile;

	fontFile.open("font.txt",std::ifstream::in);

	Bitmapfont* bf = new Bitmapfont(fontFile);

	bf->draw("HELLO WORLD",10,10,0x000000,originalGc);

	bf->draw("BELOW TESTS UPERCASE CHARACTERS",10,150,0x000000,originalGc);
	bf->draw("ABCDEFGHIJKLM", 10,175,0x000000,originalGc);
	bf->draw("NOPQRSTUVWXYZ", 10, 200,0x000000,originalGc);

	bf->draw("BELLOW TESTS LOWERCASE CHARACTERS",10,50,0x000000,originalGc);
	bf->draw("abcdefghijklm",10,75,0x000000,originalGc);
	bf->draw("nopqrstuvwxyz",10,100,0x000000,originalGc);

	sleep(5);
	originalGc->clear();

	fontFile.close();

	bf->draw("ORIGINAL IMAGE",10,500,0x000000,originalGc);

	std::ofstream imageFileOut;

	imageFileOut.open("image.txt",std::ofstream::out);

	image->draw(originalGc);

	image->out(imageFileOut);

	delete image;

	imageFileOut.close();

	GraphicsContext* newGc = new X11Context(800,600,GraphicsContext::WHITE);

	std::ifstream imageFileIn;

	imageFileIn.open("image.txt",std::ofstream::in);

	Image* inImage = new Image();

	inImage->in(imageFileIn);

	imageFileIn.close();

	Image* assignImage = new Image();

	assignImage = inImage;

	bf->draw("IMAGE FROM FILE",10,500,0x000000,newGc);

	assignImage->draw(newGc);

	sleep(5);

	delete assignImage;
	delete newGc;
	delete inImage;
	delete originalGc;

	delete rec;
	delete circle;
	delete bf;

	return 0;
}


