/*
 * circle.cpp
 *
 *  Created on: Jan 14, 2012
 *      Author: Casey
 */

#include "circle.h"
#include <cmath>

// Constructor with default values
Circle::Circle(double x, double y, double radius, int color, bool fill)
{
	midpoint.x = x;
	midpoint.y = y;
	midpoint.color = color;
	this->radius = radius;
	this->fill = fill;
}

// Constructor that accepts a vertex acting as midpoint with a
// radius of 0 if not given
Circle::Circle(Vertex midpoint, double radius, bool fill)
{
	this->midpoint = midpoint;
	this->radius = radius;
	this->fill = fill;
}

// Copy Constructor
Circle::Circle(const Circle& src)
{
	midpoint = src.midpoint;
	radius = src.radius;
}

// Destructor
Circle::~Circle()
{
	// Nothing to destroy
}

// Draw the circle
void Circle::draw(GraphicsContext* gc)
{
	int x = (int)floor(midpoint.x+0.5);
	int y = (int)floor(midpoint.y+0.5);
	int radiusI = (int)floor(radius+0.5);

	gc->setColor(midpoint.color);
	gc->drawCircle(x,y,radiusI);

	if(fill)
	{
		// See fill.cpp for implementation of fill
		// Can also be seen at bottom of gcontext.cpp
		gc->fill(x,y,midpoint.color);
	}
}

// Output the circles attributes
std::ostream& Circle::out(std::ostream& os) const
{
	os << "Circle\t" << midpoint.x << "\t" << midpoint.y
			<< "\t" << radius << "\t" << midpoint.color << "\t" << fill << std::endl;

	return os;
}

// Read in the circles attributes
void Circle::in(std::istream& is)
{
	is >> midpoint.x;
	is >> midpoint.y;
	is >> radius;
	is >> midpoint.color;
	is >> fill;
}

Circle* Circle::clone() const
{
	return new Circle(*this);
}

// Assignment Operator
Circle& Circle::operator=(const Circle& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	midpoint = rhs.midpoint;
	radius = rhs.radius;

	return *this;
}


