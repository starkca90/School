/*
 * line.h
 *
 *  Created on: Jan 12, 2012
 *      Author: Casey
 */

#ifndef LINE_H_
#define LINE_H_

#include "shape.h"

class Line : public Shape
{
public:

	// Constructor that accepts x y and color values
	// Default set so line goes from 0,0 to 1,1 and white
	Line(double x1=0.0, double y1=0.0, double x2=1.0, double y2=1.0, int color=0xffffff);

	// Constructor that accepts two struct vertex elements
	Line(Vertex start=NULL,Vertex end=NULL);

	// Destructor - Nothing to do in this
	~Line();

	// Copy Constructor
	Line(const Line& from);

	// Draw Method
	void draw(GraphicsContext* gc);

	// Modified out method
	std::ostream& out(std::ostream& os) const;

	// Modified in method
	void in(std::istream& is);

	Line* clone() const;

	// Never should call this method, but just in case, have it do nothing
	// This method is available to all shapes, but really only used in polygon
	void addVertex(double x,double y,int color){};

	void addVertex(Vertex newVertex){};

protected:

	// Assignment operator
	Line& operator=(const Line& rhs);

private:

	// Private variable to store end point vertex
	struct Vertex start, end;
};


#endif /* LINE_H_ */
