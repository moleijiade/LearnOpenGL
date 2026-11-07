@echo off
rem ============================================================
rem  LearnOpenGL one-click build script (command line)
rem  Usage: double-click, or run this script from cmd
rem ============================================================
call "D:\Programming\All Visual Studio\Visual Studio\VC\Auxiliary\Build\vcvars64.bat" >nul
set "PATH=D:\Programming\All Visual Studio\Visual Studio\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;D:\Programming\All Visual Studio\Visual Studio\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;%PATH%"
if exist "D:\Programming\All Visual Studio\Code_Workspace\LearnOpenGL\out\build" rmdir /s /q "D:\Programming\All Visual Studio\Code_Workspace\LearnOpenGL\out\build"
"D:\Programming\All Visual Studio\Visual Studio\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -S "D:\Programming\All Visual Studio\Code_Workspace\LearnOpenGL" -B "D:\Programming\All Visual Studio\Code_Workspace\LearnOpenGL\out\build" -G Ninja -DCMAKE_BUILD_TYPE=Debug
if errorlevel 1 exit /b 1
"D:\Programming\All Visual Studio\Visual Studio\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" --build "D:\Programming\All Visual Studio\Code_Workspace\LearnOpenGL\out\build"
exit /b %errorlevel%
