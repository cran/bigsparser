% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/solve-sym.R
\name{sp_solve_sym}
\alias{sp_solve_sym}
\title{Solver for symmetric SFBM}
\usage{
sp_solve_sym(
  A,
  b,
  add_to_diag = rep(0, ncol(A)),
  tol = 1e-10,
  maxiter = 10 * ncol(A)
)
}
\arguments{
\item{A}{A symmetric \link[=SFBM-class]{SFBM}.}

\item{b}{A vector.}

\item{add_to_diag}{Vector (or single value) to \emph{virtually} add to
the diagonal of \code{A}. Default is 0s.}

\item{tol}{Tolerance for convergence. Default is \code{1e-10}.}

\item{maxiter}{Maximum number of iterations for convergence.}
}
\value{
The vector x, solution of Ax=b.
}
\description{
Solve Ax=b where A is a symmetric SFBM, and b is a vector.
}
\examples{
N <- 100
spmat <- Matrix::rsparsematrix(N, N, 0.01, symmetric = TRUE)
X <- bigsparser::as_SFBM(as(spmat, "dgCMatrix"))
b <- runif(N)

test <- tryCatch(as.vector(Matrix::solve(spmat, b)), error = function(e) print(e))
test2 <- tryCatch(sp_solve_sym(X, b), error = function(e) print(e))

test3 <- as.vector(Matrix::solve(spmat + Matrix::Diagonal(N, 1:N), b))
test4 <- sp_solve_sym(X, b, add_to_diag = 1:N)
all.equal(test3, test4)

}
