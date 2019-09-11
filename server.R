## Disseminating Research in the 21st Century
## Mark Hanly
## m.hanly@unsw.edu.au


function(input, output) {
 
  
    ## Presenting results section

    # Interactive graph to view study variables
    output$tabout <- renderggiraph({ 
        
        panela <- tab1 %>% 
            filter(label %in% input$tabvar) %>%
            mutate(cat = factor(cat, levels = unique(cat), ordered=TRUE)) %>%
            mutate(lab = sprintf("<strong>%s</strong><br/>%s%s", cat, pct, "% of study population") %>% lapply(htmltools::HTML)) %>%
            ggplot() +
            geom_bar_interactive(aes(x=cat, y=pct, tooltip=lab, fill=cat) , stat="identity") +
            labs(title="Percentage of study population", y="Percentage", x="" ) +
            theme(axis.text.x = element_text(angle = 30), legend.title = element_blank())

        panelb <- tab1 %>% 
            filter(label %in% input$tabvar) %>%
            mutate(cat = factor(cat, levels = unique(cat), ordered=TRUE)) %>%
            mutate(lab = sprintf("<strong>%s</strong><br/>%s%s", cat, pdelay, "% delayed") %>% lapply(htmltools::HTML)) %>%
            ggplot() +
            geom_bar_interactive(aes(x=cat, y=pdelay, tooltip=lab, fill=cat) , stat="identity") +
            labs(title="Percentage delayed school entry", y="Percentage", x="" ) +
            theme(axis.text.x = element_text(angle = 30), legend.title = element_blank())
        
        tabout <- ggarrange(panela, panelb, ncol=2, nrow=1, common.legend = TRUE, legend="bottom")
        
        girafe(code=plot(tabout))
    })
    
    
      
    
    # Map
    
    # Allow user to quick-zoom 
    zoom <- reactive({
        ifelse(input$zoom=="gsa",7,9)
    })  
    
    output$map <- renderLeaflet({ 
        
        # # Colors for bins
        pal <- colorFactor("YlOrRd", domain = map.dat$category_delay, reverse=TRUE)
        
        # Define hover-over labels
        labels <- sprintf(
            "<strong>%s</strong><br/>%s",
            map.dat$SLA_NAME06.x, map.dat$category_delay
        ) %>% lapply(htmltools::HTML)

        # Base map
        m <- leaflet(map.dat) %>% addTiles() %>% setView(151.160578, -33.912427, zoom()) %>% addTiles() %>%
            addPolygons(
                fillColor = ~pal(category_delay),
                weight = 1,
                opacity = 2,
                color = "#3388ff",
                dashArray = "1",
                fillOpacity = 0.7,
                highlight = highlightOptions(
                    weight = 3,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7, bringToFront = TRUE),
            label = labels,
            labelOptions = labelOptions(
                style = list("font-weight" = "normal", padding = "3px 8px"),
                textsize = "15px",
                direction = "auto")) %>%
            addLegend(pal = pal, values=~category_delay, opacity = 0.7, 
                      title = "% Delayed", position = "bottomright")
        m 
    })    
    
    
    ## Development outcomes plot
    
    output$ontrackplot <- renderggiraph({
        
        ontrackplot <- ontrack %>%
            filter(outcome %in% input$aedc1) %>% 
            mutate(lab = sprintf("<strong>%s</strong><br/>%s%s", agestr, ot, "% on track") %>% lapply(htmltools::HTML)) %>%
            ggplot(aes(age, ot, ymin=ll, ymax=ul)) +
            geom_point_interactive(aes(tooltip = lab, color=str_wrap(outcome)), position = position_dodge(width=.02)) +
            geom_linerange(aes(color=outcome), position = position_dodge(width=.02)) +
            scale_x_continuous(name = "School starting age (years)",
                               limits = c(4.5, 6.0),
                               breaks = seq(4.5,6.0, by=0.25),
                               labels = scales::number_format(accuracy = 0.01)) +
            scale_y_continuous(name = "Development score above the 25th percentile (%)", limits = c(20, 100)) +
            theme(legend.position = "right", legend.title = element_blank()) + 
            labs(title="Development outcomes by school starting age") +
            scale_color_brewer(palette="Dark2")
        
     girafe(code = print(ontrackplot))     
 })

    
    ## Modelling results plot
    
    output$models <- renderggiraph({
        
        modelsplot <- tab3 %>%
            filter(adjustment %in% input$adjust) %>%
            mutate(lab = sprintf("<strong>%s</strong><br/>%s%s", cohort, "Odds ratio:", or) %>% lapply(htmltools::HTML)) %>%
            ggplot(aes(x, or, ymin=ll, ymax=ul)) +
            geom_point_interactive(aes(tooltip = lab, color=adjustment), position = position_dodge(width=.1)) +
            geom_linerange(aes(color=adjustment), position = position_dodge(width=.1)) +
            geom_hline(yintercept=1, linetype="solid", color = "red") +
            scale_x_continuous(name = "School starting age group",
                               limits = c(0.5, 3.5),
                               breaks = seq(1,3, by=1),
                               labels=c("1" = "First eligible \n 4y6m - 5y0m", "2" = "Compulsory \n 5y1m - 5y5m", "3" = "Delayed entry \n 5y6m - 6y0m")) +
            scale_y_continuous(name = "Odds ratio", limits = c(0.9, 1.3)) + 
            labs(title="Odds Ratio estimates for AEDC scores above the \n 25th percentile on all five development domains \n associated with a one month increase in school starting age") +
            theme(legend.position = "right", legend.title = element_blank()) +
            scale_color_brewer(palette="Dark2")

        girafe(code = print(modelsplot))
    })
 
    
# Reproducible example via shinymeta
 
    # Choose a series based on selected table       
    output$wpiseries <- renderUI({
        seriesopt <- wpi %>%
            filter(table_title == input$wpitab) %>% 
            distinct(series)
        
        choice <- seriesopt[10,1]
        
        selectInput("wpiseries", width='100%',
                    label = "Choose a series to summarise:",
                    choices = seriesopt, 
                    selected = choice)
        
    })
    
    # choose a date range based on selected series
    output$wpidate <- renderUI({
        
        # Requiring wpiseries here avoids a brief but ugly error message while the app loads
        req(input$wpiseries)
        
        # Gets the available dates
        dateopt <- wpi %>%
        filter(table_title == input$wpitab) %>% 
        filter(series == input$wpiseries) %>% 
            distinct(date2)
        
        # Define the slider input based on the available dates
        sliderInput("daterange", width='100%',
                    label = "Specify a date range:",
                    min =  min(dateopt$date2), 
                    max =  max(dateopt$date2),
                    value= c(min(dateopt$date2),max(dateopt$date2)) ,
                    dragRange = TRUE,
                    timeFormat = "%b %Y"
                  )

    })

    
    # Code to install packages (not run in the app but passed to user later via the expandChain() function to provide a reproducible workflow)
    libs_code <- quote({
        
        # List of required packages
        list.of.packages <- c("dplyr", "ggplot2", "ggiraph", "shinymeta", "shinyAce", "clipr", "stringr", "zoo", "readabs")
        
        # Install any missing packages and load all
        new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
        if(length(new.packages) > 0) {install.packages(new.packages)}
        lapply(list.of.packages, require, character.only=T)
    })
    
    
    # Load timeseries data from ABS using the read_abs() function from the readabs package
    # (not run in the app but passed to user later via the expandChain() function to provide a reproducible workflow)
    data_code <- quote({
        
        wpi <- read_abs("6345.0") %>%
            mutate(date2 = as.Date(unlist(date), origin = "1970-01-01"))

    })
    
    # Render the graph
    output$d1 <- metaRender(renderggiraph, {
        
        # Requiring wpiseries and daterange here avoids a brief but ugly error message when app is loaded
        req(input$wpiseries)
        req(input$daterange)
        
        # Note that values wrapped in ..( ) are substituted for their actual value when the reproducible code is presented
        range <- ..(input$daterange) %>% as.character() %>% strsplit(" ") 
        min <- range[[1]] %>% unlist() %>% as.Date()
        max <- range[[2]] %>% unlist() %>% as.Date()
        text <- ..(input$wpiseries) %>% str_replace("Australia ;", "") %>% strsplit(";")
        title <- text[[1]][2] %>% str_trim(side="both")
        ytitle <- text[[1]][1] %>% str_trim(side="both")
        subtitle <- ..(input$wpiseries) %>% str_replace(title, "") %>% str_replace(ytitle, "") %>% str_replace_all(";", "") %>% str_trim(side="both")
        
       wpiplot <- wpi %>%
           filter(table_title == ..(input$wpitab)) %>%
           filter(series == ..(input$wpiseries)) %>%
           filter(between(date2,min,max)) %>%
           mutate(lab = sprintf("<strong>%s</strong><br/>%s", zoo::as.yearqtr(date2), value) %>% lapply(htmltools::HTML)) %>%
           ggplot(aes(date2, value)) +
            geom_line(color="grey") +
            geom_point_interactive(aes(tooltip=lab), color="purple") + 
            labs(x="Date", y=ytitle, title = title, subtitle = subtitle ) 
       
       girafe(code = print(wpiplot))
    })
    

    
    # Display the code when button is clicked
    observeEvent(input$d1_output_code, {
      withProgress(message = 'Generating code', value = 0, detail="This just takes a moment", {
        # run calculation
        code <- expandChain(libs_code, data_code, output$d1())
        displayCodeModal(code, clip = NULL, easyClose=TRUE, fade=FALSE, theme="pastel_on_dark", size="l",
                         title = "This R code reads data from the ABS website to reproduce the graph you have specified.")
        Sys.sleep(0.5)
      })
    })

    
    # Interactive tutorial via learnr
    # Tutorial is already published to the cloud and is embedded here as an iframe
     output$frame <- renderUI({
        tags$iframe(
            src="https://mark-hanly.shinyapps.io/modelling-common-outcomes/",
            width=800, height=600
        )
    })
    
 
# survey section   
    
    # Download the participant information sheet
    output$downloadInfo <- downloadHandler(
        filename = "participant-info.pdf",
        content = function(file) {
            file.copy("www/participant-information.pdf", file)
        }
)
    

    
} # Closes function brackets