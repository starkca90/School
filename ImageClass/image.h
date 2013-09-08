/*
 * image.h
 *
 *  Created on: Jan 24, 2012
 *      Author: casey
 */

#ifndef IMAGE_H_
#define IMAGE_H_

#include <vector>
#include "shape.h"

class Image : public Shape
{
public:
	// Constructor
	Image();

	// Copy Constructor
	Image(const Image& from);

	// Destructor
	~Image();

	// Draw all the stored shapes onto gc
	void draw(GraphicsContext* gc);

	// Add newShape to existing image
	void add(Shape* newShape);

	// Modified out method
	std::ostream& out(std::ostream& os) const;

	// Modified in method
	void in(std::istream& is);

	// Clone method
	Image* clone() const;

	// Erases all shapes, frees any alocated memory
	void erase();

protected:

	// Assignment Operator
	Image& operator=(const Image& rhs);

private:

	// Private variable to store all shapes stored
	std::vector<Shape*> image;
};


#endif /* IMAGE_H_ */
