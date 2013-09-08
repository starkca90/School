/*
 * bitmapfont.cpp
 *
 *  Created on: Jan 25, 2012
 *      Author: casey
 */

#include "bitmapfont.h"

Bitmapfont::Bitmapfont(std::ifstream& strm)
{
	letters.resize(128);
	for(int i = 0; i < 128; i++)
	{
		letters[i].resize(20);

		for(int j = 0; j < 20; j++)
		{
			letters[i][j].resize(15);
		}
	}

	for(int c = 0; c < 128; c++)
	{
		for(int i = 0; i < 20; i++)
		{
			for(int j = 0; j < 15; j++)
			{
				letters[c][i][j] = 1;
			}
		}
	}

	if(!strm.good())
	{
		std::cout << "WARNING: FONT: File Invalid, setting all values to 1" << std::endl;
	}
	else
	{
		// Make the space ASCII character (32) blank
		for(int i = 0; i < 20; i++)
		{
			for(int j = 0; j < 15; j++)
			{
				letters[32][i][j] = 0;
			}
		}


		int letterIndex = 65;
		while(!strm.eof())
		{
			for(int i=0;i<20;i++)
			{
				for(int j = 0; j < 15; j++)
				{
					strm >> letters[letterIndex][i][j];
				}
			}
			letterIndex++;
		}
	}
}

Bitmapfont::~Bitmapfont()
{

}

void Bitmapfont::draw(char letter,int x,int y,int color,GraphicsContext* GC)
{
	int index = letter;
	GC->setColor(color);
	for(int i = 0; i < 20; i++)
	{
		for(int j = 0; j < 15; j++)
		{
			if(letters[index][i][j] == 1)
			{
				GC->setPixel(x+j, y+i);
			}
		}
	}
}

void Bitmapfont::draw(std::string word,int x,int y,int color,GraphicsContext* GC)
{
	for(unsigned int c = 0; c < word.size(); c++)
	{
		draw(word[c],x,y,color,GC);
		x=x+17;
	}
}
