#ifndef VIEWCONTEXT_H_
#define VIEWCONTEXT_H_

#include "matrix.h"
#include "helper.h"

/*
 * viewContext.h
 * Author: Casey Stark
 * Date February 1 2012
 * Purpose: Control transformation on the screen
 */

class viewcontext{
public:
	// Default Constructor
	viewcontext();

	// Convert coordinates to device
	Vertex modelToDevice(Vertex c);

	// Convert Coordinates to model
	Vertex deviceToModel(Vertex c);

	// Gets the zoom distance
	float getZoom();

	// Zooms the window
	void zoomIn();

	// Unzooms the window
	void zoomOut();

	// Move the window left
	void panLeft();

	// Moves the window right
	void panRight();

	// Moves the window up
	void panUp();

	// Moves the window down
	void panDown();

	// Rotates window CCW
	void rotateCCW();

	// Rotates the window CW
	void rotateCW();

	// Resets the window back to original
	void reset();

protected:

private:
	// calculate the CTM given all transformations
	void calcM();

	// Translation Matrix
	Matrix M;

	// Inverse of the translation
	Matrix IM;

	// Zoom Variable
	float zoom;

	// Coordinates for panning
	Vertex pan;

	// Rotation using theta
	float theta;
};


#endif /* VIEWCONTEXT_H_ */
