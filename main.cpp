#include <iostream>
using namespace std;

static int osChoice=0;
static int projectType=0;
static bool useDocker=false;
static bool useRepo=false;
static bool useCICD=false;

char getInput(const string& prompt){
    char answer='n';
    cout<<prompt<<" (Y/n)> ";
    cin>>answer;
    return answer;
}

void setOperatingSystem(int value){osChoice=value;}
void setProjectType(int value){projectType=value;}
void setUseDocker(){
    char answer=getInput("Docker");
    useDocker=(answer=='Y'||answer=='y');
}
void setUseRepo(){
    char answer=getInput("Repository");
    useRepo=(answer=='Y'||answer=='y');
}
void setUseCICD(){
    char answer=getInput("Automated CI/CD");
    useCICD=(answer=='Y'||answer=='y');
}

int getOperatingSystem(){return osChoice;}
int getProjectType(){return projectType;}
bool getUseDocker(){return useDocker;}
bool getUseRepo(){return useRepo;}
bool getUseCICD(){return useCICD;}

void printSetting(const string& name,const string& value){
    cout<<name<<" : "<<value<<"\n";
}

int main(){
    int choice=0;

    cout<<"Select Operating System (1-3)\n";
    cout<<"1) GNU/Linux\n";
    cout<<"2) Windows\n";
    cout<<"3) MacOSX\n";
    cout<<"> ";
    cin>>choice;
    setOperatingSystem(choice);

    cout<<"Select Project Type (1-3)\n";
    cout<<"1) Application\n";
    cout<<"2) Website\n";
    cout<<"3) Program\n";
    cout<<"> ";
    cin>>choice;
    setProjectType(choice);

    setUseDocker();
    setUseRepo();
    setUseCICD();

    cout<<"=== Project Settings Summary ===\n";

    string osText;
    switch(getOperatingSystem()){
        case 1:osText="GNU/Linux";break;
        case 2:osText="Windows";break;
        case 3:osText="MacOSX";break;
        default:osText="Unknown";break;
    }

    string projectText;
    switch(getProjectType()){
        case 1:projectText="Application";break;
        case 2:projectText="Website";break;
        case 3:projectText="Program";break;
        default:projectText="Unknown";break;
    }

    printSetting("Operating System",osText);
    printSetting("Project Type    ",projectText);
    printSetting("Docker          ",getUseDocker()?"Enabled":"Disabled");
    printSetting("Repository      ",getUseRepo()?"Enabled":"Disabled");
    printSetting("Automated CI/CD ",getUseCICD()?"Enabled":"Disabled");

    return 0;
}
