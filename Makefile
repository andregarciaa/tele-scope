
ROOTCFLAGS = $(shell $(ROOTSYS)/bin/root-config --cflags)

ROOTLIBS   = $(shell $(ROOTSYS)/bin/root-config --libs)
ROOTGLIBS   = $(shell $(ROOTSYS)/bin/root-config --glibs)

# -g for gdb
# -pg for gprof
# -std=c++11

CXXFLAGS = -O2 -Wall -Wextra $(ROOTCFLAGS) -I/eudaq/eudaq/include/

scope53m: scope53m.cc
	g++ $(CXXFLAGS) scope53m.cc -o scope53m \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: scope53m'

scopes: scopes_2017.cc
	g++ $(CXXFLAGS) scopes_2017.cc -o scopes \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: scopes (2017 version)'

old_scopes: scopes.cc
	g++ $(CXXFLAGS) scopes.cc -o scopes \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: scopes'

edg53: edg53.cc
	g++ $(CXXFLAGS) edg53.cc -o edg53 \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: edg53'

scope53: scope53.cc
	g++ $(CXXFLAGS) scope53.cc -o scope53 \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: scope53'

tele: tele.cc
	g++ tele.cc $(CXXFLAGS) -fopenmp -o tele \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: tele'

ed53: ed53.cc
	g++ $(CXXFLAGS) ed53.cc -o ed53 \
	$(ROOTLIBS) -L/eudaq/eudaq/lib -lEUDAQ
	@echo 'done: ed53'
