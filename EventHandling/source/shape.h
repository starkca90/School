///////////////////////////////////////////////////////////
//  shape.h
//  Implementation of the Class Shape
//  Created on:      10-Jan-2012 10:37:59 AM
//  Original author: Casey Stark
///////////////////////////////////////////////////////////

#ifndef SHAPE_H
#define SHAPE_H

#include <iostream>

#include "gcontext.h"

/*
 * Structure to defines a vertex of an object,
 * shows the vertex's x and y values, as well
 * as the corresponding color value
 */
struct Vertex
{
	double x;
	double y;
	int color;

	Vertex(double x0=0.0,double y0=0.0,int color0=0xffffff):x(x0),y(y0),color(color0){}
};

class Shape
{

public:

	// No argument Constructor
	Shape();

	// Constructor with defaults set
	Shape(double x,double y,int color);

	// Constructor that accepts a Vertex
	Shape(Vertex vertex);

	// Copy constructor - make a new shape just like rhs
	Shape(const Shape& rhs);

	// Destructor - Free allocated memory
	virtual ~Shape();

	// Draw method, declard pure virtual as a Shape should not be drawing anything
	virtual void draw(GraphicsContext* gc) =0;

	// Output the Shape's parameters to the given ostream
	virtual std::ostream& out(std::ostream& os) const;

	// Read in a Shape's parameters from the given istream
	virtual void in(std::istream& is);

	// Make a clone of the current Shape
	virtual Shape* clone() const =0;

	// Used only for polygon, but could be implemented
	// in other classes if needed
	virtual void addVertex(const double x, const double y, const int color){};

	virtual void addVertex(const Vertex newVertex){};

protected:

	// Assignment operator - Make this just like rhs
	Shape& operator=(const Shape& rhs);

private:

	Vertex vertex;
};

// Global Decleration of << operator
std::ostream& operator<<(std::ostream& os, const Shape& rhs);

#endif // !defined(EA_FE1B3F52_94EA_418f_9520_32FDC224D09B__INCLUDED_)
