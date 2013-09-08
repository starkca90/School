/*
 * circle.h
 *
 *  Created on: Jan 14, 2012
 *      Author: Casey
 */

#ifndef CIRCLE_H_
#define CIRCLE_H_

#include "shape.h"

class Circle : public Shape
{
public:

	// Constructor with default values
	Circle(double x=1.0, double y=1.0, double radius=1.0, int borderColor=0xffffff, bool fill=false);

	// Constructor that accepts a vertex acting as midpoint with a
	// radius of 0 if not given
	Circle(Vertex midpoint=NULL, double radius=0.0, bool fill=false);

	// Copy Constructor
	Circle(const Circle& src);

	// Destructor
	~Circle();

	// Draw the circle
	void draw(GraphicsContext* gc);

	// Output the circles attributes
	std::ostream& out(std::ostream& os) const;

	// Read in the circles attributes
	void in(std::istream& is);

	Circle* clone() const;

protected:

	// Assignment Operator
	Circle& operator=(const Circle& rhs);

private:

	Vertex midpoint;
	double radius;
	bool fill;

};


#endif /* CIRCLE_H_ */
