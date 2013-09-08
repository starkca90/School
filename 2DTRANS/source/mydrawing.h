/*
 * mydrawing.h
 *
 *  Created on: Feb 1, 2012
 *      Author: casey
 */

#ifndef MYDRAWING_H_
#define MYDRAWING_H_

#include "drawbase.h"
#include "image.h"
#include "viewContext.h"

// forward reference
class GraphicsContext;

class MyDrawing : public DrawingBase
{
	public:
		MyDrawing();

		~MyDrawing();
		// we will override just these
		virtual void paint(GraphicsContext* gc);
		virtual void keyUp(GraphicsContext* gc, unsigned int keycode);
		virtual void mouseButtonDown(GraphicsContext* gc, unsigned int button, int x, int y);
		virtual void mouseButtonUp(GraphicsContext* gc, unsigned int button, int x, int y);
		virtual void mouseMove(GraphicsContext* gc, int x, int y);

	protected:

		int calcRadius(int x0,int y0,int x1,int y1);
		void calcRectangle(int x0,int y0,int x1, int y1);
		void drawRectangle(GraphicsContext* gc);
		void imageOut();
		void imageIn();
		void reset();

		viewcontext vc;

	private:

		Vertex p0,p1;

		int curColor;

		Image* image;
		Shape* poly;

		bool dragging;
		bool point;
		bool line;
		bool circle;
		bool rectangle;
		bool polygon;
		bool color;
		bool fill;
		bool drawingPoly;
		bool paintBucket;
		bool pan;
		bool zoom;
		bool rotate;

		// Array of Vertex structures to hold the points of a rectangle
		Vertex verticies[4];
};
#endif /* MYDRAWING_H_ */
