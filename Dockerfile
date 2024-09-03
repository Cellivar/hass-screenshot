FROM docker.io/library/node:20-alpine

WORKDIR /app

RUN <<EOF
apk update --no-cache
apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    imagemagick
EOF

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
    USE_IMAGE_MAGICK=true

COPY package*.json ./

RUN npm ci

COPY *.js colortable*.png ./

EXPOSE 5000

CMD ["npm", "start"]
