# 02_descriptives.R
# Descriptive statistics and save as CSV

dir.create("outputs", showWarnings = FALSE)

# Select numeric columns (adjust if needed)
num_df <- dplyr::select_if(sme_bi_survey_v2, is.numeric)

# Descriptive table: mean, sd, n
desc <- data.frame(
  variable = names(num_df),
  mean = sapply(num_df, mean, na.rm = TRUE),
  sd = sapply(num_df, sd, na.rm = TRUE),
  n = sapply(num_df, function(x) sum(!is.na(x)))
)

write.csv(desc, "outputs/descriptives_table.csv", row.names = FALSE)
