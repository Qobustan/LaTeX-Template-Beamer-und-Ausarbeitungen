@echo off
REM ==============================================================================
REM
REM          FILE: Remove_Junk_Windows.bat
REM
REM         USAGE: Remove_Junk_Windows.bat [/Q]
REM
REM   DESCRIPTION: Remove temporary LaTeX build files from the repository.
REM                Cleans the current directory, Ausarbeitung, and Vortrag.
REM
REM       OPTIONS:
REM         /Q    Quiet mode (suppress status messages)
REM
REM         FILES: Removes .aux, .log, .lof, .gz, .toc, .bak~, .bbl, .bcf, .blg,
REM                .lot, .out, .xml, .run.xml, .acn, .acr, .alg, .glg, .glo, .gls,
REM                .gug, .guo, .gus, .ist, .llg, .llo, .lls, .lug, .luo, .lus,
REM                .mog, .moo, .mos, .xdy, .mw, .synctex.gz, .fdb_latexmk, .fls,
REM                .idx, .ind, .ilg, .dvi, .nav, .snm
REM
REM ==============================================================================

set SHOW_COMMENTS=true
if /i "%1"=="/Q" set SHOW_COMMENTS=false

REM ── Current directory ─────────────────────────────────────────────────────
if "%SHOW_COMMENTS%"=="true" echo Cleaning temporary LaTeX files from current directory...

if exist *.aux del /Q *.aux
if exist *.log del /Q *.log
if exist *.lof del /Q *.lof
if exist *.gz del /Q *.gz
if exist *.toc del /Q *.toc
if exist *.bak~ del /Q *.bak~
if exist *.bbl del /Q *.bbl
if exist *.bcf del /Q *.bcf
if exist *.blg del /Q *.blg
if exist *.lot del /Q *.lot
if exist *.out del /Q *.out
if exist *.xml del /Q *.xml
if exist *.acn del /Q *.acn
if exist *.acr del /Q *.acr
if exist *.alg del /Q *.alg
if exist *.glg del /Q *.glg
if exist *.glo del /Q *.glo
if exist *.gls del /Q *.gls
if exist *.gug del /Q *.gug
if exist *.guo del /Q *.guo
if exist *.gus del /Q *.gus
if exist *.ist del /Q *.ist
if exist *.llg del /Q *.llg
if exist *.llo del /Q *.llo
if exist *.lls del /Q *.lls
if exist *.lug del /Q *.lug
if exist *.luo del /Q *.luo
if exist *.lus del /Q *.lus
if exist *.mog del /Q *.mog
if exist *.moo del /Q *.moo
if exist *.mos del /Q *.mos
if exist *.xdy del /Q *.xdy
if exist *.mw del /Q *.mw
if exist *.synctex.gz del /Q *.synctex.gz
if exist *.fdb_latexmk del /Q *.fdb_latexmk
if exist *.fls del /Q *.fls
if exist *.idx del /Q *.idx
if exist *.ind del /Q *.ind
if exist *.ilg del /Q *.ilg
if exist *.dvi del /Q *.dvi
if exist *.ps del /Q *.ps
if exist *.nav del /Q *.nav
if exist *.snm del /Q *.snm

REM Get repository root directory
set REPO_ROOT=%~dp0..

REM ── Ausarbeitung directory ────────────────────────────────────────────────
if "%SHOW_COMMENTS%"=="true" echo Cleaning Ausarbeitung directory...

if exist "%REPO_ROOT%\Ausarbeitung" (
    pushd "%REPO_ROOT%\Ausarbeitung"

    if exist *.aux del /Q *.aux
    if exist *.log del /Q *.log
    if exist *.lof del /Q *.lof
    if exist *.gz del /Q *.gz
    if exist *.toc del /Q *.toc
    if exist *.bak~ del /Q *.bak~
    if exist *.bbl del /Q *.bbl
    if exist *.bcf del /Q *.bcf
    if exist *.blg del /Q *.blg
    if exist *.lot del /Q *.lot
    if exist *.out del /Q *.out
    if exist *.xml del /Q *.xml
    if exist *.acn del /Q *.acn
    if exist *.acr del /Q *.acr
    if exist *.alg del /Q *.alg
    if exist *.glg del /Q *.glg
    if exist *.glo del /Q *.glo
    if exist *.gls del /Q *.gls
    if exist *.gug del /Q *.gug
    if exist *.guo del /Q *.guo
    if exist *.gus del /Q *.gus
    if exist *.ist del /Q *.ist
    if exist *.llg del /Q *.llg
    if exist *.llo del /Q *.llo
    if exist *.lls del /Q *.lls
    if exist *.lug del /Q *.lug
    if exist *.luo del /Q *.luo
    if exist *.lus del /Q *.lus
    if exist *.mog del /Q *.mog
    if exist *.moo del /Q *.moo
    if exist *.mos del /Q *.mos
    if exist *.xdy del /Q *.xdy
    if exist *.mw del /Q *.mw
    if exist *.synctex.gz del /Q *.synctex.gz
    if exist *.fdb_latexmk del /Q *.fdb_latexmk
    if exist *.fls del /Q *.fls
    if exist *.idx del /Q *.idx
    if exist *.ind del /Q *.ind
    if exist *.ilg del /Q *.ilg
    if exist *.dvi del /Q *.dvi
    if exist *.ps del /Q *.ps
    if exist *.nav del /Q *.nav
    if exist *.snm del /Q *.snm

    popd
) else (
    if "%SHOW_COMMENTS%"=="true" echo Warning: Ausarbeitung directory not found, skipping.
)

REM ── Vortrag directory ─────────────────────────────────────────────────────
if "%SHOW_COMMENTS%"=="true" echo Cleaning Vortrag directory...

if exist "%REPO_ROOT%\Vortrag" (
    pushd "%REPO_ROOT%\Vortrag"

    if exist *.aux del /Q *.aux
    if exist *.log del /Q *.log
    if exist *.lof del /Q *.lof
    if exist *.gz del /Q *.gz
    if exist *.toc del /Q *.toc
    if exist *.bak~ del /Q *.bak~
    if exist *.bbl del /Q *.bbl
    if exist *.bcf del /Q *.bcf
    if exist *.blg del /Q *.blg
    if exist *.lot del /Q *.lot
    if exist *.out del /Q *.out
    if exist *.xml del /Q *.xml
    if exist *.acn del /Q *.acn
    if exist *.acr del /Q *.acr
    if exist *.alg del /Q *.alg
    if exist *.glg del /Q *.glg
    if exist *.glo del /Q *.glo
    if exist *.gls del /Q *.gls
    if exist *.gug del /Q *.gug
    if exist *.guo del /Q *.guo
    if exist *.gus del /Q *.gus
    if exist *.ist del /Q *.ist
    if exist *.llg del /Q *.llg
    if exist *.llo del /Q *.llo
    if exist *.lls del /Q *.lls
    if exist *.lug del /Q *.lug
    if exist *.luo del /Q *.luo
    if exist *.lus del /Q *.lus
    if exist *.mog del /Q *.mog
    if exist *.moo del /Q *.moo
    if exist *.mos del /Q *.mos
    if exist *.xdy del /Q *.xdy
    if exist *.mw del /Q *.mw
    if exist *.synctex.gz del /Q *.synctex.gz
    if exist *.fdb_latexmk del /Q *.fdb_latexmk
    if exist *.fls del /Q *.fls
    if exist *.idx del /Q *.idx
    if exist *.ind del /Q *.ind
    if exist *.ilg del /Q *.ilg
    if exist *.dvi del /Q *.dvi
    if exist *.ps del /Q *.ps
    if exist *.nav del /Q *.nav
    if exist *.snm del /Q *.snm

    popd
) else (
    if "%SHOW_COMMENTS%"=="true" echo Warning: Vortrag directory not found, skipping.
)

echo.
echo === Cleanup complete ===
