% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasetSummary.R
\name{datasetSummary}
\alias{datasetSummary}
\title{Summary of a single dataset}
\usage{
datasetSummary(dataframe)
}
\arguments{
\item{dataframe}{The name of the dataframe that you want to summarize.}
}
\value{
Dataframe.
}
\description{
Perhaps a more concise summary of a dataframe relative to base::summary(df).

It includes information about the modal value for character and factor classes. It also identifies columns that could be a primary key
}

