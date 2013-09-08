/*
 * image.cpp
 *
 *  Created on: Jan 24, 2012
 *      Author: casey
 */

#include "image.h"

// Constructor
Image::Image()
{
	// Nothing to do here
}

// Copy Constructor
Image::Image(const Image& from)
{
	// Iterate through the image vector of from
	// and push each Shape* to the back of the vector
	for(unsigned int i=0; i < from.image.size(); i++)
	{
		image.push_back(from.image[i]);
	}
}

// Destructor
Image::~Image()
{
	while(image.size() > 0)
	{
		delete image.back();
		image.pop_back();
	}
}

// Draw all the stored shapes onto gc
void Image::draw(GraphicsContext* gc)
{
	// Iterate through the vector
	// call each shape's draw method
	for(unsigned int i = 0; i < image.size(); i++)
	{
		image[i]->draw(gc);
	}
}

// Add newShape to existing image
void Image::add(Shape* newShape)
{
	image.push_back(newShape);
}

// Modified out method
std::ostream& Image::out(std::ostream& os) const
{
	// Iterate through the image, calling each
	// shapes << operator
	for(unsigned int i = 0; i < image.size(); i++)
	{
		os << *image[i] << std::endl;
	}

	return os;
}

// Modified in method
void Image::in(std::istream& is)
{
	char id;
	Shape* shape;
	while(!is.eof())
	{
		is >> id;
		switch(id)
		{
		case 'P':
			shape = new Point(0);
			break;
		case 'L':
			shape = new Line(0);
			break;
		case 'C':
			shape = new Circle(0);
			break;
		case 'R':
			shape = new Rectangle(0);
			break;
		case 'X':
			shape = new Polygon(0,0,0,false);
			break;
		default:
			std::cout << "Invalid Shape in File" << std::endl;
			break;
		}
		shape->in(is);
		image.push_back(shape);
	}
}

// Clone method
Image* Image::clone() const
{
	return new Image(*this);
}

// Erases all shapes, frees any alocated memory
void Image::erase()
{
	while(image.size() > 0)
	{
		delete image.back();
		image.pop_back();
	}
}

// Assignment Operator
Image& Image::operator=(const Image& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	for(unsigned int i = 0; i < rhs.image.size(); i++)
	{
		image[i] = rhs.image[i];
	}

	return *this;
}


