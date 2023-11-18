@echo off

:: Create a Python virtual environment named venv using Python 3.1
"C:\Users\nirajadu\AppData\Local\Programs\Python\Python311\python.exe" -m venv venv

:: Activate the virtual environment
call venv\Scripts\activate


SET INSTALL_DIR=deps\real-esrgan

:: Create the installation directory if it doesn't exist
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

:: Navigate to the installation directory
cd /d "%INSTALL_DIR%"

:: Clone the Real-ESRGAN repository
git clone https://github.com/xinntao/Real-ESRGAN.git
cd Real-ESRGAN


:: Upgrade pip to the latest version
python -m pip install --upgrade pip

:: Install PyTorch (replace the command below with the one you get from the PyTorch website)
pip install torch torchvision torchaudio

:: Install other dependencies using pip within the virtual environment
pip install -r requirements.txt

:: Download the pre-trained weights using PowerShell
:: powershell -command "Invoke-WebRequest -Uri https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth -OutFile experiments/pretrained_models/RealESRGAN_x4plus.pth"
:: powershell -command "Invoke-WebRequest -Uri https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus_anime_6B.pth -OutFile experiments/pretrained_models/RealESRGAN_x4plus_anime_6B.pth"

:: Download the pre-trained weights using curl
curl -L https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth -o experiments/pretrained_models/RealESRGAN_x4plus.pth
curl -L https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus_anime_6B.pth -o experiments/pretrained_models/RealESRGAN_x4plus_anime_6B.pth


echo Real-ESRGAN has been installed and the pre-trained models have been downloaded.
echo To activate the virtual environment, navigate to the Real-ESRGAN directory and run: call venv\Scripts\activate
pause
