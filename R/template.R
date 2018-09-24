library(git2r)

#' template
#'
#' Clone a template, change remote origin, push
#' @param template url to the template repository
#' @param dest destination remote url
#' @param public should the new GitHub repository be public or private?
#'
#' @param ... additional arguments to git2r functions
#'
#' @details url can be any git address we can use to clone (e.g. https://, git@@github.com:)
#' @importFrom git2r clone remote_add remote_remove push
#' @importFrom gh gh
#' @examples
#' \dontrun{
#' template("https://github.com/cboettig/template",
#'          "https://github.com/boettiger-lab/mypkg")
#' }
template <- function(template, dest, public = FALSE, ...){
  repo <- git2r::clone(template)
  git2r::remote_remove(repo, "origin")
  git2r::remote_add(repo, "origin", dest)

  ## Create repo via the GitHub API

  #git2r::push(repo)
}

