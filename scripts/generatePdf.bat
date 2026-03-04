@echo off
REM SPDX-License-Identifier: MIT
REM SPDX-FileCopyrightText: 2026 Yavuzâlp Dal
REM
REM Script to generate PDFs for Ausarbeitung and Vortrag
REM 
REM By default, uses pdflatex for backwards compatibility.
REM To use lualatex, set the LATEX_ENGINE environment variable:
REM     set LATEX_ENGINE=lualatex
REM     generatePdf.bat

setlocal enabledelayedexpansion

REM Determine which LaTeX engine to use (default: pdflatex)
if not defined LATEX_ENGINE set LATEX_ENGINE=pdflatex

REM Validate the engine (security: only allow known-safe values)
REM This prevents command injection by restricting to approved engines only
REM Note: Normalizing to lowercase for consistency with bash script behavior
if /i "%LATEX_ENGINE%"=="pdflatex" set LATEX_ENGINE=pdflatex
if /i "%LATEX_ENGINE%"=="lualatex" set LATEX_ENGINE=lualatex

REM Check if normalization succeeded (if not, it's an invalid engine)
if "%LATEX_ENGINE%"=="pdflatex" goto :engine_ok
if "%LATEX_ENGINE%"=="lualatex" goto :engine_ok

echo Error: Invalid LATEX_ENGINE '%LATEX_ENGINE%'
echo Supported engines: pdflatex, lualatex
exit /b 1

:engine_ok
echo Using LaTeX engine: %LATEX_ENGINE%
echo.

echo Building Ausarbeitung...
cd /d "%~dp0..\Ausarbeitung" || exit /b 1
%LATEX_ENGINE% -interaction=nonstopmode Ausarbeitung.tex || exit /b 1
biber Ausarbeitung
if errorlevel 1 (
    echo Error: biber failed for Ausarbeitung. Check Ausarbeitung.blg for details.
    exit /b 1
)
%LATEX_ENGINE% -interaction=nonstopmode Ausarbeitung.tex || exit /b 1
%LATEX_ENGINE% -interaction=nonstopmode Ausarbeitung.tex || exit /b 1
if not exist "Ausarbeitung.pdf" (
    echo Error: Ausarbeitung.pdf was not generated.
    exit /b 1
)
echo Ausarbeitung.pdf generated successfully.

echo Building Vortrag...
cd /d "%~dp0..\Vortrag" || exit /b 1
%LATEX_ENGINE% -interaction=nonstopmode Vortrag.tex || exit /b 1
biber Vortrag
if errorlevel 1 (
    echo Error: biber failed for Vortrag. Check Vortrag.blg for details.
    exit /b 1
)
%LATEX_ENGINE% -interaction=nonstopmode Vortrag.tex || exit /b 1
%LATEX_ENGINE% -interaction=nonstopmode Vortrag.tex || exit /b 1
if not exist "Vortrag.pdf" (
    echo Error: Vortrag.pdf was not generated.
    exit /b 1
)
echo Vortrag.pdf generated successfully.

echo PDFs generated successfully!
