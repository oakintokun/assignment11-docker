# Assignment 11 - Docker File

## Student Information

**Name:** Oluwadamilola Akintokun  
**Assignment:** Coding Assignment 11 - Docker File

## Project Overview

This project demonstrates how to create and run a React development environment using Docker. The web application was created using Create React App and displays an `<h1>` heading with the text **"Codin 1"**.

The application runs inside a Docker container and can be accessed in the browser at:

`http://localhost:7775`

---

## Requirements

The following software was used to complete this project:

- Node.js
- npm and npx
- Create React App
- Docker Desktop
- Visual Studio Code
- Web browser

---

## Step 1: Create the React Application

I first navigated to my Documents folder and created a new React application using Create React App.

```powershell
cd $HOME\Documents
npx create-react-app assignment11
```

After Create React App finished creating the project, I navigated into the project folder:

```powershell
cd assignment11
```

I then opened the project in Visual Studio Code:

```powershell
code .
```

---

## Step 2: Modify the React Application

I opened the `src/App.js` file and modified the App component so that the application displays the required `<h1>` heading.

```javascript
// Imports the CSS file used to style the App component
import './App.css';

// Creates the main App component for the React application
function App() {
  return (
    // Main container for the application
    <div className="App">
      {/* Displays the required heading for Assignment 11 */}
      <h1>Codin 1</h1>
    </div>
  );
}

// Exports the App component so it can be used by the application
export default App;
```

I tested the React application locally using:

```powershell
npm start
```

The application successfully displayed **Codin 1** in the browser.

---

## Step 3: Create the Dockerfile

I created a file named `Dockerfile` in the root directory of the project.

The Dockerfile contains:

```dockerfile
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
```

### Dockerfile Explanation

- `FROM node:24` uses Node.js version 24 as the base image.
- `WORKDIR /Akintokun_Oluwadamilola_site` sets the working directory inside the container.
- `COPY package*.json ./` copies the package files into the container.
- `RUN npm install` installs the project dependencies.
- `COPY . .` copies the remaining project files into the container.
- `EXPOSE 3000` identifies port 3000 as the port used by the React development server.
- `CMD ["npm", "start"]` starts the React application when the container runs.

---

## Step 4: Build the Docker Image

With Docker Desktop running, I built the Docker image using:

```powershell
docker build -t coding-assignment11 .
```

The `-t` option gives the Docker image the name `coding-assignment11`.

The period (`.`) tells Docker to use the current project directory as the build context.

---

## Step 5: Create and Run the Docker Container

I created and started the Docker container using:

```powershell
docker run --name Akintokun_Oluwadamilola_coding_assignment11 -p 7775:3000 coding-assignment11
```

The container is named:

`Akintokun_Oluwadamilola_coding_assignment11`

The `-p 7775:3000` option maps port **7775** on the host computer to port **3000** inside the Docker container.

---

## Step 6: Access the Application

After the container started and the React application compiled successfully, I opened the following address in my browser:

`http://localhost:7775`

The application successfully displayed:

```html
<h1>Codin 1</h1>
```

---

## Step 7: Verify the Docker Container

I verified that the container was running using:

```powershell
docker ps
```

The command showed the container named:

`Akintokun_Oluwadamilola_coding_assignment11`

It also showed that host port `7775` was mapped to container port `3000`.

---

## Step 8: Verify the Working Directory

I verified the working directory inside the running container using:

```powershell
docker exec Akintokun_Oluwadamilola_coding_assignment11 pwd
```

The command returned:

```text
/Akintokun_Oluwadamilola_site
```

This confirms that the application files are hosted in the required working directory.

---

## Running the Project Again

If the container already exists but is stopped, it can be started using:

```powershell
docker start Akintokun_Oluwadamilola_coding_assignment11
```

The application can then be accessed at:

`http://localhost:7775`

To stop the container:

```powershell
docker stop Akintokun_Oluwadamilola_coding_assignment11
```

---

## Assignment Requirements Completed

This project meets the Assignment 11 requirements by:

- Creating the application using Create React App.
- Displaying an `<h1>` element containing **"Codin 1"**.
- Creating a Docker development environment.
- Using `/Akintokun_Oluwadamilola_site` as the Docker working directory.
- Creating a container named `Akintokun_Oluwadamilola_coding_assignment11`.
- Mapping host port `7775` to the React application's container port `3000`.
- Running the application successfully at `localhost:7775`.
- Providing step-by-step documentation for creating, configuring, and running the project.
