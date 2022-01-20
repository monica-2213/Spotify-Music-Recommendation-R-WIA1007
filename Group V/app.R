library(shiny)
library(ggplot2)
library(bslib)
library(showtext)
library(thematic)
library(dplyr)
library(shinyjs)
library(rsconnect)


song <- read.csv(file = "top10s.csv")
music <- data.frame(song)

my_theme <- bs_theme(bg = "#ffffff",
                     fg = "#000000",
                     base_font = font_google("Josefin Sans")
                     )

# Let thematic know to update the fonts, too
thematic_shiny(font = "auto")

ui <- navbarPage(
  title = "SPOTIFY MUSIC RECOMMENDATION",
  theme = my_theme,
  
  main_page <- tabPanel(
    title = "Recommendation",
    
    sidebarLayout(
      sidebarPanel(
        width = 3,
        h4("Create your own unique playlist with just two simple steps :)", style = "color:#008c00; font-size:16px"),
        
        selectInput(inputId = "genre", label = ("SELECT YOUR FAVOURITE MUSIC GENRE"),
                    choices = unique(music$GENRE),
        ),
        
        selectInput(inputId = "artist", label = ("SELECT YOUR FAVOURITE ARTIST"),
                    choices = NULL),
      ),
      
      mainPanel(
        h1("SONGS YOU MAY LIKE: ", align="center", style = "color:#008c00"),
        br(),
        column(12, align = "center", tableOutput("table")),
        br(),
        column(12, align = "center", plotOutput("plot", width = "100%", height = "400px")),
        br(),
        p("Source: ", a("Spotify Top songs 2010-2019",
                        href = "https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year"), ".",
          style="font-size: 12px; font-style:italic"),
        br()
      )
    )
  ),
  
  about_page <- tabPanel(
    title = "User Manual",
    align = "center",
    
    mainPanel(
      h4("USER MANUAL", style = "color:#008c00"),
      h1("Learn how to use the app"),
      br(),
      br(),
      p("Step 1: Choose your favourite music genre from the dropdown list. There are 50 genres altogether."),
      imageOutput("image2"),
      br(),
      p("Step 2: Once you have selected your favourite genre, the app then shortlists the artists and you can choose your favourite artist."),
      imageOutput("image3"),
      br(),
      p("Step 3: The app then displays a table of the top songs of the artist from the year 2010 to 2019."),
      imageOutput("image4"),
      br(),
      p("Step 4: You may also view the graph of popularity of each song of your favourite artist."),
      imageOutput("image5"),
      br()
    )
  )
  
)

server <- function(input, output) {
  theme = my_theme
  
  genre <- reactive({
    filter(music, GENRE == input$genre)
  })
  
  observeEvent(genre(), {
    choices <- unique(genre()$ARTIST)
    updateSelectInput(inputId = "artist", choices = choices)
  })
  
  tab <- reactive({ 
    music %>%
      select(TITLE, ARTIST, GENRE, YEAR)%>%
      filter(GENRE == input$genre, ARTIST == input$artist)
  })
  
  output$table <- renderTable({
    tab()
  })
  
  d <- reactive({
    filtered <-
      music %>%
      filter(ARTIST == input$artist)
  })
  
  output$plot <- renderPlot({
    ggplot(d(), aes(x=TITLE, y=POPULARITY, label=POPULARITY)) + 
      geom_bar(stat='identity', width=.7, fill = "#1DB954", color = "black")  +
      labs(subtitle="Popularity of Each Track of Your Favourite Artist", 
           title= "Track vs Popularity") + 
    coord_flip()
  })
  
  
  #ABOUT_PAGE
  output$image2 <- renderImage({
    list(src = "image2.jpg",
         width = 300,
         height = 300,
         alt = "This is alternate text")
  }, deleteFile = FALSE)
  
  output$image3 <- renderImage({
    list(src = "image3.jpg",
         width = 300,
         height = 300,
         alt = "This is alternate text")
  }, deleteFile = FALSE)
  
  output$image4 <- renderImage({
    list(src = "image4.jpg",
         width = 300,
         height = 300,
         alt = "This is alternate text")
  }, deleteFile = FALSE)
  
  output$image5 <- renderImage({
    list(src = "image5.jpg",
         width = 700,
         height = 300,
         alt = "This is alternate text")
  }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
