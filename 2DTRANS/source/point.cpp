/*
 * point.cpp
 *
 *  Created on: Jan 12, 2012
 *      Author: Casey
 */

#include "point.h"
#include <cmath>

// Constructor with defaults
Point::Point(double x, double y, int color)
{
	point.x = x;
	point.y = y;
	point.color = color;
}

// Constructor with default values set
Point::Point(Vertex point)
{
	this->point = point;
}

// Destructor
Point::~Point()
{
	// Nothing to do
}

// Copy Constructor
Point::Point(const Point& copy)
{
	point = copy.point;
}

// Draw the Point to gc
void Point::draw(GraphicsContext* gc, viewcontext* vc)
{
	Vertex temp;
	/*
	 * Scan convert x and y values as doubles
	 * are not what we want for pixel space
	 */
	temp.x = (int)floor(point.x+0.5);
	temp.y = (int)floor(point.y+0.5);

	temp = vc->modelToDevice(temp);
	gc->setColor(point.color);
	gc->setPixel(temp.x,temp.y);
}

std::ostream& Point::out(std::ostream& os) const
{
	os << "P\t" << point.x << "\t" << point.y
			<< "\t" << point.color << std::endl;

	return os;
}

void Point::in(std::istream& is)
{
	is >> point.x;
	is >> point.y;
	is >> point.color;
}

// Return a copy of the point
Point* Point::clone() const
{
	return new Point(*this);
}

// Assignment Operator
Point& Point::operator=(const Point& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	point = rhs.point;

	return *this;
}

