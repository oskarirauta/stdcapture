all: test

CXX?=g++
CXXFLAGS?=--std=c++17

INCLUDES:=-I./include -I.

MAIN_OBJS:= \
	objs/main.o

STDCAPTURE_OBJS:= \
	objs/stdcapture.o

LIBS:=

objs/stdcapture.o: src/stdcapture.cpp
	 $(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $<;

objs/main.o: example/main.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $<;

test: $(SHARED_OBJS) $(STDCAPTURE_OBJS) $(MAIN_OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ $(LIBS) -o $@;

clean:
	rm -f objs/*.o test
