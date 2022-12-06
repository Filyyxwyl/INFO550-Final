## output/table_one.rds: This is the table 1 summary created using gtsummary

report_final.html: code/render.R \
  final.Rmd output/table1.rds output/plot1.png
	Rscript code/render.R
	
	
output/table1.rds: code/table1.R world_population.csv 
	Rscript code/table1.R 
	

output/plot1.png: code/plot.R world_population.csv
	Rscript code/plot.R
	
# Cleaning up files from previous builds
# command: make clean 
.PHONY: clean
# not only remove .rds file. if the sentencs before '&&' doesn't work, it won't go on
clean:
	rm -f output/*.rds && rm -f output/*.png  && rm -f *.html
	
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
# Building the project image
project_image:
	docker build -t zhanxu/final_report .

# Pull the project image from Dockerhub 
pull_image:
	docker pull zhanxu/final_report

# Build the report automatically in our container
.PHONY: final_report
final_report:
	docker run -v "/$$(pwd)/final_report":/project/final_report zhanxu/final_report