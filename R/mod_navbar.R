# Module UI
  
#' @title   mod_navbar_ui and mod_navbar_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_navbar
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_navbar_ui <- function(id){
  ns <- NS(id)
  argonDashNavbar(
    argonDropNav(
      title = "Gestion", 
      src = "https://demos.creative-tim.com/argon-dashboard/assets/img/theme/team-4-800x800.jpg", 
      orientation = "right",
      argonDropNavTitle(title = "Série"),
      argonDropNavItem(
        title = "PBLV",
        src = "#",
        icon = "single-02"
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_navbar
#' @export
#' @keywords internal
    
mod_navbar_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_navbar_ui("navbar_ui_1")
    
## To be copied in the server
# callModule(mod_navbar_server, "navbar_ui_1")
 
