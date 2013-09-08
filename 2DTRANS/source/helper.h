/*
 * helper.h
 *
 *  Created on: Feb 18, 2012
 *      Author: casey
 */

#ifndef HELPER_H_
#define HELPER_H_

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


#endif /* HELPER_H_ */
