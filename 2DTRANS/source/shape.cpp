///////////////////////////////////////////////////////////
//  shape.cpp
//  Implementation of the Class Shape
//  Created on:      10-Jan-2012 10:37:59 AM
//  Original author: Casey Stark
///////////////////////////////////////////////////////////

#include "shape.h"

/*
 * Default no-parameter constructor
 * sets the vertex to the origin, and colors it white
 */
Shape::Shape()
{
	vertex.x = 0.0;
	vertex.y = 0.0;
	vertex.color = 0xffffff;
}

/*
 * Constructor with doubles and ints passed in
 * Construct a vertex with the values.
 */
Shape::Shape(double x,double y, int color)
{
	vertex.x = x;
	vertex.y = y;
	vertex.color = color;
}

/*
 * Constructor that accepts a Vertex
 * sets the private vertex equal to the passed in
 * vertex
 */
Shape::Shape(Vertex vertex)
{
	this->vertex = vertex;
}

// Copy constructor - make a new shape just like rhs
Shape::Shape(const Shape& from)
{
	vertex.x = from.vertex.x;
	vertex.y = from.vertex.y;
	vertex.color = from.vertex.color;
}

// Destructor - Free allocated memory
Shape::~Shape()
{
	// Nothing to do
}

std::ostream& Shape::out(std::ostream& os) const
{
	os << "Shape\t" << vertex.x << "\t" << vertex.y << "\t" << vertex.color << std::endl;

	return os;
}

void Shape::in(std::istream& is)
{
	is >> vertex.x;
	is >> vertex.y;
	is >> vertex.color;
}

std::ostream& operator<<(std::ostream& os, const Shape& rhs)
{
	return rhs.out(os);
}
