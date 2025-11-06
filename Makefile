Final_project.html: Final_project.Rmd output/table1.RDS output/figure1.RDS
	Rscript code/render_report.R

output/figure1.RDS: code/Figure1.R output/cleaned_data.RDS
	Rscript code/Figure1.R

output/table1.RDS: code/make_table.R output/cleaned_data.RDS
	Rscript code/make_table.R

output/cleaned_data.RDS: code/load_data.R data/raw_data.xlsx
	Rscript code/load_data.R

.PHONY: clean
clean:
	rm -f output/*.RDS && rm -f output/*.png && rm -f Final_project.html

