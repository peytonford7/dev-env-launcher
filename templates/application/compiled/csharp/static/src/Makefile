CXX = mcs
CXXFLAGS =
TARGET = main.exe
SRC = main.cs

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -out:$(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	mono $(TARGET)