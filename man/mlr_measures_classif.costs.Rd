% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasureClassifCosts.R
\name{mlr_measures_classif.costs}
\alias{mlr_measures_classif.costs}
\alias{MeasureClassifCosts}
\title{Cost-sensitive Classification Measure}
\description{
Uses a cost matrix to create a classification measure.
True labels must be arranged in columns, predicted labels must be arranged  in rows.
The cost matrix is stored as slot \verb{$costs}.

For calculation of the score, the confusion matrix is multiplied element-wise with the cost matrix.
The costs are then summed up (and potentially divided by the number of observations if \code{normalize} is set to \code{TRUE}).

This measure requires the \link{Task} during scoring to ensure that the rows and columns of the cost matrix are in the same order as in the confusion matrix.
}
\section{Dictionary}{

This \link{Measure} can be instantiated via the \link[mlr3misc:Dictionary]{dictionary} \link{mlr_measures} or with the associated sugar function \code{\link[=msr]{msr()}}:\preformatted{mlr_measures$get("classif.costs")
msr("classif.costs")
}
}

\section{Meta Information}{

\itemize{
\item Type: \code{"classif"}
\item Range: \eqn{[0, \infty)}{[0, Inf)}
\item Minimize: \code{TRUE}
\item Required prediction: 'response'
}
}

\examples{
# get a cost sensitive task
task = tsk("german_credit")

# cost matrix as given on the UCI page of the german credit data set
# https://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data)
costs = matrix(c(0, 5, 1, 0), nrow = 2)
dimnames(costs) = list(truth = task$class_names, predicted = task$class_names)
print(costs)

# mlr3 needs truth in columns, predictions in rows
costs = t(costs)

# create measure which calculates the absolute costs
m = msr("classif.costs", id = "german_credit_costs", costs = costs, normalize = FALSE)

# fit models and calculate costs
learner = lrn("classif.rpart")
rr = resample(task, learner, rsmp("cv", folds = 3))
rr$aggregate(m)
}
\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Measure]{Measures}: \link{mlr_measures}

\code{as.data.table(mlr_measures)} for a complete table of all (also dynamically created) \link{Measure} implementations.

Other Measure: 
\code{\link{MeasureClassif}},
\code{\link{MeasureRegr}},
\code{\link{Measure}},
\code{\link{mlr_measures_debug}},
\code{\link{mlr_measures_elapsed_time}},
\code{\link{mlr_measures_oob_error}},
\code{\link{mlr_measures_selected_features}},
\code{\link{mlr_measures}}

Other classification measures: 
\code{\link{mlr_measures_classif.acc}},
\code{\link{mlr_measures_classif.auc}},
\code{\link{mlr_measures_classif.bacc}},
\code{\link{mlr_measures_classif.ce}},
\code{\link{mlr_measures_classif.dor}},
\code{\link{mlr_measures_classif.fbeta}},
\code{\link{mlr_measures_classif.fdr}},
\code{\link{mlr_measures_classif.fnr}},
\code{\link{mlr_measures_classif.fn}},
\code{\link{mlr_measures_classif.fomr}},
\code{\link{mlr_measures_classif.fpr}},
\code{\link{mlr_measures_classif.fp}},
\code{\link{mlr_measures_classif.logloss}},
\code{\link{mlr_measures_classif.mcc}},
\code{\link{mlr_measures_classif.npv}},
\code{\link{mlr_measures_classif.ppv}},
\code{\link{mlr_measures_classif.precision}},
\code{\link{mlr_measures_classif.recall}},
\code{\link{mlr_measures_classif.sensitivity}},
\code{\link{mlr_measures_classif.specificity}},
\code{\link{mlr_measures_classif.tnr}},
\code{\link{mlr_measures_classif.tn}},
\code{\link{mlr_measures_classif.tpr}},
\code{\link{mlr_measures_classif.tp}}

Other multiclass classification measures: 
\code{\link{mlr_measures_classif.acc}},
\code{\link{mlr_measures_classif.bacc}},
\code{\link{mlr_measures_classif.ce}},
\code{\link{mlr_measures_classif.logloss}}
}
\concept{Measure}
\concept{classification measures}
\concept{multiclass classification measures}
\section{Super classes}{
\code{\link[mlr3:Measure]{mlr3::Measure}} -> \code{\link[mlr3:MeasureClassif]{mlr3::MeasureClassif}} -> \code{MeasureClassifCosts}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{normalize}}{(\code{logical(1)})\cr
Normalize the costs?}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{costs}}{(numeric \code{matrix()})\cr
Matrix of costs (truth in columns, predicted response in rows).}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{MeasureClassifCosts$new()}}
\item \href{#method-clone}{\code{MeasureClassifCosts$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="aggregate">}\href{../../mlr3/html/Measure.html#method-aggregate}{\code{mlr3::Measure$aggregate()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="format">}\href{../../mlr3/html/Measure.html#method-format}{\code{mlr3::Measure$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="help">}\href{../../mlr3/html/Measure.html#method-help}{\code{mlr3::Measure$help()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="print">}\href{../../mlr3/html/Measure.html#method-print}{\code{mlr3::Measure$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="score">}\href{../../mlr3/html/Measure.html#method-score}{\code{mlr3::Measure$score()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasureClassifCosts$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasureClassifCosts$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
