# 02_summary.R
# Save human-readable summary and simple descriptives for the survey data
# Replace 'sme_bi_survey_v2' with your object name if different

dir.create("outputs", showWarnings = FALSE)

obj <- sme_bi_survey_v2  # <- **اگر اسمت فرق دارد این را عوض کن**

# 1) save plain text of summary() (good for appendix / human reading)
capture.output(summary(obj), file = "outputs/sme_bi_survey_v2_summary.txt")

# 2) save a simple descriptive table (mean, sd, n) for numeric variables as CSV
num_cols <- sapply(obj, is.numeric)
if (any(num_cols)) {
  num_df <- obj[, num_cols, drop = FALSE]
  desc <- data.frame(
    variable = names(num_df),
    mean = sapply(num_df, mean, na.rm = TRUE),
    sd = sapply(num_df, sd, na.rm = TRUE),
    n = sapply(num_df, function(x) sum(!is.na(x)))
  )
  write.csv(desc, "outputs/sme_bi_survey_v2_descriptives.csv", row.names = FALSE)
} else {
  message("No numeric columns found; descriptives CSV not created.")
}

# 3) save session info for reproducibility
writeLines(capture.output(sessionInfo()), "outputs/sessionInfo.txt")
