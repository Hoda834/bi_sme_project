# 01_save_raw.R
# Save a raw copy of the survey and print a quick summary.
# (Run this after loading your workspace in RStudio)

# create outputs folder if not exists
dir.create("outputs", showWarnings = FALSE)

# Save a copy of the raw survey data (replace name if your object has different name)
write.csv(sme_bi_survey_v2, "outputs/sme_bi_survey_v2_rawcopy.csv", row.names = FALSE)

# Basic info to help reproducibility
writeLines(capture.output(sessionInfo()), "outputs/sessionInfo.txt")

# Quick console summary (optional: useful when re-running)
cat("Data dims:\n"); print(dim(sme_bi_survey_v2))
cat("\nColumn names:\n"); print(names(sme_bi_survey_v2))
cat("\nHead (first rows):\n"); print(utils::head(sme_bi_survey_v2))
cat("\nSummary:\n"); print(summary(sme_bi_survey_v2))
