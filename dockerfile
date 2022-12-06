# choose to do your development at the command line
FROM rocker/r-ubuntu

# Install packages
RUN apt-get update && apt-get install -y pandoc libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev

# make a project directory and make it the working directory
RUN mkdir /project
WORKDIR /project

# make directories
RUN mkdir code
RUN mkdir output

# copy files to the image
COPY Makefile .
COPY README.md .
COPY final.Rmd .

# copy renv-relevant files to the project image directory
COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/settings.dcf renv
COPY renv/activate.R renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

# Copy code and raw data to the image
COPY code/* code
COPY world_population.csv .

# make directory for final_report
RUN mkdir final_report

# Create report and copy it to the final_report directory in containor
CMD make && mv report_final.html final_report



