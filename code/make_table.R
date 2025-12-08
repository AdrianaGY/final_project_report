library(gtsummary)
library(here)
library(dplyr)
library(broom)

data <- readRDS(here::here("output", "cleaned_data.RDS"))

table1 <- data |>
  select("gender", "race", "ethnicity", "age_cat", "insurance",  "job_currently", "nutrition_talk_ever", "fast_food_daily", "sweet_beverages_frequency", "veggies_daily", "challenges_healthy_food", "personal_history_hypertension", "family_history_hypertension") |>
  tbl_summary(by = "age_cat") |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Participants stratified by age**") |>
  add_overall() |>
  add_p()

saveRDS(table1, file = here::here("output", "table1.RDS"))
