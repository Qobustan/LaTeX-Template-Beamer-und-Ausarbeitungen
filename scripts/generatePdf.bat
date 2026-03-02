@echo off
REM ==============================================================================
REM
REM          FILE: generatePdf.bat
REM
REM         USAGE: generatePdf.bat [--engine pdflatex|lualatex]
REM
REM   DESCRIPTION: Generate PDFs for Ausarbeitung and Vortrag.
REM                Supports both pdflatex (default) and lualatex engines.
REM
REM       OPTIONS:
REM         --engine ENGINE   LaTeX engine: pdflatex (default) or lualatex
REM         --help            Show this help message
REM
REM      EXAMPLES:
REM         generatePdf.bat
REM         generatePdf.bat --engine lualatex
REM
REM ==============================================================================

setlocal enabledelayedexpansion

REM Default engine
set ENGINE=pdflatex

REM Parse arguments
:parse_args
if "%1"=="" goto :done_args
if /i "%1"=="--help" goto :show_help
if /i "%1"=="-h" goto :show_help
if /i "%1"=="--engine" (
    set ENGINE=%2
    shift
    shift
    goto :parse_args
)
echo Unknown option: %1
goto :show_help

:show_help
echo Usage: generatePdf.bat [OPTIONS]
echo.
echo OPTIONS:
echo   --engine ENGINE   LaTeX engine: pdflatex (default) or lualatex
echo   -h, --help        Show this help message
echo.
echo EXAMPLES:
echo   generatePdf.bat
echo   generatePdf.bat --engine lualatex
exit /b 1

:done_args

REM Validate engine
if /i "!ENGINE!"=="pdflatex" goto :engine_ok
if /i "!ENGINE!"=="lualatex" goto :engine_ok
echo Error: Unsupported engine '!ENGINE!'. Use 'pdflatex' or 'lualatex'.
exit /b 1

:engine_ok

echo === PDF Generation Script ===
echo Engine: !ENGINE!
echo.

REM ── Build Ausarbeitung ────────────────────────────────────────────────────
echo [1/2] Building Ausarbeitung...
cd /d "%~dp0..\Ausarbeitung" || exit /b 1

echo   Step 1/4: Running !ENGINE! (first pass)...
!ENGINE! -interaction=nonstopmode Ausarbeitung.tex || exit /b 1

echo   Step 2/4: Running bibtex/biber...
biber Ausarbeitung 2>nul || bibtex Ausarbeitung 2>nul

echo   Step 3/4: Running !ENGINE! (second pass)...
!ENGINE! -interaction=nonstopmode Ausarbeitung.tex || exit /b 1

echo   Step 4/4: Running !ENGINE! (third pass)...
!ENGINE! -interaction=nonstopmode Ausarbeitung.tex || exit /b 1

if exist Ausarbeitung.pdf (
    echo   [OK] Ausarbeitung.pdf generated successfully.
) else (
    echo   [ERROR] Ausarbeitung.pdf was not generated!
    exit /b 1
)

REM ── Build Vortrag ─────────────────────────────────────────────────────────
echo.
echo [2/2] Building Vortrag...
cd /d "%~dp0..\Vortrag" || exit /b 1

echo   Step 1/4: Running !ENGINE! (first pass)...
!ENGINE! -interaction=nonstopmode Vortrag.tex || exit /b 1

echo   Step 2/4: Running bibtex/biber...
biber Vortrag 2>nul || bibtex Vortrag 2>nul

echo   Step 3/4: Running !ENGINE! (second pass)...
!ENGINE! -interaction=nonstopmode Vortrag.tex || exit /b 1

echo   Step 4/4: Running !ENGINE! (third pass)...
!ENGINE! -interaction=nonstopmode Vortrag.tex || exit /b 1

if exist Vortrag.pdf (
    echo   [OK] Vortrag.pdf generated successfully.
) else (
    echo   [ERROR] Vortrag.pdf was not generated!
    exit /b 1
)

echo.
echo === All PDFs generated successfully! ===
