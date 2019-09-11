## Disseminating Research in the 21st Century
## Mark Hanly
## m.hanly@unsw.edu.au


## Define the header
# Icons can be chosen from https://fontawesome.com/icons?d=gallery

header <- dashboardHeader(title = "Disseminating Research in the 21st Century", titleWidth = 400,
                          tags$li(class="dropdown",
                                  tags$a(href='https://github.com/CBDRH/interactive-apps-demo',
                                  icon('github'), "Source Code", target="_blank")),
                          tags$li(class="dropdown",
                                  tags$a(href='http://cbdrh.med.unsw.edu.au',
                                  tags$img(src='logo2.png', height=19), target="_blank"))
) 


## Define sidebar menu
# Icons can be chosen from https://fontawesome.com/icons?d=gallery

sidebar <- dashboardSidebar(
    width=250,
    sidebarMenu(
        menuItem("Home", icon = icon("home"), tabName = "home"),
        br(),
        menuItem("1. Presenting results", icon = icon("chart-bar"), tabName = "uc1"),
        menuItem("2. Reproducible research", icon = icon("sync-alt"), tabName = "uc2"),
        menuItem("3. Interactive tutorials", icon = icon("graduation-cap"), tabName = "uc3"),
        br(),
        menuItem("Survey", icon = icon("edit"), tabName = "survey"),
        menuItem("Study information", icon = icon("info-circle"), tabName = "info")
    )   
)

## Define the Body
body <-  dashboardBody(
    
    tabItems(
        
        tabItem(tabName='home',
                fluidPage(
                    
                    headerPanel(
                        h3("Disseminating Research in the 21st Century")
                        ),
                    
                    mainPanel(
                        
                        p("Welcome!"),
                        
                        # Nesting the paragraph in a HTML tab allows you to also embed words with bold font using <strong> </strong>
                        p(HTML("Are you interested in using interactive platforms such as <strong>Jupyter Notebooks</strong> 
                        or R Studio products like <strong>rmarkdown</strong>, <strong>shiny</strong> and <strong>learnr</strong> to help communicate your research?
                          This app contains some examples of how that can be done and a survey to find out more 
                          about how researchers are currently using these tools.")),
                        p("Read through the boxes below to find out more about our research project, then navigate 
                          through the panel on the left to see some interctive platforms in action. 
                          When you're done please follow the link to take the survey!"),
                        hr(),
                        
                        # Insert an accordian style menu using the bsplus package
                        bs_accordion(id = "welcomeinfo") %>%
                            bs_set_opts(panel_type = "info", use_heading_link = TRUE) %>%
                            bs_append(title = "What is this research all about?",
                                      # Have to embed content within shiny::HTML to render properly in content of accordian list
                                      content = shiny::HTML("We have been funded by the Australian Research Data Commons (ARDC)
                                                to explore how the Australian research community can be better supported to utilise 
                                                interactive analytics platforms like Jupter Notebooks and R Studio. The purpose of this app is to: 
                                                 <ul>
                                                 <li>Demonstrate potential applications of interactive analytics platforms like Jupyter Notebooks, R Shiny and similar tools </li>
                                                 <li>Better understand current usage of these platforms in the research community</li>
                                                 <li>Find out how researchers can be supported to use these platforms</li>
                                                 <li>Identify any barriers to using these platforms</li>
                                                 </ul>")) %>%
                            bs_append(title = "What is an interactive analytics platform?",
                                      content = shiny::HTML("An interactive analytics platform is an application that supports 
                                                            non-static research outputs.  
                                                            <br> <br> Popular examples include:
                                                            <br> <br>
                                                             <ol>
                                                             <a href='https://shiny.rstudio.com/'>
                                                              <img src='rstudio.jpeg' width='25'/>
                                                              RMarkdown/knitr and R Shiny from R Studio
                                                            </a> 
                                                            </ol>
                                                            <ol>
                                                            <a href='https://jupyter.org/'>
                                                              <img src='jupyter.png' width='25'/>
                                                              Jupyter Notebooks from the Jupyter community
                                                            </a>
                                                             </ol>
                                                            These platforms allow researchers to weave together narrative text, 
                                                            code and the output of that code. They can help to make research results 
                                                            more <strong>open</strong> and <strong>accessible</strong>, and they can promote 
                                                            <strong>research reproducibility</strong> by allowing
                                                            other researchers to access and run code.")) %>%
                            bs_append(title = "Who is conducting this study?",
                                      content = shiny::HTML("This study is being carried out by:
                                                            </p>
                                                            <li>
                                                              <a href='https://cbdrh.med.unsw.edu.au/people/mr-mark-hanly'>Dr Mark Hanly, UNSW Sydney</a>
                                                            </li>
                                                            <li>
                                                              <a href='https://inghaminstitute.org.au/people/tim-churches/'>Dr Tim Churches, Ingham Institute</a>
                                                            </li>
                                                            </p> 
                                                            This study has been funded by:
                                                            </p>
                                                            <li>
                                                              <a href='https://ardc.edu.au/'>The Australian Research Data Commons (ARDC)</a>
                                                            </li>    
                                                            ")) %>%
                            bs_append(title = "What do I need to do?",
                                      content = shiny::HTML("We would like to gather information from the Australian Research Community about 
                                                  current uses of interactive data platforms, as well as planned future use and any
                                                  training needs or barriers to use.
                                                    </p>
                                                    This app illustrates three potential use-cases for interactive analytics platforms:
                                                    </p>
                                                    <ol>
                                                    <li>Supplementing traditional research outputs with engaging and responsive visualisations</li>
                                                    <li>Promoting reproducible research</li>
                                                    <li>Interactive environments for teaching and learning</li>
                                                    </ol>
                                                    </p>
                                                    If you are unfamiliar with interactive data platforms, you can review these three use-cases to get an idea
                                                    of how researchers might use them to disseminate their research and support open and reproducible science.
                                                    When you are ready, answer the short questionnaire on your current and potential future uses of interactive platforms.
                                                    
                                                    <p></p>
                                                    <br/>
                                                    <strong>In brief:</strong>
                                                    <ul>
                                                    <p>
                                                    <i class='fa fa-chart-bar'></i>
                                                    Use the panel on the left to navigate through the three use-case examples
                                                    </p>
                                                    <p>
                                                    <i class='fa fa-edit'></i>
                                                    Complete the survey
                                                    </p>
                                                    </ul>
                                                     "))

                    ) # Closes main panel
                    
                )), # Closes Tab item, fluid page

        
        
        ## Section on presenting research findings                
        tabItem(tabName='uc1',
                
                sidebarLayout(fluid=TRUE, 
                    sidebarPanel(width=3,
                        h1("Presenting results"),
                        h3("Overview"),
                        helpText("Interactive analytics platforms can be used to supplement traditional research outputs by providing
                                 environments where readers can engage interactively with results and even reproduce and 
                                 interrogate findings. Interactive elements can include figures, tables, maps - anything
                                 you could include in a research paper!"),
                        tags$br(),
                        helpText("This use-case is demonstrated using a recent paper focusing on school starting age
                                 and early childhood development in New South Wales."),
                        tags$br(),
                        helpText("Navigate through the tabs on the top right to see how traditional research outputs can be
                                 brought to life in an interactive environment.")
                    ),
                    
                    mainPanel( 
                        
                        tabsetPanel(
                    
                            ## The paper         
                            tabPanel("The paper",
                            
                            h4("School starting age and child development in a state-wide, 
                                                     population-level cohort of children in their first year of 
                                                     school in New South Wales, Australia"),
                            tags$em("Mark Hanly, Ben Edwards, Sharon Goldfeld, Rhonda G. Craven, Janet Mooney, Louisa Jorm, Kathleen Falster"),
                            tags$br(),
                            tags$em("Early Childhood Research Quarterly 48 (2019) 325–340"),
                            
                            br(), hr(),
                            h4("Non-technical summary"),
                            h5("Every year, thousands of Australian families with four-year-old children face a difficult decision: 
                                to enrol their child in school or delay for another year. Delayed entry typically incurs a cost, 
                                such as childcare fees or lost wages. For this reason, not all families may be in the same position 
                                to make the decision to delay, even if they wanted to."),
                            h5("Research shows New South Wales tops the charts when it comes to delaying school entry. Our paper, 
                            published in Early Childhood Research Quarterly, found one-quarter of children in NSW delayed school 
                            entry in 2009 and 2012, with geographic and social variation in the tendency to delay."),
                            h5("We also confirmed what many parents and teachers believe: older children are more likely to have the 
                               developmental skills in place to hit the ground running in the first year of school."),
                            
                            hr(),
                            h4("Links"),
                            tags$ul( 
                            p(tags$a(href="https://www.sciencedirect.com/science/article/pii/S0885200619300110/pdfft?md5=eddf4136bfbb413760338ccd45889e3b&pid=1-s2.0-S0885200619300110-main.pdf",
                                   icon("file-pdf"), target="_blank",
                                   "The original article published in Early Childhood Research Quarterly")),
                            p(tags$a(href="http://theconversation.com/which-families-delay-sending-their-child-to-school-and-why-we-crunched-the-numbers-111826",
                                   icon("comment"), target="_blank",
                                   "Companion piece in The Conversation")),
                            p(tags$a(href="https://www.smh.com.au/education/a-gift-of-time-children-who-start-school-later-fare-better-study-finds-20190408-p51bw1.html",
                                   icon("newspaper"), target="_blank",
                                   "Coverage in the Sydney Morning Herald"))
                            )
                            ),
                            
                            ## Describing the population
                            tabPanel("Population", 
                                     h4("Study population characteristics and the proportion of delayed entrants"),
                                     
                                     helpText("Select a variable below to plot the distribution in the study population and the proportion 
                                              of each category that delayed school entry."),
                                     
                                     tags$blockquote(tags$em('"This study used multiple cross-sectoral administrative datasets from the
                                                             Seeding Success data resource with information on individual children combined 
                                                             using probabilistic data linkage... Of the 104,356 children in the study 
                                                             population, 24.7% delayed the start of school."')),
                                box(background="light-blue"  ,       
                                      selectInput("tabvar",
                                                 label = "Choose a variable to summarise",
                                                 choices = tab1$label,
                                                 selected= "Month of Birth")
                                ),
                                     withLoader(ggiraphOutput("tabout"), type="html", loader="loader5") # Output the graphic defined in server.R
                                
                            ), # Close the population tabPanel
                            
                            
                            # Mapping delayed school entry
                            tabPanel("Map",
                                     
                                     h4("Percentage of children delaying the start of school by area."),
                                     
                                     helpText("Use the map below to explore the geographic variation
                                              in delayed school entry by Statistical Local Area.
                                              Mouse over an area to see the name and percentage
                                              children who delayed school entry"),
                                     
                                     tags$blockquote(tags$em('"Within Sydney there was evidence of geographic clustering, 
                                                             with the lowest rates of delay (0–15%) in the Western suburbs"')),
                                       box(background="light-blue",    
                                       radioButtons(inputId="zoom",
                                                 label="Quick zoom",
                                                 choices = list(
                                                     "Sydney and surrounding areas" = "gsa",
                                                     "Sydney Metropolitan area" = "sma"
                                                 )
                                            )         
                                        ),
                                     
                                     withLoader(leafletOutput(outputId = "map"), type = "html", loader="loader5") # Output the map defined in server.R

                                ), # Close the Map tabPanel
                            
                            
                            ## Plotting development outcomes by school starting age
                            tabPanel("Developmentent outcomes",
                                     
                                     h4("The proportion of children with AEDC domain scores above the 25th percentile 
                                        and the total proportion of children by school starting age."),
                                     
                                     helpText("Use the interface below to explore AEDC development by month of school starting age"),
                                     
                                     tags$blockquote(tags$em('"The crude relationship between school starting age and 
                                                             early childhood development was broadly consistent across 
                                                             all development domains. The increase in the proportion 
                                                             of children with development scores above the 25th percentile 
                                                             was approximately linear with school starting age between four 
                                                             years six months and five years eight months, with a slight 
                                                             levelling off, or decline between five years nine months and six years."')),
                                     
                                         checkboxGroupInput("aedc1", label = "Choose an outcome variable:", 
                                                            choices = unique(ontrack$outcome),
                                                            selected = "Physical health and wellbeing"),
                                     
                                     withLoader(ggiraphOutput("ontrackplot"), type="html", loader="loader5") # Output the figure defined in server.R
       
                                ), # Close the outcomes tabPanel
                            
                            ## Plotting modelling results
                            tabPanel("Modelling", h3("Modelling"),
                                     
                                     h4("Study population characteristics, and the proportion of delayed entrants"),
                                     
                                     helpText("The association between school starting age and development was modelled separately for 
                                              three distinct groups of children: those born January to July who started when they were 
                                              first eligible, those born August to December who had no choice about when to start, and 
                                              those born January to July who delayed school enrolment. To account for potential selection 
                                              in the 'First eligible' and 'Delayed entry' groups we estimated multiple models, 
                                              which controlled for confounding by incorporating fixed effects and/or child, family and 
                                              area-level controls"),
                                     
                                     tags$blockquote(tags$em('"Combined, these results confirm that older children are more developed than
                                                             younger children in the first year in school, on average. This association
                                                             between age and development is not driven solely by differences between the
                                                             types of children who do and do not delay school, as it is clearly observed
                                                             among children who had no choice when to start school, suggesting a causal
                                                             effect of school starting age."')),
                                     checkboxGroupInput("adjust",
                                                 label = "Select which statistical controls to apply:",
                                                 choices = unique(tab3$adjustment),
                                                 selected= c("Unadjusted", "RE + all controls")),

                                     withLoader(ggiraphOutput("models"), type="html", loader="loader5") # Output the figure defined in server.R
                                     
                            ), # Close the modelling tabPanel
                            
                            tabPanel("Resources",
                                     h3("Resources"),
                                     
                                     p("Below you will find links to the the original research paper, published in Early Childhood Research Quarterly, as
                                       well as additional links to other relevant material."),
                                     tags$ul(
                                     p(tags$a(href="https://www.sciencedirect.com/science/article/pii/S0885200619300110/pdfft?md5=eddf4136bfbb413760338ccd45889e3b&pid=1-s2.0-S0885200619300110-main.pdf",
                                            icon("link"), target="_blank",
                                            "The original article published in Early Childhood Research Quarterly")),
                                     p(tags$a(href="http://theconversation.com/which-families-delay-sending-their-child-to-school-and-why-we-crunched-the-numbers-111826",
                                            icon("link"), target="_blank",
                                            "Companion piece in The Conversation")),
                                     p(tags$a(href="https://www.smh.com.au/education/a-gift-of-time-children-who-start-school-later-fare-better-study-finds-20190408-p51bw1.html",
                                            icon("link"), target="_blank",
                                            "Coverage in the Sydney Morning Herald")),
                                     p(tags$a(href="https://www.aedc.gov.au/Websilk/Handlers/ResourceDocument.ashx?id=9ed12764-db9a-6d2b-9fad-ff0000a141dd",
                                            icon("link"), target="_blank",
                                            "About the AEDC development domains")),
                                     p(tags$a(href="https://education.nsw.gov.au/public-schools/going-to-a-public-school/primary-schools/starting-school",
                                            icon("link"), target="_blank",
                                            "The NSW Department of Education information about school starting age")),
                                     p(tags$a(href="http://dx.doi.org/10.1136/bmjopen-2015-007898",
                                            icon("link"), target="_blank",
                                            "The Seeding Success Study Protocol (BMJ Open 2015)")),
                                     p(tags$a(href="https://doi.org/10.1093/ije/dyx051",
                                            icon("link"), target="_blank",
                                            "The Seeding Success Data Resource Paper (IJE 2017)"))
                                     ) # Close the list
                                     
                             ) # Close the resources tabPanel
                            
                        ) # close the tabsetPanel
                        
                        
                    ) # Close the mainPanel for the Presenting Results section
                
                )),


## Section on reproducible research        
tabItem(tabName='uc2',
        
        sidebarLayout(fluid=TRUE, 
                      sidebarPanel(width=3,
                           h1("Reproducible research"),
                           h3("Overview"),
                           helpText("Scientific research should be verifiable and reproducible. At a minimum, this means that
                                    given the raw data and program code it should be straightforward for other researchers to reproduce results 
                                    published in papers and reports. 
                                    That sounds like it should be easy, but often it's not!"),
                           tags$br(),
                           helpText("Interactive analytic platforms such as Jupyter Notebooks and the R packages RMarkdown/knitr
                                    and Shiny can offer many ways to interweave programming code and results that promote reproducible research."),
                           tags$br(),
                           helpText("In this demonstration Shiny app, users can analyse ABS time series data on Wage Price Indices 
                                    using a point-and-click interface. Selecting the 'Show Code' button provides the underlying 
                                    R code to fully reproduce the graph from the data provided by the ABS.
                                    Try exploring some of the availble tables and times series. When you are ready, click on 
                                    'Show Code' to access the R code. Running this code in a standalone R environment would 
                                    download the relevant ABS data and reproduce the graph.")
                      ),
                      
                      mainPanel(
                          
                          # Use css to change look of progress bar
                          tags$head(
                              tags$style(
                                  HTML(".shiny-notification {
                                          height: 100px;
                                          width: 300px;
                                          position:fixed;
                                          top: calc(50% - 50px);;
                                          left: calc(50% - 400px);;
                                        }
                                       "
                                  )
                              )),

                          h3("Exploring Wage Price Index data from the ABS"),
                          
                              selectInput("wpitab", width='100%',
                                          label = "Choose a table to explore:",
                                          choices = unique(wpi$table_title),
                                          selected= "Table1. Total Hourly Rates of Pay Excluding Bonuses: Sector, Original, Seasonally Adjusted and Trend"),
                              
                            uiOutput("wpiseries"),
                            uiOutput("wpidate"),
                            outputCodeButton(withLoader(ggiraphOutput("d1"), type="html", loader="loader5"))
                      )
                      
        )), # Closes Tab item, fluid page

## Interactive tutorial section
        tabItem(tabName='uc3',
                
        sidebarLayout(fluid=TRUE, 
             sidebarPanel(width=3,
                h1("Interactive Tutorials"),
                
                h3("Overview"),
                
                helpText("Interactive analysis platforms can be used to enhance teaching of data science and statistics. 
                Technologies such as Jupyter Notebooks and R learnr provide environments which integrate theoretical material with
                         live programming exercises. Interactive quizes can be included to reinforce learning."),
                tags$br(),
                helpText("The example here shows a short introductory-level statistics tutorial on odds ratios and risk
                         ratios implemented using the RStudio learnr package. Navigate through the tutorial to see 
                         examples of interactive programming exercises and quizzes.")
            ), # Close Side bar panel
                
                mainPanel(
                    htmlOutput("frame") # Embed tutorial 
                )
                
        )), # Closes Tab item, fluid page
        
 
## Survey section
       tabItem(tabName='survey',
                sidebarLayout(fluid=TRUE, 
                              sidebarPanel(width=3,
                                    h4("Information"),
                                    helpText("You are invited to take part in this survey which will ask about your experience or potential future usage of 
                                                  interactive analytics platforms. You will also be asked some general information about you as a researcher: your role, 
                                                  your field of expertise, and the tools you currently use to do your job. The survey is anonymous and no identifying data
                                                  are collected. If you change your mind after beginning the questionnaire
                                                  you can close the screen and your responses will not be recorded."), 
                                    helpText("For more information on this survey, download the Participant Information using the link below"),
                                    
                                    # File to download is defined using dowloadHandler in server.R
                                    downloadButton("downloadInfo", "Participant Information")
                                ),

                    mainPanel(

                        # Consent info	                        p("**Add survey link")
                                         h4("Survey Consent"),	
                                         
                                         p("Please review the consent information below and click 'Proceed' to start the survey"),	
                                         tags$ul(	
                                             tags$p(icon("edit"), "I understand I am being asked to provide consent to participate in this research study."),	
                                             tags$p(icon("edit"), "I have read the Participant Information Sheet or it has been provided to me in a language 	
                                                that I understand."), 	
                                             tags$p(icon("edit"), "I provide my consent for the information collected about me to be used for the purpose of 	
                                                this research study only."),	
                                             tags$p(icon("edit"), "I understand that if necessary I can ask questions and the research team will respond to my 	
                                                questions."),	
                                             tags$p(icon("edit"), "I freely agree to participate in this research study as described and understand that I am 	
                                                free to withdraw at any time during the study and withdrawal will not affect my relationship with any of the named organisations and/or research team members.")	
                                         ),	
                                         actionButton(inputId = "q1", 
                                                      label = "I agree, proceed to survey", 
                                                      icon("feather-alt"), 
                                                      onclick ="window.open('http://surveymonkey.com', '_blank')")

                     ) # closes main panel
            
            )), # Closes Tab item, fluid page

## Study info section     
        tabItem(tabName='info',
                sidebarLayout(fluid=TRUE, 
                              sidebarPanel(width=3,
                                           h3("Study Information"),
                                           helpText("Here you will find some study information, including contact details and 
                                                    links to online resources that were helpful when developing this app.")
                              ),
                              
                              mainPanel(

                                  bs_accordion(id = "information") %>%
                                      bs_set_opts(panel_type = "info", use_heading_link = TRUE) %>%
                                      bs_append(title = "Online Resources",
                                                # Have to embed content within shiny::HTML to render properly in content of accordian list
                                                content = HTML("Several online resources, tutorials and blog posts were invaluable in building this
                                                        demonstration app. </p>
                                                    <ul>
                                                      <p>
                                                        <a href='https://shiny.rstudio.com/tutorial/' target='_blank'>
                                                          <i class='fa fa-link'></i>
                                                          Shiny tutorials from R Studio
                                                        </a>
                                                      </p>
                                                      <p>
                                                        <a href='https://www.youtube.com/channel/UCbck9jjLpwj7U6HHNps_9Gw/featured' target='_blank'>
                                                          <i class='fa fa-link'></i>
                                                          YouTube tutorial series on Shiny from Abhinav Agrawal
                                                        </a>
                                                      </p>
                                                      <p>
                                                        <a href='https://medium.com/@joyplumeri/using-r-shiny-to-create-web-surveys-display-instant-feedback-and-store-data-on-google-drive-68f46eea0f8b'>
                                                          <i class='fa fa-link'></i>
                                                          A blog post on collecting survey data using Shiny from Joy P Wyckoff
                                                        </a>
                                                      </p>
                                                      <p>
                                                        <a href='https://github.com/ConalMonaghan/Shiny-Survey-and-Feedback-Site' target='_blank'>
                                                          <i class='fa fa-link'></i>
                                                          Shiny source code for survey data collection from Conal Monaghan
                                                        </a>
                                                      </p>
                                                      <p>
                                                        <a href='https://rstudio.github.io/learnr/' target='_blank'>
                                                          <i class='fa fa-link'></i>
                                                          R learnr tutorials from R Studio
                                                        </a>
                                                      </p>
                                                      <p>
                                                        <a href='https://shiny.rstudio.com/tutorial/' target='_blank'>
                                                          <i class='fa fa-link'></i>
                                                          shinymeta — a revolution for reproducibility' - a blog post by Sebastian Wolf
                                                        </a>
                                                      </p>
                                                      <p>
                                                        <a href='https://rstudio.github.io/shinymeta/' target='_blank'>
                                                          <i class='fa fa-link'></i>
                                                          shinymeta tutorials 
                                                        </a>
                                                      </p>
                                                    </ul>
                                                ")) %>%
                                      bs_append(title = "Some deadly examples of interactive platforms from around the web",
                                                # Have to embed content within shiny::HTML to render properly in content of accordian list
                                                content = HTML("
                                                        The Oxford Interactive Data Network supports researchers at the University of Oxford
                                                        to design and develop data visualisations of research datasets to counter the issue of
                                                        Open but invisible. You can view some case studies below. 
                                                        <br/>
                                                        <a href='https://idn.it.ox.ac.uk/home' target='_blank'>
                                                        <i class='fa fa-link'></i>
                                                        The Oxford Interactive Data Network
                                                        </a> 
                                                        <p/> <br>
                                                        The Observational Health Data Sciences and Informatics (or OHDSI, pronounced 'Odyssey') 
                                                        program is an international and interdisciplinary collaboration that aims to promote the value 
                                                        of health data through large-scale analytics using open-source solutions. Members of the collaboration
                                                        have developed Shiny apps to supplement research outputs and aid data exporation and analysis.
                                                        <br/>
                                                        <a href='http://data.ohdsi.org/' target='_blank'>
                                                        <i class='fa fa-link'></i>
                                                        OHDSI Shiny Apps
                                                        </a>
                                                        <p/> <br>
                                                        The National Institute of Water and Atmospheric Research (NIWA) has developed an interactive online
                                                        Shiny app for mapping and interrogating estimates of environmental conditions across the entire New Zealand
                                                        river network, including hydrology, ecology and water quality metrics.
                                                        <br/>
                                                        <a href='https://shiny.niwa.co.nz/nzrivermaps/' target='_blank'>
                                                        <i class='fa fa-link'></i>
                                                        NZ River Maps
                                                        </a>
                                                        <p/> <br>
                                                        The Cal Poly Statistics Department have developed a suite of fun interactive Shiny apps for supporting
                                                        undergraduate learning in statistics and mathematics.
                                                        <br/>
                                                        <a href='https://statistics.calpoly.edu/shiny' target='_blank'>
                                                        <i class='fa fa-link'></i>
                                                        Cal Poly Shiny apps
                                                        </a>
                                                        <p/> <br>
                                                        Jupyter Notebooks are widely used to create dynamic and interactive documents.
                                                        <br>
                                                        <a href='https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-Notebooks' target='_blank'>
                                                        <i class='fa fa-link'></i>
                                                        A gallery of interesting Jupyter Notebooks
                                                        </a>
                                                        <p/> <br>
                                                        GESIS Notebooks is a gateway for social science researchers to access and host data science projects. 
                                                        Their website includes a gallery of Jupter Notebooks hosted in Binder.
                                                        <br>
                                                        <a href='https://notebooks.gesis.org/about/' target='_blank'>
                                                        <i class='fa fa-link'></i>
                                                        GESIS Notebooks
                                                        </a>
                                                        ")) %>%
                                                        bs_append(title = "Contact details",
                                                        content = HTML("
                                                        If you require further information regarding this study or if you have any problems which 
                                                        may be related to your involvement in the study, you can contact the following member of 
                                                        the research team:
                                                        <p/>
                                                        <ul>
                                                        Dr Mark Hanly <br>
                                                        Lecturer, Centre for Big Data Health in Research, UNSW <br>
                                                        +61 (0)2 938 53143 <br>
                                                        m.hanly@unsw.edu.au
                                                        </ul>
                                                        ")) %>%
                                                        bs_append(title = "Acknowedgements",
                                                        content = HTML("
                                                        This research was funded by an ARDC Storage and Compute discovery grant.
                                                        <p/> <p/>
                                                        Thank you to the following individuals who provided guidance and advice towards this project:
                                                        Prof Louisa Jorm,
                                                        Dr Bronwyn Brew-Haasdyk,
                                                        Dr Kathleen Falster,
                                                        Dr Oscar Perez Concha,
                                                        Dr Sabita Rana,
                                                        Ms Michele Partridge
                                                        <p/>
                                                        We extend our warm thanks to the UI/UX testers for detailed feedback on earlier drafts of this app:
                                                        Andrew Turner, Danielle Martin, Ian Cumbers, Marie Freeman, Dr Martin Hooper and Yeni Pardini.
                                                        "))
                                  
                            ) # Closes main panel

                )) # Closes Tab item, fluid page
        
    ) # Closes tabItems bracket
) # closes dashboardSidebar bracket



# Put them together into a dashboardPage
dashboardPage(skin='black',
              header,
              sidebar,
              body
)


