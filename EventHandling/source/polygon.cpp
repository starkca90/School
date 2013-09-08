/*
 * polygon.cpp
 *
 *  Created on: Jan 14, 2012
 *      Author: Casey Stark
 */

#include "polygon.h"
#include <cmath>

Polygon::Polygon()
{
	points = 0;
	verticies = new Vertex[0];
}

/*
 * Constructor: Takes in an array of Vertex that must match
 * the same number as passed in with points. If points is not
 * the same as the number of Vertex, there is no knowing what may happen
 *
 * This also assumes that the user is checking their own work, and that they are
 * entering the points in an order that will not cause the edges to interset,
 * thus violating the polygon laws.
 *
 * Parameters: 	int points:		 	Number of verticies desired
 * 				Vertex verticies[]:	Verticies for polygon
 */
Polygon::Polygon(int points,Vertex *verticies,bool fill)
{
	this->points = points;
	this->verticies = verticies;
	this->fill = fill;
}

/*
 * Constructor: Takes in two double values and one integer value
 * which resembles the x and y and color respectivly. These values are
 * then added to Vertex structure, which is then added to the verticies
 * list, and the point counter is updated accordingly.
 *
 * Parameters:	double x,y:		x and y values of original point
 * 				int color:		color of polygon border
 */
Polygon::Polygon(const double x,const double y,const int color,const bool fill)
{
	Vertex origin;
	origin.x=x;
	origin.y=y;
	origin.color=color;

	verticies = new Vertex[1];
	verticies[0] = origin;
	points=1;
	this->fill = fill;
}

// Copy Constructor
Polygon::Polygon(const Polygon& rhs)
{
	points = rhs.points;
	delete [] verticies;

	verticies = new Vertex[rhs.points];
	verticies = rhs.verticies;
	fill = rhs.fill;
}

// Destructor
Polygon::~Polygon()
{

}

/*
 * Draws the polygon to the GC
 *
 * Parameters:	GraphicsContext& gc:	GC to have rectangle drawn to
 */
void Polygon::draw(GraphicsContext* gc)
{
	int x[points], y[points];
	for(int i=0; i < points; i++)
	{
		x[i] = (int)floor(verticies[i].x+0.5);
		y[i] = (int)floor(verticies[i].y+0.5);
	}

	gc->setColor(verticies[0].color);
	for(int i=0; i < (points-1); i++)
	{
		gc->drawLine(x[i],y[i],x[i+1],y[i+1]);
	}
	gc->drawLine(x[points-1],y[points-1],x[0],y[0]);

	if(fill)
	{
		double xCen = 0;
		double yCen = 0;
		for(int i=0; i < points; i++)
		{
			xCen += verticies[i].x;
			yCen += verticies[i].y;
		}
		xCen = xCen/points;
		yCen = yCen/points;

		int xPoint = (int)floor(xCen+0.5);
		int yPoint = (int)floor(yCen+0.5);

		gc->setColor(verticies[0].color);
		//gc->bFill(xPoint,yPoint,verticies[0].color);
		gc->fFill(xPoint,yPoint,gc->getPixel(xPoint,yPoint));
	}
}

/*
 * Outputs Polygon's parameters to OS
 *
 * Parameters: ostream os: ostream to have parameters sent to
 *
 * Returns: os that was passed in, but with parameters added to it
 */
std::ostream& Polygon::out(std::ostream& os) const
{
	os << "X\t" << points << "\t";

	for(int i=0; i < points; i++)
	{
		os << verticies[i].x << "\t" << verticies[i].y << "\t" << verticies[i].color << "\t";
	}

	os << fill;

	os << std::endl;

	return os;
}

/*
 * Inputs polygons parameters from istream
 *
 * Parameters: istream that contains Polygon's parameters
 */
void Polygon::in(std::istream& is)
{
	is >> points;

	delete [] verticies;
	Vertex *temp = new Vertex[points];

	for(int i=0; i < points; i++)
	{
		is >> temp[i].x;
		is >> temp[i].y;
		is >> temp[i].color;
	}

	is >> fill;

	verticies = temp;
}

/*
 * Clones the current Polygon
 */
Polygon* Polygon::clone() const
{
	return new Polygon(*this);
}

/*
 * Adds a vertex to the current polygon, added vertex will be added to the end
 * of the list, does not take into account where the wise location of the point should be
 *
 * This assumes the user knows what they are doing, and they are adding the point to the proper
 * location in such a way they will not be violating polygon laws.
 *
 * Parameters: Vertex vertex:	New Vertex to be added
 */
void Polygon::addVertex(const Vertex newVertex)
{
	Vertex *temp = new Vertex[points+1];

	for(int i=0; i < points; i++)
	{
		temp[i] = verticies[i];
	}

	// Below is only for debug purpose, uncomment for testing only:
//	std::cout << vertex.x << " " << vertex.y << " " << vertex.color << std::endl;

	temp[points] = newVertex;

	points++;

	verticies = temp;
}

/*
 * Add a vertex to the current polygon, accepts two doubles and one integer, which are added to
 * a Vertex and added to verticies with appropriate values adjusted.
 *
 * Parameters:	double x,y:		Coordinates of new point
 * 				int color:		Color of new point
 */
void Polygon::addVertex(const double x,const double y,const int color)
{
	Vertex *temp = new Vertex[points+1];

	for(int i=0; i < points; i++)
	{
		temp[i] = verticies[i];
	}

	Vertex newPoint;
	newPoint.x=x;
	newPoint.y=y;
	newPoint.color=color;

	temp[points] = newPoint;

	points++;

	verticies = temp;
}

/*
 * Assignment operator
 *
 * Parameters:	Polygon to be assigned to this
 */
Polygon& Polygon::operator=(const Polygon& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	delete [] verticies;

	verticies = new Vertex[rhs.points];

	verticies = rhs.verticies;
	points = rhs.points;

	fill = rhs.fill;

	return *this;
}




