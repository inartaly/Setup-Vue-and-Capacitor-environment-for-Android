@echo off
REM Prompt for project name
SET /P projectName=Enter your project name: 

REM Create Vue app
echo Creating Vue app...
npx create-vue %projectName%
cd %projectName%

REM Install dependencies
echo Installing dependencies...
npm install @capacitor/core @capacitor/cli @vitejs/plugin-vue vite

REM Initialize Capacitor
echo Initializing Capacitor...
npx cap init %projectName% com.example.%projectName%

REM Add Android platform
echo Adding Android platform...
npm install @capacitor/android
npx cap add android

REM Build Vue app
echo Building Vue app...
npm run build

REM Sync Capacitor files
echo Syncing Capacitor files...
npx cap sync

REM Notify user
echo Setup complete! Your project is ready. Navigate to the %projectName% folder and edit your App.vue file.
pause
