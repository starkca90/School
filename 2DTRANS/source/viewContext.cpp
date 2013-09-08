#include "viewContext.h"
#include "gcontext.h"
#include <cmath>

/*
 * Default Constructor
 * Author: Casey Stark
 * Date January 1 2012
 * Parameters: M matrix, IM matrix, zoom, and theta
 * Returns: Nothing
 */
viewcontext::viewcontext():M(3,3),IM(3,3),zoom(1),theta(0){
	M.clear();
	IM.clear();
	pan.x = 400;
	pan.y = 300;
	pan.color = 0xff0000;
	zoom = 1;
	calcM();
}




// Convert coordinates to device
Vertex viewcontext::modelToDevice(Vertex c)
{
	Matrix temp(3,1);
	temp[0][0] = c.x;
	temp[1][0] = c.y;
	temp[2][0] = 1;
	temp = M*temp;
	Vertex ret;
	ret.x = temp[0][0];
	ret.y = temp[1][0];
	return ret;
}

// Convert Coordinates to model
Vertex viewcontext::deviceToModel(Vertex c)
{
	Matrix temp(3,1);
	temp[0][0] = c.x;
	temp[1][0] = c.y;
	temp[2][0] = 1;
	temp = IM*temp;
	Vertex ret;
	ret.x = temp[0][0];
	ret.y = temp[1][0];
	return ret;
}

// Gets the zoom distance
float viewcontext::getZoom()
{
	return zoom;
}

// Zooms the window
void viewcontext::zoomIn()
{
	if(zoom <=5)
	{
		zoom += 0.05;
		calcM();
	}
}

// Unzooms the window
void viewcontext::zoomOut()
{
	if(zoom > 0.05)
	{
		zoom += -0.05;
		calcM();
	}
}

// Move the window left
void viewcontext::panLeft()
{
	pan.x += -10;
	calcM();
}

// Moves the window right
void viewcontext::panRight()
{
	pan.x += 10;
	calcM();
}

// Moves the window up
void viewcontext::panUp()
{
	pan.y += 10;
	calcM();
}

// Moves the window down
void viewcontext::panDown()
{
	pan.y += -10;
	calcM();
}

// Rotates window CCW
void viewcontext::rotateCCW()
{
	theta += -.15;
	calcM();
}

// Rotates the window CW
void viewcontext::rotateCW()
{
	theta += .15;
	calcM();
}

// Resets the window back to original
void viewcontext::reset()
{
	zoom = 1;
	pan.x = 400;
	pan.y = 300;
	theta = 0;
	calcM();
}

// calculate the CTM given all transformations
void viewcontext::calcM()
{
	Matrix T(3,3);
	Matrix S(3,3);
	Matrix R(3,3);
	Matrix F(3,3);

	// Create Scale Matrix
	S[0][0] = zoom;
	S[0][1] = 0;
	S[0][2] = 0;
	S[1][0] = 0;
	S[1][1] = zoom;
	S[1][2] = 0;
	S[2][0] = 0;
	S[2][1] = 0;
	S[2][2] = 1;

	// Build Translation Matrix
	T[0][0] = 1;
	T[0][1] = 0;
	T[0][2] = pan.x;
	T[1][0] = 0;
	T[1][1] = 1;
	T[1][2] = pan.y;
	T[2][0] = 0;
	T[2][1] = 0;
	T[2][2] = 1;

	// Build Roation Matrix
	R[0][0] = cos(theta);
	R[0][1] = -sin(theta);
	R[0][2] = 0;
	R[1][0] = sin(theta);
	R[1][1] = cos(theta);
	R[1][2] = 0;
	R[2][0] = 0;
	R[2][1] = 0;
	R[2][2] = 1;

	// Build the Mirror about Y-axis Matrix
	F[0][0] = 1;
	F[0][1] = 0;
	F[0][2] = 0;
	F[1][0] = 0;
	F[1][1] = -1;
	F[1][2] = 0;
	F[2][0] = 0;
	F[2][1] = 0;
	F[2][2] = 1;

	M = T * R * F * S; //calculate the transformation matrix

	IM = !M; //calculate transformation matrix inverse
}

