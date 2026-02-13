#include <iostream>
using namespace std;

static string osChoice="";
static string projectType="";
static bool useDocker=false;
static bool useRepo=false;
static bool useCICD=false;

void setOperatingSystem(int value){
    switch(value){
        case 1:osChoice="GNU/Linux";break;
        case 2:osChoice="Windows";break;
        case 3:osChoice="MacOSX";break;
        default:osChoice="Unknown";break;
    }
}

void setProjectType(int value){
    switch(value){
        case 1:projectType="Application";break;
        case 2:projectType="Website";break;
        case 3:projectType="Program";break;
        default:projectType="Unknown";break;
    }
}

void setUseDocker(bool value){useDocker=value;}
void setUseRepo(bool value){useRepo=value;}
void setUseCICD(bool value){useCICD=value;}

string getOperatingSystem(){return osChoice;}
string getProjectType(){return projectType;}
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

    char answer='n';
    cout<<"Docker (Y/n)> ";
    cin>>answer;
    setUseDocker(answer=='Y'||answer=='y');

    cout<<"Repository (Y/n)> ";
    cin>>answer;
    setUseRepo(answer=='Y'||answer=='y');

    cout<<"Automated CI/CD (Y/n)> ";
    cin>>answer;
    setUseCICD(answer=='Y'||answer=='y');

    cout<<"=== Project Settings Summary ===\n";
    printSetting("Operating System",getOperatingSystem());
    printSetting("Project Type    ",getProjectType());
    printSetting("Docker          ",getUseDocker()?"Enabled":"Disabled");
    printSetting("Repository      ",getUseRepo()?"Enabled":"Disabled");
    printSetting("Automated CI/CD ",getUseCICD()?"Enabled":"Disabled");
    return 0;
}
