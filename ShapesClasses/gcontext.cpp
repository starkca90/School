/* This is an abstract base class representing a generic graphics
 * context.  Most implementation specifics will need to be provided by
 * a concrete implementation.  See header file for specifics. */

#define _USE_MATH_DEFINES	// for M_PI
#include <cmath>	// for trig functions
#include "gcontext.h"
#include <iostream>

/*
 * Destructor - does nothing
 */
GraphicsContext::~GraphicsContext()
{
	// nothing to do
	// here to insure subclasses handle destruction properly
}


/* Concrete implementation of line drawing method.
 * Based on Bresenham's line algorithm which using only integer math, and uses
 * only addition, subtraction and some bit shifting.
 *
 * Some ideas borrowed from :
 * 	http://www.codekeep.net/snippets/e39b2d9e-0843-4405-8e31-44e212ca1c45.aspx
 * 
 * Parameters:
 * 	x0, y0 - origin of line
 *  x1, y1 - end of line
 * 
 * Returns: void
 */
void GraphicsContext::drawLine(int x0, int y0, int x1, int y1)
{
	int d, x, y;

	// Swap points if origin is to right of end
	if(x0 > x1)
	{
		x = x0; x0 = x1; x1 = x;
		y = y0; y0 = y1; y1 = y;
	}

	// To help make the operation quicker for trivial conditions,
	// handle them seperatly.

	// Vertical Line
	if(x0 == x1)
	{
		if(y0 > y1)
		{
			y = y0; y0 = y1; y1 = y;
		}


		x = x0;
		y = y0;

		for(;y <= y1; y++)
		{
			setPixel(x,y);
		}
	}
	
	// Horizontal Line
	else if(y0 == y1)
	{
		x = x0;
		y = y0;

		for(;x <= x1; x++)
		{
			setPixel(x,y);
		}
	}

	// Non-Trivial Conditions
	else
	{
		int dy = y1 - y0;
		int dx = x1 - x0;

		// Calculate some constant values during algorithm
		int dy2 = (dy << 1); // Bit shifting by 1 is the same as *2
		int dx2 = (dx << 1);
		int dy2_minus_dx2 = dy2 - dx2;
		int dy2_plus_dx2 = dy2 + dx2;

		// Positive Line
		if(dy >= 0)
		{
			// Moves across x faster than y, iterate x
			if(dy <= dx)
			{
				d = dy2 - dx;

				x = x0;
				y = y0;
				while(x <= x1)
				{
					setPixel(x,y);

					// Point resides mostly in current y point
					// do not increment y
					if(d < 0)
					{
						d += dy2;
					}

					// Point resides closer to y+1
					// increment y
					else
					{
						y++;
						d += dy2_minus_dx2;
					}

					x++;
				}
			}

			// Moving faster through y, iterate about y
			// Mirror about y=x line
			else
			{
				d = dx2 - dy;
				y = y0;
				x = x0;
				while(y <= y1)
				{
					setPixel(x,y);

					if(d <= 0)
					{
						d += dx2;
					}
					else
					{
						x++;
						d -= dy2_minus_dx2;
					}
					y++;
				}
			}
		}

		// Negative slopping line
		else
		{
			// Moving faster about x, iterate about x
			if(dx >= -dy)
			{
				d = -dy2 - dx;

				x = x0;
				y = y0;
				while(x <= x1)
				{
					setPixel(x,y);
					if(d <= 0)
					{
						d -= dy2;
					}
					else
					{
						y--;
						d -= dy2_plus_dx2;
					}
					x++;
				}
			}

			// Moving faster about y, iterate about y
			// Mirror about y=x
			else
			{
				d = dx2 + dy;

				y = y0;
				x = x0;
				while(y >= y1)
				{
					setPixel(x,y);
					if(d <= 0)
					{
						d += dx2;
					}
					else
					{
						x++;
						d += dy2_plus_dx2;
					}
					y--;
				}
			}
		}
	}
}



/* Concrete implementation of circle drawing method.
 * Uses integer based midpoint circle implementation.
 * All calculations are based at the origin of the screen, then
 * once the pixel is printed, the pixel is adjusted so it prints at the
 * correct value with x0 and xy as the origin.
 * 
 * Some Ideas Shared with:
 * 	http://en.wikipedia.org/wiki/Midpoint_circle_algorithm
 *
 * Parameters:
 * 	x0, y0 - origin/center of circle
 *  radius - radius of circle
 * 
 * Returns: void
 */
void GraphicsContext::drawCircle(int x0, int y0, unsigned int radius)
{
	int x = 0; int y = radius; int f = 1 - radius;

	// Set some "helper" variables
	int F_x = 1;
	int F_y = -2 * radius;

	// Turn on the pixels on the axis
	setPixel(x0, y0+y);
	setPixel(x0, y0-y);
	setPixel(x0+y, y0);
	setPixel(x0-y, y0);

	while(x < y)
	{
		//The point is more the lower point, make appropriate corrections
		if(f >= 0)
		{
			y--;
			F_y += 2;
			f += F_y;
		}

		x++;
		F_x += 2;
		f += F_x;

		// Turn on the points, turn on all 8, two for each quadrant
		setPixel(x0+x, y0+y);
		setPixel(x0-x, y0+y);
		setPixel(x0+x, y0-y);
		setPixel(x0-x, y0-y);

		setPixel(x0+y, y0+x);
		setPixel(x0-y, y0+x);
		setPixel(x0+y, y0-x);
		setPixel(x0-y, y0-x);
	}
}

void GraphicsContext::endLoop()
{
	run = false;
}

void GraphicsContext::fill(int x, int y, int color)
{
	int pixColor = getPixel(x,y);
	if(pixColor != color)
	{
		setPixel(x,y);
		// Check Right Pixel
		fill(x+1,y,color);
		// Check Top Pixel
		fill(x,y+1,color);
		// Check Left Pixel
		fill(x-1,y,color);
		// Check Bottom Pixel
		fill(x,y-1,color);
	}
}


