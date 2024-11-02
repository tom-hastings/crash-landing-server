@echo off
:A
if exist world\ (
	echo World folder exists, checking prerequisites and starting minecraft server.
	goto :B
	
)	else (
	timeout 1
	echo World does not exist - copying fresh world file from known directory.
	timeout 1
	xcopy /s /i "scripts/freshworld" "world"
	timeout 1
	echo Success copying world folder, starting server.
	goto :A
)

:B
echo Goto command successful - starting prerequisite check
echo Now checking for latest Java 8 x64
if exist "C:\Program Files\Java\latest\jre-1.8\bin\java.exe" (
	echo Java 8 has been found in its default directory.
	echo Using:
	java -version
	echo Starting x64 Server using your currently installed version of Java 8.
	timeout 1
	"C:\Program Files\Java\latest\jre-1.8\bin\java.exe" -Xms2048m -Xmx2048m -XX:PermSize=128m -Duser.language=en -Dfml.ignoreInvalidMinecraftCertificates=true -jar FTBServer-1.6.4-965.jar nogui
)	else (
	goto :java8_x64check
	)

:java8_x64check
echo Now checking for other Java 8 x64
if exist "C:\Program Files\Java\jre-1.8\bin\java.exe" (
	echo Java 8 x64 has been found in its default directory.
	echo Starting x64 Server using Java Version 8 x64
	timeout 1
	"C:\Program Files\Java\jre-1.8\bin\java.exe" -Xms2048m -Xmx2048m -XX:PermSize=128m -Duser.language=en -Dfml.ignoreInvalidMinecraftCertificates=true -jar FTBServer-1.6.4-965.jar nogui
)	else (
	echo Java 8 x64 is not installed, proceeding to check Java 7 x64
	goto :java7_x64check
	)
	
:java7_x64check
echo ---------------------------
echo Now checking for Java 7 x64
if exist "C:\Program Files\Java\jre7\bin\java.exe" (
	echo Java 7 x64 has been found in its default directory.
	echo Starting x64 Server using Java Version 7 x64
	timeout 1
	"C:\Program Files\Java\jre7\bin\java.exe" -Xms2048m -Xmx2048m -XX:PermSize=128m -Duser.language=en -Dfml.ignoreInvalidMinecraftCertificates=true -jar FTBServer-1.6.4-965.jar nogui
)	else (
	echo Java 7 x64 is not installed, proceeding to check Java 8 x86
	echo ---------------------------
	goto :java8_x86check
	)
	
:java8_x86check
echo Now checking for Java 8 x86
if exist "C:\Program Files (x86)\Java\jre-1.8\bin\java.exe" (
	echo Java 8 x86 has been found in its default directory.
	echo Starting x86 Server using Java Version 8 x86
	timeout 1
	echo ------------------------------ PLEASE NOTE ------------------------------
	echo IT IS NOT ADVISED TO USE AN X86 VERSION OF JAVA FOR RUNNING CRASH LANDING
	echo -------------------------------------------------------------------------
	echo PLEASE INSTALL AN X64 VERSION OF JAVA 8 OR JAVA 7
	echo -------------------------------------------------------------------------
	echo CRASH LANDING IS NOT GUARANTEED TO RUN ON ANY VERSION OF X86 JAVA
	echo -------------------------------------------------------------------------
	echo THE SCRIPT WILL NOW TRY TO RUN THE SERVER ON X86 JAVA 8
	echo -------------------------------------------------------------------------
	echo -------------------------------------------------------------------------
	echo TYPE YES IF YOU WANT TO RUN THE SERVER WITH X86 JAVA 
	echo -------------------------------------------------------------------------
	echo TYPE NO IF YOU DO NOT WANT TO RUN THE SERVER - RECOMMENDED
	echo -------------------------------------------------------------------------
	timeout 5
	SET /P AREYOUSURE2= (YES/[NO])
	IF /I "%AREYOUSURE2%" NEQ "YES" GOTO :NOJAVA
	"C:\Program Files (x86)\Java\jre-1.8\bin\java.exe" -Xms2048m -Xmx2048m -XX:PermSize=128m -Duser.language=en -Dfml.ignoreInvalidMinecraftCertificates=true -jar FTBServer-1.6.4-965.jar nogui
	
)
	else (
	:NOJAVA
	echo -------------------------------------------------------------------------
	echo NO SUITABLE JAVA CANDIDATE HAS BEEN FOUND ON YOUR SYSTEM
	echo -------------------------------------------------------------------------
	echo PLEASE INSTALL ANY X64 VERSION OF JAVA 8 OR JAVA 7
	echo -------------------------------------------------------------------------
	echo THESE ARE AVAILABLE ON THE CRASH LANDING DISCORD SERVER
	echo -------------------------------------------------------------------------
	echo https://discord.gg/75abXgqm34
	echo -------------------------------------------------------------------------
	goto :JAVA8INSTALLPROMPT
	)
	
	
:JAVA8INSTALLPROMPT
SET /P AREYOUSURE3= The script can install Java 8 x64 for you. Would you like to do this? (YES/[NO])  --
IF /I "%AREYOUSURE3%" NEQ "YES" GOTO :ENDSCRIPT

echo Java 8 will now be installed!
echo Please accept admin prompts when you are asked.
echo These should all show the publisher as Oracle.
timeout 5
curl https://cl.tommo.team/latest-java8 -L -o j8install.exe
j8install.exe /s
del j8install.exe
timeout 5
goto :A
	
	
	:ENDSCRIPT
	echo -------------------------------------------------------------------------
	echo YOU NEED TO INSTALL JAVA YOURSELF. PLEASE SEE ABOVE INSTRUCTIONS.
	echo -------------------------------------------------------------------------
	echo THE SCRIPT WILL AUTOMATICALLY CLOSE IN 30 SECONDS
	timeout 30
	exit