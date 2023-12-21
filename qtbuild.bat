@REM Purpose:
@REM - Enable QtWebEngineCore with proprietary codecs
@REM - Rmoeve the Intel display card 2d acceleration limitation
@REM Requirements:
@REM - Microsoft Visual Studio 2022
@REM - Install Qt 6.4.3 (with source code)
@REM - cmake (Qt bundled)
@REM - ninja (Qt bundled)
@REM - perl
@REM - python311 (with htmllib, snappy and lxml)
@REM - GNU gperf/bison/flex
@REM - Patch for Qt Src:
@REM - qtwebengine\src\3rdparty\chromium\gpu\config\software_rendering_list.json (remove limitation with id=158)
@REM -- see software_rendering_list.json.patch

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
chcp 437

set QTSRC=C:\Qt\6.4.3\Src
set QTOBJ=C:\work\qtbuild\643
set QTOUT=C:\work\qtinstall\643

mkdir %QTOBJ%
cd %QTOBJ%
%QTSRC%\configure -prefix %QTOUT% -opensource -confirm-license -nomake examples -nomake tests -opengl dynamic -debug-and-release -force-debug-info -platform win32-msvc -mp -webengine-proprietary-codecs

cmake --build . --parallel
cmake --install .
