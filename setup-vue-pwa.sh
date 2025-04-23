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
npm install @vitejs/plugin-vue vite

# Add the PWA plugin
echo "Adding Vue PWA plugin..."
npm install @vue/cli-plugin-pwa --save

# Configure PWA
echo "Configuring PWA..."
cat <<EOT > public/manifest.json
{
  "name": "$projectName",
  "short_name": "$projectName",
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
}
EOT

# Build the Vue app
echo "Building Vue app..."
npm run build

# Serve the app locally (optional)
echo "Starting development server..."
npm run dev

echo "PWA setup complete! You can now edit your App.vue file and test your PWA."
