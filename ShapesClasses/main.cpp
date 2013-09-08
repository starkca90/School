/*
*	1. Overall, I felt this lab went fairly smooth, I got stuck towards the begining, I got
*		Confused regarding how to access the private variables, but I figured to make new
*		private variables for each class, which then allowed me to continue to implement.
*		Another issue I ran into was for fill, when I first implemented fill, I had it that
*		the fill could be different than the border, but that was not working, so I decided to
*		remove that functionality. I then later realized that I was checking for the wrong color
*		I was checking for the fill color rather than the border color, so that is why it kept escaping
*		the boundaries, then causing the program to fail, but I didn't go back to make the appropriate changes
*		as I didn't feel them necessary at this time.
*
*	2. Each class that implements Shape will have their own color, so why not share it with the base class
*		I would use a getter and setter that would just return or set an integer value, this way I can
*		access the private member without violating any rules.
*
*	3. I took this into consideration while implementing my out method, I have it that whenever the out
*		method is called, the first thing I output is the name of that class, so it it is polygon, I output
*		"Polygon" as the first portion, then follow that by a tab, and continue on with any attributes it may
*		have. This way, I can send the file through a parser which contains a swtich, and calls the proper
*		in function depending on the first word of the line.
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

int main()
{
	std::cout << "***Starting Test***\n\n\n" << std::endl;

	std::cout << "Making new Shapes" << std::endl;

	// Make Point
	Shape* point = new Point(5,5,0x00ff00);

	// Make Line
	Shape* line = new Line(20,20,60,20,0x000000);
	std::cout << "Line Created" << std::endl;

	// Make Circles
	Shape* circle = new Circle(400,300,50,0x424242,true);
	std::cout << "Circle created, fill=true" << std::endl;

	Shape* circle2 = new Circle(10,10,5,false);
	std::cout << "Circle Created, fill=false" << std::endl;

	// Make Rectangle
	Vertex recVer[4];
	recVer[0].x=50;recVer[0].y=50;recVer[0].color=0x0000ff;
	recVer[1].x=50;recVer[1].y=200;recVer[1].color=0xffffff;
	recVer[2].x=300;recVer[2].y=200;recVer[2].color=0x080808;
	recVer[3].x=300;recVer[3].y=50;recVer[3].color=0x808080;

	Shape* rec = new Rectangle(recVer[0],recVer[1],recVer[2],recVer[3],true);
	std::cout << "Rectangle Created, fill=true" << std::endl;

	Shape* rec2 = new Rectangle(recVer[0],recVer[1],recVer[2],recVer[3],false);

	// Make Polygon
	Vertex polyVer[4];
	polyVer[0].x=10;polyVer[0].y=10;polyVer[0].color=0x000000;
	polyVer[1].x=10;polyVer[1].y=20;polyVer[1].color=0x000000;
	polyVer[2].x=20;polyVer[2].y=20;polyVer[2].color=0x000000;
	polyVer[3].x=20;polyVer[3].y=10;polyVer[3].color=0x000000;

	Polygon* poly = new Polygon(4,polyVer);
	std::cout << "4 Sided Polygon Created" << std::endl;

	Polygon* polygon = new Polygon(5,400,0x696969);
	polygon->addVertex(400,400,0x895436);
	polygon->addVertex(197.5,5,0x741258);

	GraphicsContext* gc = new X11Context(800,600,GraphicsContext::WHITE);

	polygon->draw(gc);
	sleep(5);
	gc->clear();

	std::cout << "\n\n\n***Shapes Created, GC created, start Draw Test***\n\n\n" << std::endl;

	point->draw(gc);
	std::cout << "Point Drawn, waiting" << std::endl;
	sleep(2);
	gc->clear();

	line->draw(gc);
	std::cout << "Line Drawn, waiting" << std::endl;
	sleep(2);
	gc->clear();


	circle->draw(gc);
	circle2->draw(gc);
	std::cout << "Circles Drawn, notice the fill??? Waiting" << std::endl;
	sleep(2);
	gc->clear();

	rec->draw(gc);
	std::cout << "Filled Rectangle Drawn, waiting" << std::endl;
	sleep(2);
	gc->clear();

	rec2->draw(gc);
	std::cout << "Unfilled Rectangle Drawn, waiting" << std::endl;
	sleep(2);
	gc->clear();

	poly->draw(gc);
	std::cout << "Basic Polygon Drawn, waiting" << std::endl;
	sleep(2);
	gc->clear();

	std::cout << "Now Adding Vertex to Polygon" << std::endl;
	Vertex newVertex;
	newVertex.x = 5;newVertex.y=5;newVertex.color=0x000000;
	poly->addVertex(newVertex);
	poly->draw(gc);
	std::cout << "Polygon with Added vertex drawn, waiting" << std::endl;
	sleep(2);
	gc->clear();

	delete gc;

	std::cout << "\n\n\n***Draw Tests Completed***\n\n\n";

	std::cout << "***Start Clone and Assignment Test***\n\n\n" << std::endl;
	std::cout << "Cloning Point" << std::endl;
	Shape* point2 = point->clone();
	std::cout << "Output Original Point\n" << point << "\t";
	std::cout << *point;
	std::cout << "Output Clone\n" << point2 << "\t";
	std::cout << *point2;
	delete point2;

	std::cout << "Cloning Line" << std::endl;
	Shape* line2 = line->clone();
	std::cout << "Output Original line\n" << line << "\t";
	std::cout << *line;
	std::cout << "Output Clone\n" << line2 << "\t";
	std::cout << *line2;
	delete line2;

	std::cout << "Cloning rectrangle" << std::endl;
	Shape* rec3 = rec->clone();
	std::cout << "Output Original Rectangle\n" << rec << "\t";
	std::cout << *rec;
	std::cout << "Output Clone\n" << rec3 << "\t";
	std::cout << *rec3;
	delete rec3;

	std::cout << "Cloning Circle" << std::endl;
	Shape* circle3 = circle->clone();
	std::cout << "Output Original circle\n" << circle << "\t";
	std::cout << *circle;
	std::cout << "Output Clone\n" << circle3 << "\t";
	std::cout << *circle3;
	delete circle3;

	std::cout << "Cloning Polygon" << std::endl;
	Shape* poly2 = poly->clone();
	std::cout << "Output Original Polygon\n" << poly << "\t";
	std::cout << *poly;
	std::cout << "Output Polygon\n" << poly2 << "\t";
	std::cout << *poly2;
	delete poly2;

	delete rec;
	delete rec2;
	delete poly;
	delete circle;
	delete circle2;
	delete line;
	delete point;

	return 0;
}


