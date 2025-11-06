library(readxl)
library(here)
library(dplyr)
library(labelled)

here::i_am("code/load_data.R")
data <- read_excel(here::here("data", "raw_data.xlsx"))


# Label variables
var_label(data) <- list(
  participant_ID = "ID",
  age = "Age",
  gender = "Gender",
  ethnicity = "Ethnicity",
  race = "Race",
  job_currently = "Actively working",
  insurance = "Insurance",
  fast_food_daily = "Daily consumption of fast food",
  veggies_daily = "Daily consusmtion of vaggies",
  sweet_beverages_frequency = "Sweetened beverages",
  nutrition_talk_ever = "Nutrition talk ever",
  challenges_healthy_food = "Challenges to consume healthy food",
  hear_about_program = "How did you hear about this program?",
  reason_attendance_today = "Reason to attend today",
  first_hypertension_screening_ever = "First time in a HTN screening",
  location_convenient = "Was the location convenient to you?",
  needed_healthcare_couldnt_access = "Have you ever needed medical care and been unable to get it?",
  personal_history_hypertension = "Previous diagnosis of Hypertension",
  family_history_hypertension = "Family member with hypertension",
  systolic_bp = "Systolic BP",
  dyastolic_bp = "Dyastolic BP",
  bp_normal = "BP normal?",
  high_bp_informed = "Were you informed about your BP after the measurement?",
  followup_with_provider = "Were you adviced to FU with a healthcare provider?",
  access_provider_perception = "Will you be able to FU with a provider?",
  access_treatment_perception = "Will you be able to get treatment?",
  lify_Style_change_dic = "",
  salt_reduction = "Reduced salt consumption",
  exercise = "Excercise",
  started_treatment = "Treatment initiated",
  life_style_changes_all = "All lifestyle changes",
  want_follow_up = "Desire to join the program",
  best_contact = "Contact method preference",
  day_preference = "Preferred day for contact",
  day_time = "Preferred time for contact",
  gave_phone_number = "Phone number provideed",
  reach_more_ppl = "How can we reach more people?",
  other_comments_improve = "Extra comments on how to improve the program"
)

data$age_cat <- ifelse(data$age <= 50, "50 years or younger", "Over 50 years")

saveRDS(data, file = here::here("output", "cleaned_data.RDS"))