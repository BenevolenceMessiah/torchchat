@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
::: ___  ________   ________  _________  ________  ___       ___       _______   ________     
::: |\  \|\   ___  \|\   ____\|\___   ___\\   __  \|\  \     |\  \     |\  ___ \ |\   __  \    
::: \ \  \ \  \\ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \|\  \   
:::  \ \  \ \  \\ \  \ \_____  \   \ \  \ \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \   _  _\  
:::   \ \  \ \  \\ \  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \\  \| 
:::    \ \__\ \__\\ \__\____\_\  \   \ \__\ \ \__\ \__\ \_______\ \_______\ \_______\ \__\\ _\ 
:::     \|__|\|__| \|__|\_________\   \|__|  \|__|\|__|\|_______|\|_______|\|_______|\|__|\|__|
:::                    \|_________|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:: Play soundbyte from audio
if not exist audio\ mkdir audio
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

timeout /t 3

:: Download the repo code if its not downloaded.
echo As-salamu alaykum!!
echo detecting presence of repo, git cloning if not detected...
echo ---------------------------------------------------------------
if exist tools\ goto Menu1
git clone https://github.com/BenevolenceMessiah/torchchat.git
cd distributed-llama
git pull
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------

:Menu1
echo ---------------------------------------------------------------
echo Please choose from the following options:
echo - This project requires/assumes you have Python 3.10 installed as well as Git.
echo   If you don't have both or either of these, choose option 'X' first.
echo - Make sure you have a HuggingFace account (https://huggingface.co)
echo - Make sure you generate a token with write access.
echo - Make sure you have access on HuggingFace for any gated models you want to use
echo - TLDR; Install, Login (or don't and use non-gated models or Mistral options), 
echo - Press Ctrl+c to exit at any time!
echo ---------------------------------------------------------------
echo 1) Install torchchat.
echo L) Login to HuggingFace (Recommended) (Necessary for dwonloading gated models. If you 
echo    opt to not do this, then use any of the Mistral options or a non-gated model from 
echo    the option '2' CLI.)
echo 2) Run torchchat via CLI. (Displays help menus and available models and then launches
echo    a CMD/Python shell to interact freely via the CLI.)
echo 3) Launch a chat session via CLI (Mistral).
echo 4) Launch a chat session via CLI (Llama 3.1).
echo 5) Run torchchat via local Streamlit web app (Mistral). (Recommended)
echo 6) Run torchchat via local Streamlit web app (Llama 3.1). (Recommended)
echo X) Install/reinstall/fix Python and Git. (Only do this if you don't have these installed
echo    or in the event you encounter errors related to Python or Git.)
echo C) Exit
echo U) Update repo.
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 1 goto Install
if %option% == 2 goto CLI
if %option% == 3 goto CLIMistral
if %option% == 4 goto CLILlama3.1
if %option% == 3 goto StreamlitMistral
if %option% == 3 goto StreamlitLlama3.1
if %option% == L goto HuggingFaceLogin
if %option% == l goto HuggingFaceLogin
if %option% == X goto Python/GitInstall
if %option% == C goto End
if %option% == c goto End
if %option% == U goto Updater
if %option% == u goto Updater

:Python/GitInstall
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo What do you need to install?
echo ---------------------------------------------------------------
echo 9) Install Git.
echo 10) Install Python 3.10. (Make sure to enable PATH)!
echo M) Main Menu
echo R) Restart the .bat file (do this after installing either or both of these).
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 9 goto GitInstall
if %option% == 10 goto PythonInstall
if %option% == R goto RestartCMD
if %option% == M goto Menu1
if %option% == C goto End

:GitInstall
echo Installing Git...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe" -o Git-2.46.0-64-bit.exe
start call Git-2.46.0-64-bit.exe
goto Python/GitInstall

:PythonInstall
echo Installing Python 3.10...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe" -o python-3.10.6-amd64.exe
start call python-3.10.6-amd64.exe
goto Python/GitInstall

:RestartCMD
echo Restarting...
echo Deleting installer .exe files if they exist...
echo ---------------------------------------------------------------
if exist Git-2.46.0-64-bit.exe del Git-2.46.0-64-bit.exe
if exist python-3.10.6-amd64.exe del python-3.10.6-amd64.exe
start call Run_torchchat.bat
exit

:: Install Dependencies
:Install
:: Create and activate a Python virtual environment
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
echo Installing python requirements from requirements.txt and extra junk to make this work on Windows in one file.
echo ---------------------------------------------------------------
cd install
:: pip3 install huggingface_hub
:: pip install torchao --upgrade
:: pip install torch==2.4.0
:: pip install gguf
pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/nightly/cu121
:: --extra-index-url https://download.pytorch.org/whl/nightly/cu121
:: pip install --upgrade torch torchvision
pip install torchao
:: Stable Release:
:: pip install torchao --extra-index-url https://download.pytorch.org/whl/cu121
::  # full options are cpu/cu118/cu121/cu124
:: Nightly Release (Recommended)
pip install --pre torchao --index-url https://download.pytorch.org/whl/nightly/cu121
:: # full options are cpu/cu118/cu121/cu124
:: USE_CPP=0 pip install -e .
call python install install_requirements.sh
cd ..
echo Installtion Complete!!
echo ---------------------------------------------------------------
:: Log in to HuggingFace
echo Login via HuggingFace token with Write permissions or press enter and skip.
echo (Necessary for gated models.) (Recommended)
huggingface-cli login
goto Menu1

:CLI
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
:: Display Help menu and commands
echo ---------------------------------------------------------------
echo displaying help menu, commands, and listing avaialable models...
echo ---------------------------------------------------------------
python torchchat.py --help
timeout /t -1
python torchchat.py --list
timeout /t -1
echo Launching empty CMD/Python shell...
timeout /t -1
start start python
goto Menu1

:: Download models (Deprecated?):
:: echo Download Models
:: echo ---------------------------------------------------------------
:: python torchchat.py download mistral
:: python torchchat.py download llama3.1

:CLIMistral
echo ---------------------------------------------------------------
echo Starting chat with Mistral...
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
start start python torchchat.py chat mistral
goto Menu1

:CLILlama3.1
echo ---------------------------------------------------------------
echo Starting chat with Llama 3.1...
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
start start python torchchat.py chat llama3.1
goto Menu1

:StreamlitMistral
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
Start start torchchat.py server mistral
:: start start streamlit run torchchat.py -- browser mistral
cd torchchat
cd usages
start start streamlit run browser.py
cd ..
cd ..
goto Menu1

:StreamlitLlama3.1
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
Start start torchchat.py server llama3.1
:: start start streamlit run torchchat.py -- browser mistral
cd torchchat
cd usages
start start streamlit run browser.py
cd ..
cd ..
goto Menu1

:: start start server

:: Log in to HuggingFace
:HuggingFaceLogin
echo ---------------------------------------------------------------
echo Creating virtual environment if one does not exist...
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
echo Login via HuggingFace token with Write permissions or press enter and skip.
echo (Necessary for gated models.) (Recommended)
echo ---------------------------------------------------------------
huggingface-cli login
goto Menu1

:Updater
echo ---------------------------------------------------------------
echo Updating repo...
echo ---------------------------------------------------------------
ls | xargs -I{} git -C {} pull
echo Complete!
echo ---------------------------------------------------------------
goto Menu1

:End 
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo ---------------------------------------------------------------
pause