/*
 * polygon.h
 *
 *  Created on: Jan 14, 2012
 *      Author: Casey Stark
 */

#ifndef POLYGON_H_
#define POLYGON_H_

#include "shape.h"
#include "viewContext.h"

class Polygon : public Shape
{
public:

	Polygon();

	/*
	 * Constructor: Takes in an array of Vertex that must match
	 * the same number as passed in with points. If points is not
	 * the same as the number of Vertex, there is no knowing what may happen
	 *
	 * Parameters: 	int points:		 	Number of verticies desired
	 * 				Vertex verticies[]:	Verticies for polygon
	 */
	Polygon(int points=0,Vertex *verticies=NULL,bool fill=false);

	/*
	 * Constructor: Takes in two double values and one integer value
	 * which resembles the x and y and color respectivly. These values are
	 * then added to Vertex structure, which is then added to the verticies
	 * list, and the point counter is updated accordingly.
	 *
	 * Parameters:	double x,y:		x and y values of original point
	 * 				int color:		color of polygon border
	 */
	Polygon(const double x=0.0,const double y=0.0, const int color=0xffffff,const bool fill=false);

	// Copy Constructor
	Polygon(const Polygon& rhs);

	// Destructor
	~Polygon();

	/*
	 * Draws the polygon to the GC
	 *
	 * Parameters:	GraphicsContext& gc:	GC to have rectangle drawn to
	 */
	void draw(GraphicsContext* gc, viewcontext* vc);

	/*
	 * Outputs Polygon's parameters to OS
	 *
	 * Parameters: ostream os: ostream to have parameters sent to
	 *
	 * Returns: os that was passed in, but with parameters added to it
	 */
	std::ostream& out(std::ostream& os) const;

	/*
	 * Inputs polygons parameters from istream
	 *
	 * Parameters: istream that contains Polygon's parameters
	 */
	void in(std::istream& is);

	/*
	 * Clones the current Polygon
	 */
	Polygon* clone() const;

	/*
	 * Adds a vertex to the current polygon, added vertex will be added to the end
	 * of the list, does not take into account where the wise location of the point should be
	 *
	 * Parameters: Vertex vertex:	New Vertex to be added
	 */
	void addVertex(const Vertex newVertex);

	/*
	 * Add a vertex to the current polygon, accepts two doubles and one integer, which are added to
	 * a Vertex and added to verticies with appropriate values adjusted.
	 *
	 * Parameters:	double x,y:		Coordinates of new point
	 * 				int color:		Color of new point
	 */
	void addVertex(const double x,const double y,const int color);

protected:

	/*
	 * Assignment operator
	 *
	 * Parameters:	Polygon to be assigned to this
	 */
	Polygon& operator=(const Polygon& rhs);

private:

	int points;

	Vertex *verticies;

	bool fill;

};


#endif /* POLYGON_H_ */
