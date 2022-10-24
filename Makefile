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