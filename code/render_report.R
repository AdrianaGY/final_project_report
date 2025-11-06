here::i_am(
  "code/render_report.R"
)

rmarkdown::render(
  here::here("Final_project.Rmd"),
  output_file = here::here("Final_project.html")
)