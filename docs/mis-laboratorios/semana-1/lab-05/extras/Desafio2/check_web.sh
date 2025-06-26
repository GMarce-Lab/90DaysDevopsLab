#!/bin/bash
URL="https://roxs.295devops.com"
if curl -s --head "$URL" | grep "200 OK" >/dev/null; then
  echo "✅ $URL está accesible"
else
  echo "❌ No se puede acceder a $URL"
fi
