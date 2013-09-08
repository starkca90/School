/*
 * line.cpp
 *
 *  Created on: Jan 12, 2012
 *      Author: Casey
 */

#include "line.h"
#include <cmath>

// Constructor with defaults set
// Make line for origin to (1,1) with a
Line::Line(double x1, double y1, double x2, double y2, int color)
{
	start.x = x1;
	start.y = y1;
	start.color = color;

	end.x = x2;
	end.y = y2;
	end.color = color;
}

Line::Line(Vertex start,Vertex end)
{
	this->start = start;
	this->end = end;
}

// Destructor - Nothing to do in this
Line::~Line()
{
	// Nothing to do
}

// Copy Constructor
Line::Line(const Line& from)
{
	start = from.start;
	end = from.end;
}

// Draw Method
void Line::draw(GraphicsContext* gc, viewcontext* vc)
{
	Vertex p1,p2;
	/*
	 * Scan convert the two endpoints
	 * converts the double values to pixel space
	 */
	p1.x = (int)floor(start.x+0.5);
	p1.y = (int)floor(start.y+0.5);

	p2.x = (int)floor(end.x+0.5);
	p2.y = (int)floor(end.y+0.5);

	p1 = vc->modelToDevice(p1);
	p2 = vc->modelToDevice(p2);

	gc->setColor(end.color);
	gc->drawLine(p1.x,p1.y,p2.x,p2.y);
}

// Modified out method
std::ostream& Line::out(std::ostream& os) const
{
	os << "L\t" << start.x << "\t" << start.y << "\t"
			<< start.color << "\t" << end.x << "\t" << end.y << "\t"
			<< end.color << std::endl;
	return os;
}

// Modified in method
void Line::in(std::istream& is)
{
	is >> start.x;
	is >> start.y;
	is >> start.color;

	is >> end.x;
	is >> end.y;
	is >> end.color;
}

Line* Line::clone() const
{
	return new Line(*this);
}

// Assignment operator
Line& Line::operator=(const Line& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	start = rhs.start;

	end = rhs.end;

	return *this;
}


