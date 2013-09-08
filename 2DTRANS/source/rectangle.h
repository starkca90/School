/*
 * rectangle.h
 *
 *  Created on: Jan 14, 2012
 *      Author: Casey Stark
 */

#ifndef RECTANGLE_H_
#define RECTANGLE_H_

#include "shape.h"
#include "viewContext.h"

class Rectangle : public Shape
{
public:
	// Constructor that accepts four of each x and y, and only 1 color
	Rectangle(double x1=0.0,double y1=0.0,double x2=0.0,double y2=1.0,
			double x3=1.0,double y3=1.0,double x4=1.0,double y4=0.0,int color=0xffffff, bool fill=false);

	// Constructor that accepts 4 vertex structures, and bool to determine if it should be filled or not
	Rectangle(struct Vertex vertex1,struct Vertex vertex2,struct Vertex vertex3,struct Vertex vertex4, bool fill);

	// Copy Constructor
	Rectangle(const Rectangle& rhs);

	// Destructor, dealocates RAM alocated to verticies
	~Rectangle();

	// Draw method for rectangle
	void draw(GraphicsContext* gc, viewcontext* vc);

	// Output rectangles attributes to ostream
	std::ostream& out(std::ostream& os) const;

	// inputs rectangles attributes from istream
	void in(std::istream& is);

	// Clone the current rectangle
	Rectangle* clone() const;

	// Never should call this method, but just in case, have it do nothing
	// This method is available to all shapes, but really only used in polygon
	void addVertex(double x,double y,int color){};

	void addVertex(Vertex newVertex){};

protected:

	// Assignment operator
	Rectangle& operator=(const Rectangle& rhs);

private:

	// Array that holds 4 Vertex symbolizing the 4 corners of the rectangle
	struct Vertex verticies[4];
	bool fill;
};

#endif /* RECTANGLE_H_ */
