1.include a README.md file that describes the contents of your repository
There are
- code
  - table.R 
  - render.R
  - plot.R
- README.md
- Makefile
- output
  - table1.rds
  - plot1.png
- final.Rmd
- world_population.csv
  
2. the README should make clear how to generate the final report and a brief description of the contents of the report\
 The table.R make table1 and plot.R make plot1, render.R render final.Rmd file. Makefile can generate report_final.html using table.R, plot.R render.R final.Rmd.
 
3.type "make pull_image" into the terminal to pull the image from Dockerhub. 

4. Then type "make final_report" to build the report. 

5. docker hub link:
https://hub.docker.com/layers/zhanxu/final_report/latest/images/sha256:3e5609a2686e3d521653f2b1c99483d77ccdd3e44edda793c5cffbc342ff7959