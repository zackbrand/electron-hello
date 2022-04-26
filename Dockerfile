FROM node

# Install dependencies
RUN apt update && apt install -y \
    wine \
    libx11-xcb1 \
    libxtst6 \
    libnss3 \
    libgtk-3-0 \
    libasound2 \
    libxshmfence1 \
    libgbm-dev

# Copy over package.json 
WORKDIR /app
COPY package.json .
RUN chown node /app

# Switch off of root and install
USER node
RUN npm install
COPY . .

ENTRYPOINT [ "npm", "start" ]