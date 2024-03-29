% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat_pp_line.R
\name{stat_pp_line}
\alias{stat_pp_line}
\title{Probability-probability lines}
\usage{
stat_pp_line(
  mapping = NULL,
  data = NULL,
  geom = "path",
  position = "identity",
  na.rm = TRUE,
  show.legend = NA,
  inherit.aes = TRUE,
  ab = c(0, 1),
  detrend = FALSE,
  ...
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}}. If specified and
\code{inherit.aes = TRUE} (the default), it is combined with the default mapping
at the top level of the plot. You must supply \code{mapping} if there is no plot
mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{geom}{The geometric object to use to display the data, either as a
\code{ggproto} \code{Geom} subclass or as a string naming the geom stripped of the
\code{geom_} prefix (e.g. \code{"point"} rather than \code{"geom_point"})}

\item{position}{Position adjustment, either as a string naming the adjustment
(e.g. \code{"jitter"} to use \code{position_jitter}), or the result of a call to a
position adjustment function. Use the latter if you need to change the
settings of the adjustment.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}

\item{ab}{Numeric vector of length two. The intercept (\code{a}) and slope
(\code{b}) of the P-P line. Defaults to the identity line (\code{a = 0, b =
1}).}

\item{detrend}{Logical. Should the plot objects be detrended? If \code{TRUE},
the objects will be detrended according to the default identity P-P line.
This procedure was described by Thode (2002), and may help reducing visual
bias caused by the orthogonal distances from P-P points to the reference
line.}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}
}
\description{
Draws a probability-probability line.
}
\examples{
# generate random Normal data
set.seed(0)
smp <- data.frame(norm = rnorm(100))

# Normal P-P plot of Normal data
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_pp_line() +
 stat_pp_point() +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg

# Shifted Normal P-P plot of Normal data
dp <- list(mean = 1.5)
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_pp_line() +
 stat_pp_point(dparams = dp) +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg

# Normal P-P plot of mean ozone levels (airquality dataset)
dp <- list(mean = 38, sd = 27)
gg <- ggplot(data = airquality, mapping = aes(sample = Ozone)) +
 stat_pp_line() +
	stat_pp_point(dparams = dp) +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg

}
