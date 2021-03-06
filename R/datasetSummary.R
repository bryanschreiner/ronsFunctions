#' @title Summary of a single dataset
#' @description Perhaps a more concise summary of a dataframe relative to base::summary(df).
#'
#' It includes information about the modal value for character and factor classes. It also identifies columns that could be a primary key
#' @param dataframe The name of the dataframe that you want to summarize.
#' @return Dataframe.
#' @export
datasetSummary <- function(dataframe){
  for(i in 1:ncol(dataframe)){
    if(i == 1){
      dfs <<- data.frame()
    }
    temp <- dataframe[,i]
    if(class(temp) == "integer" | class(temp) == "numeric"){
      tdf <- data.frame(
        name = colnames(dataframe)[i],
        class = class(temp),
        uniqueKey = ifelse(nrow(table(temp) %>% as.data.frame(stringsAsFactors = F)) == length(temp), "Yes", "No"),
        uniqueValues = nrow(table(temp) %>% as.data.frame(stringsAsFactors = F)),
        top5UniqueValues = table(temp) %>% as.data.frame(stringsAsFactors = F) %>% dplyr::arrange(-Freq) %>% .[1:5,1] %>% paste(collapse = "||"),
        uniqueValuesPct = round(nrow(table(temp) %>% as.data.frame())/length(temp), 2),
        NAs_and_blanks = temp[which(temp == "" | is.na(temp))] %>% length(),
        NAs_and_blanksPct = temp[which(temp == "" | is.na(temp))] %>% length() / length(temp),
        mode = table(temp) %>% as.data.frame(stringsAsFactors = F) %>% dplyr::arrange(-Freq) %>% .[1,1] %>% as.character(),
        max = max(temp, na.rm = T),
        mean = mean(temp, na.rm = T),
        median = median(temp, na.rm = T),
        min = min(temp, na.rm = T)
      )
    } else {
      tdf <- data.frame(
        name = colnames(dataframe)[i],
        class = class(temp),
        uniqueKey = ifelse(nrow(table(temp) %>% as.data.frame(stringsAsFactors = F)) == length(temp), "Yes", "No"),
        uniqueValues = nrow(table(temp) %>% as.data.frame(stringsAsFactors = F)),
        top5UniqueValues = table(temp) %>% as.data.frame(stringsAsFactors = F) %>% dplyr::arrange(-Freq) %>% .[1:5,1] %>% paste(collapse = "||"),
        uniqueValuesPct = round(nrow(table(temp) %>% as.data.frame(stringsAsFactors = F))/length(temp), 2),
        NAs_and_blanks = temp[which(temp == "" | is.na(temp))] %>% length(),
        NAs_and_blanksPct = round(temp[which(temp == "" | is.na(temp))] %>% length() / length(temp), 4),
        mode = table(temp) %>% as.data.frame(stringsAsFactors = F) %>% dplyr::arrange(-Freq) %>% .[1,1] %>% as.character(),
        max = NA,
        mean = NA,
        median = NA,
        min = NA
      )
    }
    dfs <- bind_rows(dfs, tdf)
  }
  return(dfs)
}
