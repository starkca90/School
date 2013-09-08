CC=g++
CFLAGS=-c -g -Wall
LDFLAGS= -lX11
SOURCES=main.cpp gcontext.cpp x11context.cpp shape.cpp point.cpp line.cpp circle.cpp rectangle.cpp polygon.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=ShapesClasses

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm *.o
	rm $(EXECUTABLE)
