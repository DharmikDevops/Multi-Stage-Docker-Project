# 🚀 *Node.js Multi-Stage Docker Project*

This project demonstrates a simple Node.js application utilizing **multi-stage Docker builds** to create a light weight production-ready image. It showcases best practices for containerized application development.

## *📖 About the Project*

This is a simple Node.js web server that responds with "Hello, GitHub Multi-Stage Docker Build!" on the root endpoint. The project uses multi-stage Docker builds to:

- Minimize the final image size

- Optimize performance for production environments
  

## *✨ Features*
- **Multi-Stage Build:** Ensures minimal image size and optimal performance

- **Alpine Linux:** Lightweight base image for production

- **Seamless Setup:** Easy to build and deploy

- **Portability:** Fully containerized for consistent behaviour across different environments
  

## *🛠️ Technologies Used*
- **Node.js v18:** Lightweight, event-driven JavaScript runtime

- **Docker:** Containerization for consistent builds and deployments
 
- **Alpine Linux:** Small, secure base image for production

---

# ⚙️ *Getting Started*

## *🔧 Prerequisites*

Make sure the following are installed on your system:

- **Docker** (v20+ recommended)

- **Node.js** (for local development, if needed)


## 📦 *Installation*

1. **Clone the Repository:**
   ```
   git clone https://github.com/DharmikDevops/my-multi-stage-node-app.git
   ```

2. **Navigate to the Directory:**
   ```
   cd my-multi-stage-node-app
   ```

3. **Build the Docker Image:**
   ```
   docker build -t my-multi-stage-node-app .
   ```


## 🚀 *Usage*

1. **Run the Application:**
   ```
   docker run -d -p 3000:3000 my-multi-stage-node-app
   ```
   
2. **Access the Application:**
Open your browser and navigate to:
http://localhost:3000

You should see the message: Hello, GitHub Multi-Stage Docker Build!


## 🐳 *Docker Workflow*

### Multi-Stage Build Overview:

- **Stage 1: Build**

  - Installs dependencies and builds the app using node:18.

  - Optimizes the application by excluding unnecessary files.


- **Stage 2: Production**

  - Copies only essential files from the build stage.

  - Uses node:18-alpine to reduce image size.



## *Dockerfile Sample:*
```
# Stage 1: Build
FROM node:18 AS build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

# Stage 2: Production
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "index.js"]
```

---

## 📈 *Project Architecture*

my-multi-stage-node-app/ <br>
├── Dockerfile       # Multi-stage Dockerfile <br>
├── package.json     # Dependencies and project metadata <br>
├── index.js         # Node.js application code <br>
├── .dockerignore    # Files to exclude from Docker builds <br>
├── README.md        # Project documentation <br>

---
