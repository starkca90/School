/*
 * point.h
 *
 *  Created on: Jan 12, 2012
 *      Author: Casey Stark
 */

#ifndef POINT_H_
#define POINT_H_

#include "shape.h"
#include "viewContext.h"

class Point : public Shape
{
public:

	// Constructor with defaults
	Point(double x=0.0, double y=0.0, int color=0xffffff);

	// Constructor
	Point(Vertex point);

	// Destructor
	~Point();

	// Copy Constructor
	Point(const Point& copy);

	// Draw the Point to gc
	void draw(GraphicsContext* gc, viewcontext* vc);

	std::ostream& out(std::ostream& os) const;

	void in(std::istream& is);

	// Return a copy of the point
	Point* clone() const;

	// Never should call this method, but just in case, have it do nothing
	// This method is available to all shapes, but really only used in polygon
	void addVertex(double x,double y,int color){};

	void addVertex(Vertex newVertex){};

protected:

	// Assignment Operator
	Point& operator=(const Point& rhs);

private:

	struct Vertex point;

};

#endif /* POINT_H_ */
