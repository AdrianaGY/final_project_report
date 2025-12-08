# Final project - Hypertension screening Pilot: A process evaluation 
DATA 550: Final Project
Author:Adriana Gutierrez Yllu

## Overview
This project evaluates a pilot hypertension screening program. The goals are:
1. Identify barriers and facilitators to participation.
2. Assess participant preferences for future program implementation.

The final product is a fully reproducible HTML report generated using `make` and Docker.

---

## Repository Structure
- `data/` - Raw project data.
- `code/` - Scripts to clean data, create table 1, figure 1, and render the report.
- `output/` - Generated RDS files and plots.
- `report/` - Folder where the compiled HTML report will be saved (via Docker).
- `Final_project.Rmd` - Main RMarkdown report.
- `Makefile` - Automates building the report and managing outputs.
- `Dockerfile` - Builds a Docker image for fully reproducible report generation.

---

#1.Instructions to generate the report LOCALLY (without Docker)
From the project root, run: 
```bash
make Final_project.html
```
This will: 
1. Load and clean the data (`code/load_data.R` -> `output/cleaned_data.RDS`)
2. Generate Table1 (`code/make_table.R` -> `output/table1.RDS`)
3. Generate Figure1 (`code/Firgure1.R` -> `output/figure1.RDS` and `output/graph1.png`)
4. Render the final HTML report (`code/render_reprot.R` -> `report/Final_project.html`)

To remove outputs and final_report (clean the directory):
```bash
make clean
```

#2.Instructions to generate the report USING DOCKER
This project includes a Docker image that generates the report automatically.

Image: adrianagy/final_project_image2


a) Build the Docker image (optional)
   If you want to rebuild the Docker image locally, you can run:
   ```bash
      docker build -t adrianagy/final_project_image .
   ```
   This step is optional. It is included here for completeness (based on rubric). 
   You do not need to do this to generate the report if you use the Docker Hub image.
   
b) Run the Docker image without prerequisites
   Using the Makefile:
   ```bash
   make docker-run
   ```
   Or directly:
   ```bash
   docker run --rm \
  -v "$(PWD)/output":/Final_project/output \
  -v "$(PWD)/report":/Final_project/report \
  adrianagy/final_project_image2
   ```
   
This will:
- Automatically download the Docker image from Docker Hub if it's not already
  on your local.
- Run the container using the Docker image.
- Store outputs in the `output/` folder.
- Generate the `Final_project.html` inside `report/` folder.

Note for Windows (Git Bash) users:
- Windows paths behave differently, so Git Bash often requires an extra `/` at the beginning of mounted paths, as follows:
```bash
docker run --rm \
  -v "/$(pwd)/output":/Final_project/output \
  -v "/$(pwd)/report":/Final_project/report \
  adrianagy/final_project_image2
```