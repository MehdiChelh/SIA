# Module UI
  
#' @title   mod_score_ui and mod_score_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_score
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
#' @importFrom plotly plotlyOutput renderPlotly plot_ly layout
mod_score_ui <- function(id){
  ns <- NS(id)
  
  df <- readRDS(system.file("app/data/df_score_jour-2018_2019", package = "sia"))
  
  argonTabItem(
    tabName = "score",
    argonRow(
      argonCard(
        width = 12,
        src = NULL,
        icon = "chart-bar-32",
        status = "success",
        shadow = TRUE,
        border_level = 2,
        hover_shadow = TRUE,
        title = "Analyses",
        argonRow(
          argonColumn(
            width = 12,
            sliderInput(
              ns("obs"), 
              "Plage de données",
              min = 1, 
              max = nrow(df), 
              step = 1,
              value = c(1, nrow(df)),
              width = "100%"
            ),
            plotlyOutput(ns("pdm_trend")),
            br(),
            hr(),
            br(),
            plotlyOutput(ns("pdm_seasonal")),
            br(),
            hr(),
            br(),
            plotlyOutput(ns("pdm"))
          )
        )
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_score
#' @export
#' @keywords internal
    
mod_score_server <- function(input, output, session){
  ns <- session$ns
  
  # Define MVC Framework
  local <- reactiveValues()
  
  # Get data
  df_merged <- readRDS(system.file("app/data/df_score_jour-2018_2019", package = "sia"))
  
  MIN <- min(df_merged$pdm, na.rm = T)
  MAX <- max(df_merged$pdm, na.rm = T)
  
  col_names <- colnames(df_merged)
  
  # récupération des arches
  df_arches <- df_merged[, (which(col_names == "evenements") + 1):length(col_names)]
  col_names <- colnames(df_arches)
  
  # récupération des colonnes pour chaque arches
  arch_names <- list()
  arch_names[[1]] <- col_names[which(unlist(lapply(strsplit(colnames(df_arches), " - "), function(el){el[1] == "a"})))]
  arch_names[[2]] <- col_names[which(unlist(lapply(strsplit(colnames(df_arches), " - "), function(el){el[1] == "b"})))]
  arch_names[[3]] <- col_names[which(unlist(lapply(strsplit(colnames(df_arches), " - "), function(el){el[1] == "c"})))]
  arch_names[[4]] <- col_names[which(unlist(lapply(strsplit(colnames(df_arches), " - "), function(el){el[1] == "d"})))]
  
  # définition de l'échelle de couleurs
  my_colors <- rev(c("#fde725", "#b5da3f", "#6fcd59", "#40b775", "#219e88", "#29828d", "#33678c", "#3f4987", "#472976", "#440154"))
  
  
  # Reactive Locals
  observe({
    local[["df_and_shapes"]] <- {
      req(input$obs)
      range_ <- input$obs[1]:input$obs[2]
      
      df <- df_merged[range_, ]
      
      count <- 0
      shapes <- unlist(lapply(1:4, function(i){
        lapply(arch_names[[i]], function(j){
          
          count <<- count + 1 
          arch_activation_period <- df[which(df[, j] == 1), "date"]
          if (length(arch_activation_period) > 0){
            c(min(arch_activation_period), max(arch_activation_period), my_colors[count %% length(my_colors) + 1])
            shape_color <- my_colors[count %% length(my_colors) + 1]
            list(type = "rect", text="okok",
                 fillcolor = shape_color, line = list(color = shape_color), opacity = 0.3,
                 x0 = min(arch_activation_period), x1 = max(arch_activation_period), xref = "x",
                 y0 = (4-i)/4 * (MAX - MIN) + MIN, y1 = (4-i+1)/4 * (MAX - MIN) + MIN, yref = "y")
            
          } else {
            NULL
          }
        })
      }), recursive = F)
      list("shapes" = shapes,
           "df" = df)
    }
  })
  
  
  
  # /////////////////
  #   Plots
  # /////////////////
  
  # -- Simple PDM
  output[["pdm"]] <- renderPlotly({
    req(local[["df_and_shapes"]])
    
    l <- local[["df_and_shapes"]]
    
    # l$df$date_2 <- unlist(lapply(strsplit(l$df$date, "-"), function(el){paste(el[2], el[3], sep = "-")}))
    
    l$df$date <- as.Date(l$df$date)
    
    plot_ly(l$df, x = ~date, y = ~pdm, type = "scatter", mode = "lines") %>%
      layout(
        title = "PDM (données brutes)",
        xaxis = list(title="Date"),
        yaxis = list(title="PDM"),
        shapes = l$shapes
      )
  })
  
  # -- Tendance de la PDM
  output[["pdm_trend"]] <- renderPlotly({
    req(local[["df_and_shapes"]])
    
    l <- local[["df_and_shapes"]]
    
    l$df$date <- as.Date(l$df$date)
    
    plot_ly(l$df, x = ~date, y = ~pdm_trend, type = "scatter", mode = "lines") %>%
      layout(
        title = "Tendance de la PDM & Arche",
        xaxis = list(title="Date"),
        yaxis = list(title="PDM"),
        shapes = l$shapes
      )
  })
  
  
  # -- Composante saisonnière jounalière
  output[["pdm_seasonal"]] <- renderPlotly({
    df <- df_merged
    
    df$wk <- as.factor(weekdays(as.Date(df_merged$date)))
    
    first <- which(df$wk == "Monday")[1]
    last <- first + 4
    df <- df[first:last, ]
    
    plot_ly(df, x = ~wk, y = ~pdm_seasonal, type = "scatter", mode = "lines+markers") %>%
      layout(
        title = "Variation journalière de la PDM par rapport à la moyenne mensuelle",
        xaxis = list(title="Date", categoryorder = "array", categoryarray = df$wk),
        yaxis = list(title="PDM")
      )
  })
}
    
## To be copied in the UI
# mod_score_ui("score_ui_1")
    
## To be copied in the server
# callModule(mod_score_server, "score_ui_1")
 
