#' @import shiny
#' @import argonDash
#' @import argonR
#' @import magrittr
app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    argonDashPage(title = "Sia", description = "Artificial Intelligence for the  industry.", author = NULL,
                  # /////////////////
                  #   Sidebar
                  # /////////////////
                  sidebar = mod_sidebar_ui(NULL), 
                  # /////////////////
                  #   Navbar 
                  # /////////////////
                  navbar = mod_navbar_ui(NULL),
                  # /////////////////
                  #   Header
                  # /////////////////
                  header = argonDashHeader(
                    gradient = TRUE,
                    color = "primary",
                    separator = TRUE,
                    separator_color = "secondary",
                    br(),br(),
                    argonRow(
                      
                      argonInfoCard(
                        value = "350,897", 
                        title = "TRAFFIC", 
                        stat = 3.48, 
                        stat_icon = "arrow-up",
                        description = "Since last month", 
                        icon = "chart-bar", 
                        icon_background = "danger",
                        hover_lift = TRUE
                      ),
                      argonInfoCard(
                        value = "2,356", 
                        title = "NEW USERS", 
                        stat = -3.48, 
                        stat_icon = "arrow-down",
                        description = "Since last week", 
                        icon = "chart-pie", 
                        icon_background = "warning",
                        shadow = TRUE
                      ),
                      argonInfoCard(
                        value = "924", 
                        title = "SALES", 
                        stat = -1.10, 
                        stat_icon = "arrow-down",
                        description = "Since yesterday", 
                        icon = "users", 
                        icon_background = "yellow",
                        background_color = "default"
                      ),
                      argonInfoCard(
                        value = "49,65%", 
                        title = "PERFORMANCE", 
                        stat = 12, 
                        stat_icon = "arrow-up",
                        description = "Since last month", 
                        icon = "percent", 
                        icon_background = "info",
                        gradient = TRUE,
                        background_color = "orange",
                        hover_lift = TRUE
                      )
                      
                    ),
                    br(),br(),br()
                    # argonCard(
                    #   title = "Démo",
                    #   src = "http://www.google.com",
                    #   hover_lift = TRUE,
                    #   shadow = TRUE,
                    #   shadow_size = NULL,
                    #   hover_shadow = FALSE,
                    #   border_level = 0,
                    #   icon = "atom",
                    #   status = "primary",
                    #   background_color = NULL,
                    #   gradient = FALSE, 
                    #   floating = FALSE,
                    #   "This is the content"
                    # )
                  ), 
                  # /////////////////
                  #   Body
                  # /////////////////
                  body = argonDashBody(
                    argonTabItems(
                      mod_episodes_ui("episodes"),
                      mod_score_ui("score"),
                      mod_modeling_scenario_ui("modeling_scenario"),
                      mod_budget_ui("budget"),
                      mod_modeling_budget_ui("modeling_budget")
                    )
                  ),
                  footer = argonDashFooter())
    
  )
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = 'sia')
  )
 
  tags$head(
    golem::activate_js()
    #golem::favicon()
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    #tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}



#' @title cards_tab
#' 
#' @export
cards_tab <- argonTabItem(
  tabName = "cards",
  
  # classic cards
  argonH1("Classic Cards", display = 4),
  argonRow(
    argonCard(
      width = 12,
      src = NULL,
      icon = icon("cogs"),
      status = "success",
      shadow = TRUE,
      border_level = 2,
      hover_shadow = TRUE,
      title = "Shiny Inputs",
      argonRow(
        argonColumn(
          width = 6,
          sliderInput(
            "obs", 
            "Number of observations:",
            min = 0, 
            max = 1000, 
            value = 500
          )
        ),
        argonColumn(width = 6, plotOutput("distPlot"))
      )
    ),
    br(), br(),
    argonCard(
      width = 12,
      title = "Argon Card",
      src = NULL,
      hover_lift = TRUE,
      shadow = TRUE,
      shadow_size = NULL,
      hover_shadow = FALSE,
      border_level = 0,
      icon = argonIcon("atom"),
      status = "primary",
      background_color = NULL,
      gradient = FALSE, 
      floating = FALSE,
      argonRow(
        argonColumn(
          width = 6,
          radioButtons(
            "dist", 
            "Distribution type:",
            c("Normal" = "norm",
              "Uniform" = "unif",
              "Log-normal" = "lnorm",
              "Exponential" = "exp")
          )
        ),
        argonColumn(width = 6, plotOutput("plot"))
      )
    ) 
  ),
  br(),
  
  # info cards
  argonH1("Info Cards", display = 4),
  argonRow(
    argonInfoCard(
      value = "350,897", 
      title = "TRAFFIC", 
      stat = 3.48, 
      stat_icon = icon("arrow-up"),
      description = "Since last month", 
      icon = argonIcon("planet"), 
      icon_background = "danger",
      hover_lift = TRUE
    ),
    argonInfoCard(
      value = "2,356", 
      title = "NEW USERS", 
      stat = -3.48, 
      stat_icon = icon("arrow-down"),
      description = "Since last week", 
      icon = icon("chart-pie"), 
      icon_background = "warning",
      shadow = TRUE
    ),
    argonInfoCard(
      value = "924", 
      title = "SALES", 
      stat = -1.10, 
      stat_icon = icon("arrow-down"),
      description = "Since yesterday", 
      icon = icon("users"), 
      icon_background = "yellow",
      background_color = "default"
    ),
    argonInfoCard(
      value = "49,65%", 
      title = "PERFORMANCE", 
      stat = 12, 
      stat_icon = icon("arrow-up"),
      description = "Since last month", 
      icon = icon("percent"), 
      icon_background = "info",
      gradient = TRUE,
      background_color = "orange",
      hover_lift = TRUE
    )
  ),
  
  # profile cards
  argonH1("User Cards", display = 4),
  argonRow(
    argonColumn(
      width = 3,
      argonUser(
        title = "Ryan Tompson",
        subtitle = "Web Developer",
        src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/team-1-800x800.jpg"
      )
    ),
    argonColumn(
      width = 3,
      argonUser(
        title = "Romina Hadid",
        subtitle = "Marketing Strategist",
        src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/team-2-800x800.jpg"
      )
    ),
    argonColumn(
      width = 3,
      argonUser(
        title = "Alexander Smith",
        subtitle = "UI/UX Designer",
        src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/team-3-800x800.jpg"
      )
    ),
    argonColumn(
      width = 3,
      argonUser(
        title = "John Doe",
        subtitle = "Founder and CEO",
        src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/team-4-800x800.jpg"
      )
    )
  ),
  br(), br(),
  
  argonH1("Profile Card", display = 4),
  argonRow(
    argonColumn(
      width = 12,
      argonProfile(
        title = "John",
        subtitle = "Japan, Kagoshima",
        src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/team-1-800x800.jpg",
        url = "https://www.google.com",
        url_1 = "https://www.google.com",
        url_2 = "https://www.google.com",
        stats = argonProfileStats(
          argonProfileStat(
            value = 22,
            description = "Friends"
          ),
          argonProfileStat(
            value = 10,
            description = "Photos"
          ),
          argonProfileStat(
            value = 89,
            description = "Comments"
          )
        ),
        "An artist of considerable range, Ryan — 
        the name taken by Melbourne-raised, 
        Brooklyn-based Nick Murphy — writes, 
        performs and records all of his own music, 
        giving it a warm, intimate feel with a solid 
        groove structure. An artist of considerable 
        range."
      )
      )
      )
      )
