# 🐳 docker-starter
*Use this required starter pack for all assignments in [BEW 2.2: DevOps, Deployments &amp; Containers](https://make.sc/bew2.2).*

## 📂 Project Files
| Filename | Description |
| -------- | ----------- |
| `.gitignore` | General ignore file. Optimized for Python. |
| `.dockerignore` | A list of files that will not be copied during build. |
| `captain-definition` | **DO NOT MODIFY.** Used by CapRover for deployment. |
| `Dockerfile` | **Implement solutions in this file**. |
| `README.md` | Replace this `README` with content describing the purpose of your project. |

## 📦 Building & Running

### 1️⃣ Build
*Builds the `Dockerfile` found at the current path (`.`).*
```bash
$ docker build -t noltron000/docker-history .
```

### 2️⃣ Run & Test
*Runs the `docker-history` image. Deletes the container after executing the `CMD`.*
```bash
$ #                      container name
$ #                      ↓↓↓↓↓↓↓↓↓↓↓↓↓↓  image name on dockerhub
$ #                      ↓↓↓↓↓↓↓↓↓↓↓↓↓↓  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
$ docker run --rm --name docker-history noltron000/docker-history
```
