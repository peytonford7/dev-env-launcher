#include <stdio.h>

int main(void) {
    int osChoice = 0;
    int projectType = 0;

    /* Boolean-like flags: 0 = false, 1 = true */
    int useDocker = 0;
    int useRepository = 0;
    int useCICD = 0;

    int tempChoice = 0;

    /* Operating System menu */
    printf("Select Operating System:\n");
    printf("  1. GNU/Linux\n");
    printf("  2. Windows\n");
    printf("  3. MacOSX\n");
    printf("Enter choice (1-3): ");
    scanf("%d", &osChoice);

    printf("\nYou selected Operating System: ");
    switch (osChoice) {
        case 1: printf("GNU/Linux\n"); break;
        case 2: printf("Windows\n");   break;
        case 3: printf("MacOSX\n");    break;
        default: printf("Unknown (invalid choice)\n"); break;
    }

    /* Project type menu */
    printf("\nSelect Project Type:\n");
    printf("  1. Application\n");
    printf("  2. Website\n");
    printf("  3. Program\n");
    printf("Enter choice (1-3): ");
    scanf("%d", &projectType);

    printf("\nYou selected Project Type: ");
    switch (projectType) {
        case 1: printf("Application\n"); break;
        case 2: printf("Website\n");     break;
        case 3: printf("Program\n");     break;
        default: printf("Unknown (invalid choice)\n"); break;
    }

    /* Settings as boolean options */
    printf("\nSettings:\n");

    printf("Enable Docker? (1 = Yes, 0 = No): ");
    scanf("%d", &tempChoice);
    useDocker = (tempChoice != 0);

    printf("Enable Repository? (1 = Yes, 0 = No): ");
    scanf("%d", &tempChoice);
    useRepository = (tempChoice != 0);

    printf("Enable Automated CI/CD? (1 = Yes, 0 = No): ");
    scanf("%d", &tempChoice);
    useCICD = (tempChoice != 0);

    /* Final project settings summary */
    printf("\n=== Project Settings Summary ===\n");

    printf("Operating System: ");
    switch (osChoice) {
        case 1: printf("GNU/Linux\n"); break;
        case 2: printf("Windows\n");   break;
        case 3: printf("MacOSX\n");    break;
        default: printf("Unknown\n");  break;
    }

    printf("Project Type: ");
    switch (projectType) {
        case 1: printf("Application\n"); break;
        case 2: printf("Website\n");     break;
        case 3: printf("Program\n");     break;
        default: printf("Unknown\n");    break;
    }

    printf("Docker: %s\n",        useDocker     ? "Enabled" : "Disabled");
    printf("Repository: %s\n",    useRepository ? "Enabled" : "Disabled");
    printf("Automated CI/CD: %s\n", useCICD     ? "Enabled" : "Disabled");

    printf("\n");

    return 0;
}
