# Module UI
  
#' @title   mod_modeling_scenario_ui and mod_modeling_scenario_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_modeling_scenario
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_modeling_scenario_ui <- function(id){
  ns <- NS(id)
  argonTabItem(
    tabName = "modeling_scenario",
    argonRow(
      argonCard(
        width = 12,
        src = NULL,
        icon = "sound-wave",
        status = "success",
        shadow = TRUE,
        border_level = 2,
        hover_shadow = TRUE,
        title = "Modélisation scénario",
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
    
#' @rdname mod_modeling_scenario
#' @export
#' @keywords internal
    
mod_modeling_scenario_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_modeling_scenario_ui("modeling_scenario_ui_1")
    
## To be copied in the server
# callModule(mod_modeling_scenario_server, "modeling_scenario_ui_1")
 
