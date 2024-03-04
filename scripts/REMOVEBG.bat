@ECHO OFF
for /F "delims=" %%i in ("%~1") do @set FN=%%~ni
copy "%~1" "%FN%.bak"
magick convert "%~1" -resize 256x256 "%~1"
magick convert "%~1" -fuzz 5%% -transparent #9a9a9a "%~1"
magick convert "%~1" OVERLAY.png -gravity Center -geometry 256x256 -composite "%~1"