OPTIONS = --std=c++11
SOURCE_FILES = test-doukaku.cpp sample-solver.cpp
TARGET = test-doukaku

$(TARGET) : $(SOURCE_FILES)
	g++ $(OPTIONS) -o $@ $+

clean :
	rm -f *.o $(TARGET)
