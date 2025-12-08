FROM rocker/tidyverse:4.5.1

# Install system dependencies
RUN apt-get update && apt-get install -y\
  pandoc \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-fonts-recommended \
  && rm -rf /var/lib/apt/lists/*
  
# Install required R packages
RUN R -e "install.packages(c('readxl', 'here', 'dplyr', 'labelled', 'gtsummary', 'broom', 'ggplot2', 'rmarkdown'), repos='https://cloud.r-project.org/')"

# Set working directory
WORKDIR /Final_project

#Copy project files
COPY data/ data/
COPY code/ code/
COPY report/ report/
COPY Final_project.Rmd .

# Create output folder
RUN mkdir -p output report

# Set output directory as mountable volume
VOLUME ["/Final_project/output"]
VOLUME ["/Final_project/report"]

# Run the complete pipeline
CMD set -e && \
    Rscript code/load_data.R && \
    Rscript code/make_table.R && \
    Rscript code/Figure1.R && \
    Rscript code/render_report.R && \
    echo "Final report generated! Check 'report' folder"