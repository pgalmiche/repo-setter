# Use the official Node.js image as the base image
FROM node:20-slim
# Set the working directory inside the Docker image
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# Install project dependencies
RUN npm install
# Copy the rest of the project files to the working directory
#COPY . .
# Build the React app
#RUN npm run build
# Expose the port on which the React app will run
#EXPOSE 8000 35729
# Define the command to start the React app
ENTRYPOINT ["npm", "start"]

