# Use Node.js version 24 as the base image for the application
FROM node:24

# Set the required working directory inside the Docker container
WORKDIR /Akintokun_Oluwadamilola_site

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install all dependencies required by the React application
RUN npm install

# Copy the remaining project files into the container
COPY . .

# Expose port 3000, which is used by the React development server
EXPOSE 3000

# Start the React application when the container runs
CMD ["npm", "start"]