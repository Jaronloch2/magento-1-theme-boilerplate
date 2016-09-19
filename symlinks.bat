ECHO OFF
SET what=%1
SET createlink=false
IF "%what%"=="skin" (
SET link=J:\XAMPP_2\htdocs\sandbox\magento\1\skin\frontend\default\bgts_theme
SET dir=J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\skin\frontend\default\bgts_theme
xcopy /E /Y /d J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\src\skin\required J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\skin
) ELSE IF "%what%"=="js" (
SET link=J:\XAMPP_2\htdocs\sandbox\magento\1\js\bgts_theme
SET dir=J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\js\bgts_theme
xcopy /E /Y /d J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\src\js\required J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\js
) ELSE (
SET link=J:\XAMPP_2\htdocs\sandbox\magento\1\app\design\frontend\default\bgts_theme
SET dir=J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\app\design\frontend\default\bgts_theme
xcopy /E /Y /d J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\src\app J:\XAMPP_2\htdocs\sandbox\magento\bgts_theme\app
)
IF NOT EXIST "%link%" IF EXIST "%dir%" SET createlink=true
IF "%createlink%"=="true" (
    mklink /D "%link%" "%dir%"
    ECHO "Theme's %what% Symlink Created!"
) ELSE (
    ECHO "Theme's %what% already symlinked!"
)