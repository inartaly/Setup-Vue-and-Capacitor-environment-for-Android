#!/bin/bash

# Set up project name
echo "Enter your project name:"
read projectName

# Create Vue app
echo "Creating Vue app..."
npm init vue@latest $projectName -y
cd $projectName || exit

# Install dependencies
echo "Installing dependencies..."
npm install @capacitor/core @capacitor/cli @vitejs/plugin-vue vite

# Initialize Capacitor
echo "Initializing Capacitor..."
npx cap init $projectName com.example.$projectName

# Add Android platform
echo "Adding Android platform..."
npm install @capacitor/android
npx cap add android

# Build the Vue app
echo "Building Vue app..."
npm run build

# Sync Capacitor files
echo "Syncing Capacitor files..."
npx cap sync

# Open Android Studio (optional step)
echo "Opening Android project in Android Studio..."
npx cap open android

echo "Setup complete! You can now edit your App.vue file."
