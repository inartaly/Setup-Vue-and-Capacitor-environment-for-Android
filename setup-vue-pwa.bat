@echo off

REM Set up project name
set /p projectName="Enter your project name: "

REM Create Vue app
echo Creating Vue app...
npx create-vue@latest %projectName% --default
cd %projectName%

REM Install dependencies
echo Installing dependencies...
npm install @vitejs/plugin-vue vite

REM Add PWA plugin
echo Adding Vue PWA plugin...
npm install @vue/cli-plugin-pwa --save

REM Configure PWA
echo Configuring PWA...
echo {
  "name": "%projectName%",
  "short_name": "%projectName%",
  "start_url": "./",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#4CAF50",
  "icons": [
    {
      "src": "icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
} > public\manifest.json

REM Build the Vue app
echo Building Vue app...
npm run build

REM Start the development server (optional step)
echo Starting development server...
npm run dev

echo PWA setup complete! You can now edit your App.vue file and test your PWA.
pause
