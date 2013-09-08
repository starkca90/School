CC=g++
CFLAGS=-c -g -Wall
LDFLAGS= -lX11
SOURCES=main.cpp gcontext.cpp x11context.cpp shape.cpp point.cpp line.cpp circle.cpp rectangle.cpp polygon.cpp image.cpp bitmapfont.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=ImageClass

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm *.o
	rm $(EXECUTABLE)
