CXX = dotnet
CXXFLAGS =
TARGET = out/app.dll

all: $(TARGET)

$(TARGET):
	$(CXX) build -c Release -o out

clean:
	rm -rf out

run: all
	dotnet out/app.dll