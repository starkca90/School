/*
 * bitmapfont.h
 *
 *  Created on: Jan 25, 2012
 *      Author: casey
 */

#ifndef BITMAPFONT_H_
#define BITMAPFONT_H_

#include "gcontext.h"
#include <string>
#include <iostream>
#include <fstream>
#include <vector>
using std::vector;

class Bitmapfont
{
public:

	// Constructor
	// Loads a font from file
	Bitmapfont(std::ifstream& is);

	// Destructor
	~Bitmapfont();

	// Print a single character to the screen
	void draw(char letter,int x,int y,int color,GraphicsContext* GC);

	// Print a string to the screen
	void draw(std::string word,int x,int y,int color,GraphicsContext* GC);

protected:


private:

	vector<vector<vector<int> > > letters;
};


#endif /* BITMAPFONT_H_ */
