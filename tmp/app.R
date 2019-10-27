library(shiny)
library(argonR)
library(argonDash)
library(magrittr)


# App
shiny::shinyApp(
  ui = argonDashPage(
    title = "Sia", description = "Artificial Intelligence for the  industry.", author = NULL,
    sidebar = argonDashSidebar(
      vertical = TRUE,
      skin = "light",
      background = "white",
      size = "lg",
      side = "left",
      id = "my_sidebar",
      brand_url = "http://www.google.com",
      brand_logo = "https://demos.creative-tim.com/argon-design-system/assets/img/brand/blue.png",
      dropdownMenus = argonDropNav(
        title = "Dropdown Menu", 
        src = "https://demos.creative-tim.com/argon-dashboard/assets/img/theme/team-4-800x800.jpg", 
        orientation = "right",
        argonDropNavTitle(title = "Welcome!"),
        argonDropNavItem(
          title = "Item 1", 
          src = "https://www.google.com", 
          icon = "single-02"
        ),
        argonDropNavItem(
          title = "Item 2", 
          src = NULL, 
          icon = "settings-gear-65"
        ),
        argonDropNavDivider(),
        argonDropNavItem(
          title = "Item 3", 
          src = "#", 
          icon = "calendar-grid-58"
        )
      ),
      argonSidebarHeader(title = "Main Menu"),
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
      ),
      argonSidebarDivider(),
      argonSidebarHeader(title = "Other Items")
    ),
    navbar = argonDashNavbar(
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
        # argonDropNavItem(
        #   title = "Item 2", 
        #   src = NULL, 
        #   icon = "settings-gear-65"
        # ),
        # argonDropNavDivider(),
        # argonDropNavItem(
        #   title = "Item 3", 
        #   src = "#", 
        #   icon = "calendar-grid-58"
        # )
      )
    ), 
    header = argonDashHeader(
      gradient = TRUE,
      color = "primary",
      separator = TRUE,
      separator_color = "secondary",
      argonCard(
        title = "Argon Card",
        src = "http://www.google.com",
        hover_lift = TRUE,
        shadow = TRUE,
        shadow_size = NULL,
        hover_shadow = FALSE,
        border_level = 0,
        icon = "atom",
        status = "primary",
        background_color = NULL,
        gradient = FALSE, 
        floating = FALSE,
        "This is the content"
      )
    ),
    body = argonDashBody(
      argonTabItems(
        argonTabItem(
          tabName = "cards",
          argonRow(
            argonCard(
              width = 12,
              src = NULL,
              icon = "ui-04",
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
              icon = "atom",
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
          )
        ),
        argonTabItem(
          tabName = "tabs",
          argonRow(
            argonTabSet(
              id = "tab-1",
              card_wrapper = TRUE,
              horizontal = TRUE,
              circle = FALSE,
              size = "sm",
              width = 6,
              iconList = list("atom", "atom", "atom"),
              argonTab(
                tabName = "Tab 1",
                active = FALSE,
                tabText1
              ),
              argonTab(
                tabName = "Tab 2",
                active = TRUE,
                tabText2
              ),
              argonTab(
                tabName = "Tab 3",
                active = FALSE,
                tabText3
              )
            ),
            argonTabSet(
              id = "tab-2",
              card_wrapper = TRUE,
              horizontal = FALSE,
              circle = TRUE,
              size = "sm",
              argonTab(
                tabName = "Tab 4",
                active = FALSE,
                tabText1
              ),
              argonTab(
                tabName = "Tab 5",
                active = TRUE,
                tabText2
              ),
              argonTab(
                tabName = "Tab 6",
                active = FALSE,
                tabText3
              )
            )
          )
        ),
        argonTabItem(
          tabName = "alerts",
          argonRow(
            argonColumn(
              width = 4,
              argonAlert(
                icon = "basket",
                status = "danger",
                "This is an alert",
                closable = TRUE
              )
            ),
            argonColumn(
              width = 4,
              argonAlert(
                icon = "ui-02",
                status = "success",
                "This is an alert",
                closable = TRUE
              )
            ),
            argonColumn(
              width = 4,
              argonAlert(
                icon = "ui-03",
                status = "info",
                "This is an alert",
                closable = TRUE
              )
            )
          )
        )
      )
    ),
    footer = argonDashFooter(
      copyrights = "@Divad Nojnarg, 2018",
      src = "https://github.com/DivadNojnarg",
      argonFooterMenu(
        argonFooterItem("RinteRface", src = "https://github.com/RinteRface"),
        argonFooterItem("argon", src = "https://demos.creative-tim.com/argon-design-system/index.html")
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    
    output$plot <- renderPlot({
      dist <- switch(input$dist,
                     norm = rnorm,
                     unif = runif,
                     lnorm = rlnorm,
                     exp = rexp,
                     rnorm)
      
      hist(dist(500))
    })
  }
)
