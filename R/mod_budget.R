# Module UI
  
#' @title   mod_budget_ui and mod_budget_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_budget
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_budget_ui <- function(id){
  ns <- NS(id)
  argonTabItem(
    tabName = "budget",
    argonRow(
      argonCard(
        width = 12,
        src = NULL,
        icon = "money-coins",
        status = "success",
        shadow = TRUE,
        border_level = 2,
        hover_shadow = TRUE,
        title = "Budget historique",
        argonRow(
          argonColumn(
            width = 12,
            "Comming soon..."
          )
        )
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_budget
#' @export
#' @keywords internal
    
mod_budget_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_budget_ui("budget_ui_1")
    
## To be copied in the server
# callModule(mod_budget_server, "budget_ui_1")
 
