CXX = go
CXXFLAGS =
TARGET = main
SRC = main.go

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) build -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)