@echo off
echo -------------------------------- WARNING --------------------------------
echo -------------------------------------------------------------------------
echo ---------------- USING THIS SCRIPT WILL WIPE YOUR WORLD -----------------
echo -------------------------------------------------------------------------
echo -------------------------------------------------------------------------
echo ----- IT IS INTENDED FOR WHEN YOU WANT TO RESTART YOUR PLAYTHROUGH ------
echo -------------------------------------------------------------------------
echo ------ IT WILL RESET EVERYTHING - YOUR BASE, QUESTS, INVENTORY ETC ------
echo -------------------------------------------------------------------------
echo -------------------------------------------------------------------------
echo --- PRESS CTRL+C NOW TO STOP THIS FROM HAPPENING. IT IS IRREVERSIBLE ----
echo -------------------------------------------------------------------------
echo -------------------------------------------------------------------------
echo -- YOU CAN ALSO PRESS ENTER AT THIS PROMPT AND YOUR WORLD WILL BE SAFE --
echo -------------------------------------------------------------------------
echo --------- ARE YOU SURE THAT YOU WANT TO RESET YOUR PLAYTHROUGH? ---------
echo -------------------------------------------------------------------------
echo ------------- TYPE YES IF YOU WANT TO END YOUR PLAYTHROUGH --------------
setlocal
:PROMPT
SET /P AREYOUSURE1= (YES/[NO]) -----
IF /I "%AREYOUSURE1%" NEQ "YES" GOTO END

echo Playthrough is now being reset
del "banned-ips.txt" "banned-players.txt"
rmdir /q /s oldworld
xcopy /s /i world oldworld
rmdir /q /s world
echo -------------------------------------------------------------------------
echo YOUR OLD WORLD IS IN A FOLDER CALLED oldworld
echo JUST IN CASE YOU SOMEHOW MANAGED TO IGNORE THE ABOVE WARNING
echo IT WILL BE OVERWRITTEN THE NEXT TIME YOU RESET YOUR PLAYTHROUGH
echo -------------------------------------------------------------------------
timeout 4
"-- ServerStart.bat"

:END
endlocal