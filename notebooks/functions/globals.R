#function to filter spending categories and types
filter_data_ts <- function(category, type) {
  overall_spending <- filter(construction, cat_idx==category & dt_idx ==type)
  combined <- merge(overall_spending, date_index, by = "per_idx")
  combined$per_name <- paste(combined$per_name,"-01",sep="")
  combined$date <- as.Date(combined$per_name, format = "%b-%y-%d")
  return(ts(combined$val, start = c(2002, 1), frequency = 12))
}