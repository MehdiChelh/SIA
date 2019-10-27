# Module UI
  
#' @title   mod_episodes_ui and mod_episodes_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_episodes
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
#' @importFrom stringi stri_rand_lipsum
mod_episodes_ui <- function(id){
  ns <- NS(id)
  argonTabItem(
    tabName = "episodes",
    argonRow(
      argonColumn(
        width = 12,
        argonProfile(
          title = "Plus Belle la Vie",
          src = "www/pblv_cover_2.png",
          url = "https://www.google.com",
          url_1 = "https://www.google.com",
          url_2 = "https://www.google.com",
          stats = argonProfileStats(
            argonProfileStat(
              value = "16%",
              description = "PDM 2018"
            ),
            argonProfileStat(
              value = "18%",
              description = "PDM 2019"
            ),
            argonProfileStat(
              value = "12.5%",
              description = "Evolution"
            )
          ),
          stringi::stri_rand_lipsum(1)
        )
      )
    )
    # argonRow(
    #   br(), br(),
    #   argonCard(
    #     width = 12,
    #     title = "Argon Card",
    #     src = NULL,
    #     hover_lift = TRUE,
    #     shadow = TRUE,
    #     shadow_size = NULL,
    #     hover_shadow = FALSE,
    #     border_level = 0,
    #     icon = "atom",
    #     status = "primary",
    #     background_color = NULL,
    #     gradient = FALSE, 
    #     floating = FALSE,
    #     argonRow(
    #       argonColumn(
    #         width = 6,
    #         radioButtons(
    #           "dist", 
    #           "Distribution type:",
    #           c("Normal" = "norm",
    #             "Uniform" = "unif",
    #             "Log-normal" = "lnorm",
    #             "Exponential" = "exp")
    #         )
    #       ),
    #       argonColumn(width = 6, plotOutput("plot"))
    #     )
    #   ) 
    # ),
    # br(),
    # argonRow(
    #   argonInfoCard(
    #     value = "350,897", 
    #     title = "TRAFFIC", 
    #     stat = 3.48, 
    #     stat_icon = "arrow-up",
    #     description = "Since last month", 
    #     icon = "chart-bar", 
    #     icon_background = "danger",
    #     hover_lift = TRUE
    #   ),
    #   argonInfoCard(
    #     value = "2,356", 
    #     title = "NEW USERS", 
    #     stat = -3.48, 
    #     stat_icon = "arrow-down",
    #     description = "Since last week", 
    #     icon = "chart-pie", 
    #     icon_background = "warning",
    #     shadow = TRUE
    #   ),
    #   argonInfoCard(
    #     value = "924", 
    #     title = "SALES", 
    #     stat = -1.10, 
    #     stat_icon = "arrow-down",
    #     description = "Since yesterday", 
    #     icon = "users", 
    #     icon_background = "yellow",
    #     background_color = "default"
    #   ),
    #   argonInfoCard(
    #     value = "49,65%", 
    #     title = "PERFORMANCE", 
    #     stat = 12, 
    #     stat_icon = "arrow-up",
    #     description = "Since last month", 
    #     icon = "percent", 
    #     icon_background = "info",
    #     gradient = TRUE,
    #     background_color = "orange",
    #     hover_lift = TRUE
    #   )
    # )
    
    
  )
}
    
# Module Server
    
#' @rdname mod_episodes
#' @export
#' @keywords internal
    
mod_episodes_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_episodes_ui("episodes_ui_1")
    
## To be copied in the server
# callModule(mod_episodes_server, "episodes_ui_1")
 
