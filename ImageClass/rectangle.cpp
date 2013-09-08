/*
 * rectangle.cpp
 *
 *  Created on: Jan 14, 2012
 *      Author: Casey Stark
 */

#include "rectangle.h"
#include <cmath>

Rectangle::Rectangle(double x1,double y1,double x2,double y2,
		double x3,double y3,double x4,double y4,int color, bool fill)
{
	verticies[0].x = x1;
	verticies[0].y = y1;
	verticies[0].color = color;

	verticies[1].x = x2;
	verticies[1].y = y2;
	verticies[1].color = color;

	verticies[2].x = x3;
	verticies[2].y = y3;
	verticies[2].color = color;

	verticies[3].x = x4;
	verticies[3].y = y4;
	verticies[3].color = color;

	this->fill = fill;
}

Rectangle::Rectangle(struct Vertex vertex1,struct Vertex vertex2, struct Vertex vertex3, struct Vertex vertex4, bool fill)
{
	this->verticies[0] = vertex1;
	this->verticies[1] = vertex2;
	this->verticies[2] = vertex3;
	this->verticies[3] = vertex4;
	this->fill = fill;
}

Rectangle::Rectangle(const Rectangle& rhs)
{
	verticies[0] = rhs.verticies[0];
	verticies[1] = rhs.verticies[1];
	verticies[2] = rhs.verticies[2];
	verticies[3] = rhs.verticies[3];
}

Rectangle::~Rectangle()
{

}

void Rectangle::draw(GraphicsContext* gc)
{
	// Iterate through the array and scan convert each point
	int x[4], y[4];

	for(int i=0; i < 4; i++)
	{
		x[i] = (int)floor(verticies[i].x+0.5);
		y[i] = (int)floor(verticies[i].y+0.5);
	}

	// Use the first points color as the color of the shape
	gc->setColor(verticies[0].color);

	/*
	 * Assuming the user entered the coordinates for each vertex in a reasonable
	 * method, meaning the first point is the one closest to the origin,
	 * and each point makes a right angle, iterate through the list, and plot their
	 * points, and make a line between.
	 */
	for(int i = 0; i < 3; i++)
	{
		gc->drawLine(x[i],y[i],x[i+1],y[i+1]);
	}
	gc->drawLine(x[3],y[3],x[0],y[0]);

	if(fill)
	{
		double xCen = 0;
		double yCen = 0;
		for(int i=0; i < 4; i++)
		{
			xCen += verticies[i].x;
			yCen += verticies[i].y;
		}
		xCen = xCen/4;
		yCen = yCen/4;

		int xPoint = (int)floor(xCen+0.5);
		int yPoint = (int)floor(yCen+0.5);

		gc->setColor(verticies[0].color);
		//gc->bFill(xPoint,yPoint,verticies[0].color);
		gc->fFill(xPoint,yPoint,gc->getPixel(xPoint,yPoint));
	}
}

/*
 * Output the parameters of the rectangle
 */
std::ostream& Rectangle::out(std::ostream& os) const
{
	os << "R\t";

	// Iterate through each vertex, and output the stored information
	for(int i=0; i < 4; i++)
	{
		os << verticies[i].x << "\t" << verticies[i].y << "\t" << verticies[i].color << "\t";
	}

	os << fill;

	os << std::endl;

	return os;
}

void Rectangle::in(std::istream& is)
{
	for(int i=0; i < 4; i++)
	{
		is >> verticies[i].x;
		is >> verticies[i].y;
		is >> verticies[i].color;
	}

	is >> fill;
}

Rectangle* Rectangle::clone() const
{
	return new Rectangle(*this);
}

Rectangle& Rectangle::operator=(const Rectangle& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	for(int i=0; i < 4; i++)
	{
		verticies[i] = rhs.verticies[i];
	}

	fill = rhs.fill;

	return *this;
}



