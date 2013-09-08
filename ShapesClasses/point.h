/*
 * point.h
 *
 *  Created on: Jan 12, 2012
 *      Author: Casey Stark
 */

#ifndef POINT_H_
#define POINT_H_

#include "shape.h"

class Point : public Shape
{
public:

	// Constructor with defaults
	Point(double x=0.0, double y=0.0, int color=0xffffff);

	// Constructor
	Point(Vertex point=NULL);

	// Destructor
	~Point();

	// Copy Constructor
	Point(const Point& copy);

	// Draw the Point to gc
	void draw(GraphicsContext* gc);

	std::ostream& out(std::ostream& os) const;

	void in(std::istream& is);

	// Return a copy of the point
	Point* clone() const;

protected:

	// Assignment Operator
	Point& operator=(const Point& rhs);

private:

	struct Vertex point;

};

#endif /* POINT_H_ */
