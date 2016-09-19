ECHO OFF
ECHO Wintasks will try to create a symlink and copy all modified SRC files.
SET what=%1
SET projectdir=%2
SET themedir=%3
SET createlink=false
SET removealllinks=true
IF "%what%"=="skin" (
SET link=%projectdir%\skin\frontend\default\bgts_theme
SET dir=%themedir%\skin\frontend\default\bgts_theme
xcopy /E /Y /d %themedir%\src\skin\required %themedir%\skin
) ELSE IF "%what%"=="js" (
SET link=%projectdir%\js\bgts_theme
SET dir=%themedir%\js\bgts_theme
xcopy /E /Y /d %themedir%\src\js\required %themedir%\js
) ELSE (
SET link=%projectdir%\app\design\frontend\default\bgts_theme
SET dir=%themedir%\app\design\frontend\default\bgts_theme
xcopy /E /Y /d %themedir%\src\app %themedir%\app
)
IF NOT EXIST "%link%" IF EXIST "%dir%" SET createlink=true
IF "%createlink%"=="true" (
    mklink /D "%link%" "%dir%"
    ECHO "Theme's %what% Symlink Created!"
) ELSE (
    ECHO "Theme's %what% already symlinked!"
)