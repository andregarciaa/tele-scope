
# user:
# set path to eudaq and GBL:
# export EUDAQ=/home/YOURID/eudaq
# export GBL=/home/YOURID/GBL/V01-17-00/cpp/lib/

ROOTCFLAGS = $(shell $(ROOTSYS)/bin/root-config --cflags)

ROOTLIBS = $(shell $(ROOTSYS)/bin/root-config --libs)
ROOTGLIBS = $(shell $(ROOTSYS)/bin/root-config --glibs)

# -g for gdb
# -pg for gprof
# -std=c++11

CXXFLAGS = -std=c++11 -O2 -Wall -Wextra $(ROOTCFLAGS) -I$(EUDAQ)/main/include

scope: scope.cc
	g++ $(CXXFLAGS) scope.cc -o scope \
	$(ROOTLIBS) -L$(EUDAQ)/lib -lEUDAQ
	@echo 'done: scope'

tele: tele.cc
	g++ $(CXXFLAGS) tele.cc -o tele \
	$(ROOTLIBS) -L$(EUDAQ)/lib -lEUDAQ
	@echo 'done: tele'

quad: quad.cc
	g++ $(CXXFLAGS) quad.cc -o quad \
	-L$(GBL) -lGBL $(ROOTLIBS) -L$(EUDAQ)/lib -lEUDAQ
	@echo 'done: quad'

evd: evd.cc
	g++ $(CXXFLAGS) evd.cc -o evd \
	$(ROOTGLIBS) -L$(EUDAQ)/lib -lEUDAQ
	@echo 'done: evd'
