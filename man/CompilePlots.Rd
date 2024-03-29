% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compilation_general.R
\name{CompilePlots}
\alias{CompilePlots}
\title{CompilePlots}
\usage{
CompilePlots(data, design, wt_data = "not_needed", fpc_data = "not_needed")
}
\arguments{
\item{data}{A dataframe or tibble. Data must already be summarized to the plot-level. Required columns depend on the sampling design:
\itemize{
\item Simple random sampling: must have time, site, and plot columns. A species column is optional. Other columns can be any numerical variables of interest (any column names, any number of variables).
\item Stratified random sampling: must have time, site, stratum, and plot columns. A species column is optional. Other columns can be any numerical variables of interest (any column names, any number of variables).
\item Fire and Fire Surrogate: must have time, trt_type, site, and plot columns. A species column is optional. Other columns can be any numerical variables of interest (any column names, any number of variables).
}}

\item{design}{Specifies the sampling design. Must be set to "SRS" (simple random sample), "STRS" (stratified random sample), or "FFS" (Fire and Fire Surrogate). There is no default.}

\item{wt_data}{Only required for stratified random sampling designs. A dataframe or tibble with the following columns: time (optional), site, stratum, and wh (stratum weight). The default is set to "not_needed", and should be left as such for design = "SRS" or design = "FFS".}

\item{fpc_data}{An optional dataframe or tibble. Incorporates the finite population correction factor (FPC) when samples were taken without replacement. The default is set to "not_needed". Required columns depend on the sampling design:
\itemize{
\item Simple random sampling: must have site, N, and n columns. A time column is optional.
\item Stratified random sampling: must have site, stratum, N, and n columns. A time column is optional.
\item Fire and Fire Surrogate: must have trt_type, site, N and n columns. A time column in optional.
}}
}
\value{
Depends on the sampling design:
\itemize{
\item Simple random sampling: a dataframe with site-level summaries.
\item Stratified random sampling: a list with two components: (1) a dataframe with stratum-level summaries and (2) a dataframe with site-level summaries.
\item Fire and Fire Surrogate: a list with two components: (1) a dataframe with site-level (i.e., compartment-level) summaries and (2) a dataframe with treatment-level summaries.
}
}
\description{
Compiles data beyond the plot level. Recognizes simple random sampling and stratified random sampling designs. Also recognizes the design of the Fire and Fire Surrogate. See \href{https://github.com/kearutherford/BerkeleyForestsAnalytics/tree/main}{README} for details.
}
\examples{
CompilePlots(data = compilation_srs_demo,
             design = "SRS",
             wt_data = "not_needed",
             fpc_data = "not_needed")

CompilePlots(data = compilation_strs_demo,
             design = "STRS",
             wt_data = compilation_wt_demo,
             fpc_data = "not_needed")

}
