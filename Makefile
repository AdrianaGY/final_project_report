all: Final_project.html

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
	rm -f output/*.RDS && rm -f output/*.png && rm -f report/Final_project.html

# Run Docker image from Docker Hub
docker-run:
	mkdir -p output report
	docker run --rm \
		-v "$(PWD)/output":/Final_project/output \
		-v "$(PWD)/report":/Final_project/report \
		adrianagy/final_project_image2