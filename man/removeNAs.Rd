% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/removeNAs.R
\name{removeNAs}
\alias{removeNAs}
\title{Remove columns that exceed a specified percentage of missing values}
\usage{
removeNAs(df, pct = 0.85)
}
\arguments{
\item{df}{The name of the dataframe, not in quotes, for which the columns need to be converted to character class.}

\item{pct}{The minimum percentage of missing data that will cause a column to be deleted.}
}
\value{
Dataframe
}
\description{
Remove columns that exceed a specified percentage of missing values. The default is set to remove anything above 85%.
}

