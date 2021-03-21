# We reduced many lines of code to set up NodeJS by abstracting all of it into a base image
FROM aguillenv93/slow-node-base:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm update

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
CMD ["npm", "run", "prod"]
