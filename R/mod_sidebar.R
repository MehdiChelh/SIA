# Module UI
  
#' @title   mod_sidebar_ui and mod_sidebar_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_sidebar
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_sidebar_ui <- function(id){
  
  ns <- NS(id)
  
  argonDashSidebar(
    vertical = TRUE,
    skin = "light",
    background = "white",
    size = "lg",
    side = "left",
    id = "my_sidebar",
    brand_url = "#",
    brand_logo = "https://demos.creative-tim.com/argon-design-system/assets/img/brand/blue.png",
    dropdownMenus = argonDropNav(
      title = "Dropdown Menu", 
      src = "https://demos.creative-tim.com/argon-dashboard/assets/img/theme/team-4-800x800.jpg", 
      orientation = "right",
      argonDropNavTitle(title = "Welcome!"),
      argonDropNavItem(
        title = "Item 1", 
        src = "#", 
        icon = argonIcon("single-02")
      ),
      argonDropNavItem(
        title = "Item 2", 
        src = NULL, 
        icon = argonIcon("settings-gear-65")
      ),
      argonDropNavDivider(),
      argonDropNavItem(
        title = "Item 3", 
        src = "#", 
        icon = argonIcon("calendar-grid-58")
      )
    ),
    argonSidebarHeader(title = "Menu principal"),
    argonSidebarMenu(
      argonSidebarItem(
        tabName = "episodes",
        icon = "tv-2",
        icon_color = "default",
        "Episodes"
      ),
      argonSidebarItem(
        tabName = "score",
        icon = "chart-bar-32",
        icon_color = "warning",
        "Score"
      ),
      argonSidebarItem(
        tabName = "modeling_scenario",
        icon = "sound-wave",
        icon_color = "warning",
        "Modélisation scénario"
      ),
      argonSidebarItem(
        tabName = "budget",
        icon = "money-coins",
        icon_color = "success",
        "Budget historique"
      ),
      argonSidebarItem(
        tabName = "modeling_budget",
        icon = "sound-wave",
        icon_color = "success",
        "Modelisation budget"
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_sidebar
#' @export
#' @keywords internal
    
mod_sidebar_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")
    
## To be copied in the server
# callModule(mod_sidebar_server, "sidebar_ui_1")
 
