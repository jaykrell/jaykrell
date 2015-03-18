if not defined ProgramFiles(x86) set ProgramFiles(x86)=%ProgramFiles%

set LIB=
set INCLUDE=

if not defined VSINSTALLDIR   set VSINSTALLDIR=%ProgramFiles(x86)%\Microsoft Visual Studio 11.0
if not defined VCINSTALLDIR   set VCINSTALLDIR=%ProgramFiles(x86)%\Microsoft Visual Studio 11.0\VC
if not defined VS100COMNTOOLS set VS100COMNTOOLS=%ProgramFiles(x86)%\Microsoft Visual Studio 10.0\Common7\Tools
if not defined VS110COMNTOOLS set VS110COMNTOOLS=%ProgramFiles(x86)%\Microsoft Visual Studio 11.0\Common7\Tools
if not defined WindowsSdkDir  set WindowsSdkDir=%ProgramFiles(x86)%\Windows Kits\8.0
if not defined DevEnvDir      set DevEnvDir=%VSINSTALLDIR%\Common7\IDE

set INCLUDE=%INCLUDE%;%VCINSTALLDIR%\INCLUDE
rem set INCLUDE=%INCLUDE%;%VCINSTALLDIR%\ATLMFC\INCLUDE
set INCLUDE=%INCLUDE%;%WindowsSdkDir%\include\shared
set INCLUDE=%INCLUDE%;%WindowsSdkDir%\include\um
rem set INCLUDE=%INCLUDE%;%WindowsSdkDir%\include\winrt
set LIB=%LIB%;%VCINSTALLDIR%\LIB
rem set LIB=%LIB%;%VCINSTALLDIR%\ATLMFC\LIB
set LIB=%LIB%;%WindowsSdkDir%\lib\win8\um\x86
set PATH=%DevEnvDir%;%PATH%
set PATH=%VCINSTALLDIR%\BIN;%PATH%
set PATH=%VSINSTALLDIR%\Common7\Tools;%PATH%
set PATH=%WindowsSdkDir%\bin\x86;%PATH%
set PATH=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v8.0A\bin;%PATH%
set PATH=%ProgramFiles(x86)%\ActiveState Komodo Edit 7;%PATH%
set PATH=%Windir%\System32;%Windir%;%Windir%\System32\Wbem;%PATH%
set PATH=%ProgramFiles(x86)%\Git\cmd;%PATH%
set PATH=C:\cm3\bin;%PATH%
