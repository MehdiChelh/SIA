#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  callModule(mod_score_server, "episodes")
  callModule(mod_score_server, "score")
}
