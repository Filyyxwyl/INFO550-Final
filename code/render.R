here::i_am("code/render.R")

library(rmarkdown)
# rendering a report in production mode
# save this file with a particular file anme
render(
  "final.Rmd",
  output_file = here::here("report.html")
)