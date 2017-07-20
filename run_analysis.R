download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "project.zip", method = "curl")
unzip("project.zip", exdir = "project2017", junkpaths = TRUE)
setwd("project2017")
library(data.table)
library(dplyr)
library(tidyr)
filename <- list.files()[-match(c("README.txt", "features_info.txt"),
                                list.files())]
listfile <- lapply(as.list(filename), fread)
for(i in 1:length(filename)) {
      names(listfile)[i] <- strsplit(filename, "\\.")[[i]][1]
}
list <- lapply(listfile, tbl_df)
list2env(list, .GlobalEnv)
data <- bind_rows(bind_cols(X_test, subject_test, y_test),
                  bind_cols(X_train, subject_train, y_train))
names(data) <- c(features$V2, c("subject", "activity"))
pat <- c("1", "2", "3", "4", "5", "6")
data$activity <- as.character(data$activity)
for (i in 1:6) {
      data$activity <- sub(pat[i], activity_labels$V2[i], data$activity)
}
data <- data[,c(grep("mean|std", names(data)), c(562, 563))]
maindata <- group_by(data, subject, activity) %>%
            summarise_all(funs(mean))
write.table(maindata, file = "../maindata.txt", row.names = FALSE)