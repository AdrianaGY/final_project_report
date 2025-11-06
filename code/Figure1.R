library(here)
library(dplyr)
library(ggplot2)

data <- readRDS(here::here("output", "cleaned_data.RDS"))

percent_data <- data %>%
  group_by(age_cat, reach_more_ppl) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(age_cat) %>%
  mutate(percent = count / sum(count) * 100)

graph1 <- ggplot(percent_data, aes(x = reach_more_ppl, y = percent, fill = age_cat)) +
  geom_col(position = "dodge") +
  labs(
    title = "Suggestions to Reach More People by Age Group",
    x = "Suggestion",
    y = "Percentage (%)",
    fill = "Age Group"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(filename = here::here("output", "graph1.png"), plot = graph1, width = 8, height = 5)

saveRDS(graph1, file = here::here("output", "figure1.RDS"))

