# Written by guninvalid, not Tommo. Go bug gun for the shitty code style, not Tommo

if (test -e world); then
    printf "World folder exists, checking prerequisites.\n";
else
    printf "World folder does not exist - copying fresh world file from known directory.";
    cp -rv scripts/freshworld world
    prinf "Success extracting world folder, starting server.\n";
fi;

printf "Server starting. Doing a basic version check:\n"

if (test -e /usr/bin/java || test -e /bin/java); then
    printf "Java not found. Make sure you've install your java binary in /bin or /usr/bin.\n"
    exit 255;
elif (java -version | grep 'version \"1.8'); then
    printf "Java not version 8. Exiting. \n";
    printf "If you believe this is an error, bug guninvalid. Do not bug Tommo, and do not bug 1skandar. \n";
    exit 255;
elif (java -version | grep "64-bit");
    printf "Java may not be x64. x64 is recommended. I will attempt to start with this version instead... \n"
    printf "Starting x86 Server using Java Version 8 x86...\n"
    printf "------------------------------ PLEASE NOTE ------------------------------"
    printf "IT IS NOT ADVISED TO USE AN X86 VERSION OF JAVA FOR RUNNING CRASH LANDING\n";
    printf "-------------------------------------------------------------------------\n";
    printf "PLEASE INSTALL AN X64 VERSION OF JAVA 8 OR JAVA 7\n";
    printf "-------------------------------------------------------------------------\n";
    printf "CRASH LANDING IS NOT GUARANTEED TO RUN ON ANY VERSION OF X86 JAVA\n";
    printf "-------------------------------------------------------------------------\n";
    printf "THE SCRIPT WILL NOW TRY TO RUN THE SERVER ON X86 JAVA 8\n";
    printf "-------------------------------------------------------------------------\n";
    printf "PRESS CTRL+C TO STOP THIS IMMEDIATELY\n";
    printf "-------------------------------------------------------------------------\n";
    printf "SERVER WILL START IN 20 SECONDS, THIS IS UNADVISABLE\n";
    printf "-------------------------------------------------------------------------\n";
    printf "-------------------------------------------------------------------------\n";
    printf "EITHER CLOSE THIS WINDOW OR PRESS CTRL+C TO STOP THIS HAPPENING.\n";
    printf "-------------------------------------------------------------------------\n";
    sleep 20s
fi;

printf "64-bit Java version 8 detected. Continuing. \n";

bash ./ServerStart.sh;