@echo off
:: Project directory mein jao
cd /d "C:\Users\HP\PycharmProjects\RobotFM\POM_In_RF"

:: Virtual environment ko activate karo
call .venv\Scripts\activate

:: Ab pabot run karo
pabot --processes 2 --outputdir ResultsMy TestCases\*.robot

:: Window ko open rakhne ke liye
pause
