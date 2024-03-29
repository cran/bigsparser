% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prod.R
\name{sp_prodVec}
\alias{sp_prodVec}
\alias{sp_cprodVec}
\title{Products with a vector}
\usage{
sp_prodVec(X, y)

sp_cprodVec(X, y)
}
\arguments{
\item{X}{An \link[=SFBM-class]{SFBM}.}

\item{y}{A vector of same size of the number of columns of \code{X} for
\code{sp_prodVec()} abd as the number of rows of \code{X} for \code{sp_cprodVec()}.}
}
\value{
\itemize{
\item \code{sp_prodVec()}: the vector which is equivalent to \code{X \%*\% y}
if \code{X} was a dgCMatrix.
\item \code{sp_cprodVec()}: the vector which is equivalent to \code{Matrix::crossprod(X, y)}
if \code{X} was a dgCMatrix.
}
}
\description{
Products between an \link[=SFBM-class]{SFBM} and a vector.
}
\examples{
spmat <- Matrix::rsparsematrix(1000, 1000, 0.01)
X <- as_SFBM(spmat)
sp_prodVec(X, rep(1, 1000))
sp_cprodVec(X, rep(1, 1000))

}
