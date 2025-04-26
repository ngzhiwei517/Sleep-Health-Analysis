library(shiny)
library(shinythemes)

# Define UI for application
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  tags$head(
    # Include Google Fonts
    tags$link(rel = "preconnect", href = "https://fonts.googleapis.com"),
    tags$link(rel = "preconnect", href = "https://fonts.gstatic.com", crossorigin = TRUE),
    tags$link(href = "https://fonts.googleapis.com/css2?family=PT+Serif:ital,wght@0,400;0,700;1,400;1,700&display=swap", rel = "stylesheet"),
    # Custom CSS to apply the font
    tags$style(HTML("
      body {
        font-family: 'PT Serif', serif;
      }
      .title {
        text-align: center;
        margin-bottom: 20px;
        font-weight: 700;
      }
      .panel {
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      }
      .sidebar {
        background-color: #f7f7f7;
        padding: 15px;
        border-radius: 10px;
      }
      .main {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 10px;
      }
      .btn-predict {
        background-color: #337ab7;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        margin-top: 20px;
      }
      .pt-serif-regular {
        font-family: 'PT Serif', serif;
        font-weight: 400;
        font-style: normal;
      }
      .pt-serif-bold {
        font-family: 'PT Serif', serif;
        font-weight: 700;
        font-style: normal;
      }
      .pt-serif-regular-italic {
        font-family: 'PT Serif', serif;
        font-weight: 400;
        font-style: italic;
      }
      .pt-serif-bold-italic {
        font-family: 'PT Serif', serif;
        font-weight: 700;
        font-style: italic;
      }
    "))
  ),
  titlePanel(title = div(class = "title pt-serif-bold", "Sleep Health Analysis")),
  sidebarLayout(
    sidebarPanel(
      class = "sidebar",
      sliderInput("sleep_duration", "Sleep Duration (hours):", min = 0, max = 12, value = c(0, 12), step = 0.5),
      sliderInput("daily_steps", "Daily Steps Estimation:", min = 0, max = 20000, value = 10000, step = 1000),
      sliderInput("stress_level", "Stress Level (from low to high):", min = 1, max = 5, value = 3, step = 1),
      numericInput("heart_rate", "Heart Rate (bpm):", value = 70),
      numericInput("age", "Age:", value = 30),
      numericInput("bmi", "BMI:", value = 25),
      actionButton("predict", "Predict", class = "btn-predict pt-serif-bold")
    ),
    mainPanel(
      class = "main",
      h3(class = "pt-serif-bold", "Input and Relationship with Sleep Quality"),
      htmlOutput("sleep_quality_text"),
      h3(class = "pt-serif-bold", "Overall Sleep Quality:"),
      textOutput("overall_quality"),
      h3(class = "pt-serif-bold", "Suggestions for Improvement:"),
      htmlOutput("suggestions")
    )
  )
)

# Define server logic required to draw the prediction
server <- function(input, output) {
  
  # Function to predict sleep quality based on input features
  predict_sleep_quality <- function(sleep_duration, daily_steps, stress_level, heart_rate, age, bmi) {
    # Evaluate the relationship between each feature and sleep quality
    sleep_quality_text <- paste(h5(class = "pt-serif-regular", "Sleep Duration: ", sprintf("%.1f", sleep_duration), " hours"),
                                if (sleep_duration < 6) {
                                  "Your sleep duration of less than 6 hours, which is too short and is often associated with poor sleep quality. It may increase the risk of health problems."
                                } else if (sleep_duration >= 6 & sleep_duration <= 8) {
                                  "Your sleep duration of 6 to 8 hours is generally associated with good sleep quality and overall health. Mantain it!"
                                } else {
                                  "Your sleep duration of more than 8 hours may indicate excessive sleep, which could impact sleep quality and may be a sign of underlying health issues."
                                }, "<br><br>",
                                
                                h5(class = "pt-serif-regular", "Stress Level: ", stress_level),
                                if (stress_level <= 2) {
                                  "Low stress levels are generally associated with better sleep quality, as stress can significantly impact how well you sleep."
                                } else if (stress_level >= 3 & stress_level <= 4) {
                                  "Moderate stress levels may start to affect your sleep quality, making it important to manage stress effectively to maintain good sleep habits."
                                } else {
                                  "High stress levels are often associated with poor sleep quality, which can lead to difficulties falling asleep, staying asleep, and feeling rested."
                                }, "<br><br>",
                                
                                h5(class = "pt-serif-regular", "Stress Level: ", stress_level),
                                if (stress_level <= 2) {
                                  "Low stress levels are generally associated with better sleep quality."
                                } else if (stress_level >= 3 & stress_level <= 4) {
                                  "Moderate stress levels may affect sleep quality."
                                } else {
                                  "High stress levels are often associated with poor sleep quality."
                                }, "<br><br>",
                                
                                h5(class = "pt-serif-regular", "Heart Rate: ", heart_rate, " bpm"),
                                if (heart_rate < 60) {
                                  "Low resting heart rate may indicate good cardiovascular health, which could positively impact sleep quality."
                                } else if (heart_rate >= 60 & heart_rate <= 100) {
                                  "Normal resting heart rate is generally associated with good sleep quality."
                                } else {
                                  "High resting heart rate may indicate stress or other health issues that could affect sleep quality."
                                }, "<br><br>",
                                
                                h5(class = "pt-serif-regular", "Age: ", age, " years"),
                                if (age < 18) {
                                  "Younger individuals need more sleep to support growth and development. It is recommended you get 8-10 hours of sleep per night for optimal health."
                                } else if (age >= 18 & age < 60) {
                                  "Adults between 18 and 60 years old typically need 7-9 hours of sleep each night to maintain good health and cognitive function."
                                } else {
                                  "For adults over 60, sleep patterns may change due to various factors like changes in sleep architecture or health conditions. You generally need about 7-8 hours of sleep, but don't worry if you find it harder to stay asleep throughout the night."
                                }, "<br><br>",
                                
                                h5(class = "pt-serif-regular", "BMI: ", bmi), 
                                if (bmi < 18.5) {
                                  "Your BMI is below 18.5, indicating underweight, which can be associated with poor sleep quality and potential health issues."
                                } else if (bmi >= 18.5 & bmi < 25) {
                                  "Your BMI is within the range of 18.5 to 24.9, considered normal and is generally associated with good sleep quality and overall health."
                                } else {
                                  "Your BMI is 25 or higher, indicating overweight or obesity, which can increase the risk of sleep disturbances, such as sleep apnea, and other sleep-related health problems."
                                })
    
    # Calculate overall sleep quality
    abnormal_features <- sum(c(sleep_duration < 6, sleep_duration > 8, daily_steps < 5000, daily_steps > 10000, stress_level >= 4, heart_rate < 60 | heart_rate > 100, age < 18 | age > 60, bmi >= 25))
    overall_quality <- ifelse(abnormal_features >= 3, "a poor sleep quality! It can significantly impact your overall health and well-being, do seek for a consultation from healthcare provider or sleep specialist.",
                              ifelse(abnormal_features >= 2 & abnormal_features < 3, "a fair sleep quality! With some adjustments, you can move from fair to good or even excellent sleep quality, significantly enhancing your overall well-being and daytime functioning.",
                                     ifelse(abnormal_features < 2, "an excellent sleep quality! Keep it up, you can sustain the many benefits that come with consistently restful and rejuvenating nights.")))
    
    # Generate suggestions for improvement
    suggestions <- ""
    if (abnormal_features > 0) {
      suggestions <- "Here are some tips and strategies that might help you improve your sleep quality:<br>"
      if (sleep_duration < 6) {
        suggestions <- paste(suggestions, "- Lengthen your sleeping hours.<br>")
      }
      if (sleep_duration > 8) {
        suggestions <- paste(suggestions, "- Prevent taking excessive sleep.<br>")
      }
      if (daily_steps < 5000) {
        suggestions <- paste(suggestions, "- Increase your daily steps.<br>")
      }
      if (daily_steps > 10000) {
        suggestions <- paste(suggestions, "- Decrease your workload and don't pressure yourself.<br>")
      }
      if (stress_level >= 4) {
        suggestions <- paste(suggestions, "- Practice breathing and reduce caffeine intake.<br>")
      }
      if (heart_rate < 60 | heart_rate > 100) {
        suggestions <- paste(suggestions, "- Consult a healthcare professional for heart rate abnormalities.<br>")
      }
      if (age < 18 | age > 60) {
        suggestions <- paste(suggestions, "- Ensure adequate sleep for your age group.<br>")
      }
      if (bmi >= 25) {
        suggestions <- paste(suggestions, "- Exercise more and maintain a balanced diet.<br>")
      }
    }
    
    return(list(sleep_quality_text, overall_quality, suggestions))
  }
  
  # Event handler for the predict button
  observeEvent(input$predict, {
    # Call the prediction function with input parameters
    result <- predict_sleep_quality(input$sleep_duration[2] - input$sleep_duration[1],
                                    input$daily_steps,
                                    input$stress_level,
                                    input$heart_rate,
                                    input$age,
                                    input$bmi)
    
    # Output the prediction
    output$sleep_quality_text <- renderUI({
      HTML(result[[1]])
    })
    
    # Output the overall sleep quality
    output$overall_quality <- renderText({
      paste("You have ", result[[2]])
    })
    
    # Output suggestions for improvement
    output$suggestions <- renderUI({
      HTML(result[[3]])
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
