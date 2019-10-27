# Module UI
  
#' @title   mod_modeling_budget_ui and mod_modeling_budget_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_modeling_budget
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_modeling_budget_ui <- function(id){
  ns <- NS(id)
  argonTabItem(
    tabName = "modeling_budget",
    argonRow(
      argonCard(
        width = 12,
        src = NULL,
        icon = "sound-wave",
        status = "success",
        shadow = TRUE,
        border_level = 2,
        hover_shadow = TRUE,
        title = "Modélisation budget",
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
    
#' @rdname mod_modeling_budget
#' @export
#' @keywords internal
    
mod_modeling_budget_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_modeling_budget_ui("modeling_budget_ui_1")
    
## To be copied in the server
# callModule(mod_modeling_budget_server, "modeling_budget_ui_1")
 
