% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extractCached.R
\name{extractCached}
\alias{extractCached}
\title{Extract cached objects}
\usage{
extractCached(prefix, chunk, objects)
}
\arguments{
\item{prefix}{String containing the prefix of the Rmarkdown file.}

\item{chunk}{String containing the name of the requested chunk.}

\item{objects}{Character vector containing variable names for one or more objects to be extracted.}
}
\value{
Variables with names \code{objects} are created in the global environment.
A markdown chunk (wrapped in a collapsible element) is printed that contains all commands needed to generate those objects, 
based on the code in the named chunks of the Rmarkdown file.
}
\description{
Extract specific R objects from the knitr cache of a previously compiled Rmarkdown file.
}
\details{
Each object is extracted in its state at the requested chunk at \code{chunk}.
Note that the object does not have to be generated or even referenced in \code{chunk},
provided it was generated in a previous chunk.

The Rmarkdown file is also subject to several constraints.
\itemize{
\item All chunks that can be referenced by \code{chunk} are named.
\item All named chunks are executed, i.e., no \code{eval=FALSE}.
\item All relevant code occurs within triple backticks, i.e., any inline code should be read-only.
\item All triple backticks occur at the start of the line, i.e., no code nested in list elements.
\item The report with prefix \code{prefix} has already been compiled with \code{cache=TRUE}.
\item Any assignment or modifications to variables are done \emph{correctly} with \code{<-}.
}

Unnamed chunks are allowed but cannot be referenced and will not be shown in the output of this function.
This should not be used for code that might affects varaiables in the named chunks.
}
\seealso{
\code{\link{setupHTML}} and \code{\link{chapterPreamble}}, to set up the code for the collapsible element.
}
\author{
Aaron Lun
}
