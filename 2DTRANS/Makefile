CC=g++
CFLAGS=-c -g -Wall
LDFLAGS= -lX11 -lm
SOURCES=source/main.cpp source/matrix.cpp source/gcontext.cpp source/x11context.cpp source/shape.cpp source/point.cpp source/line.cpp source/circle.cpp source/rectangle.cpp source/polygon.cpp source/image.cpp source/bitmapfont.cpp source/mydrawing.cpp source/viewContext.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=2DTrans

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm source/*.o
	rm $(EXECUTABLE)
