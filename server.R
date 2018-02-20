#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
arena <- c('Air Canada Cenre', 'Amalie Arena', 'American Airlines Center', 'BB&T Center', 'Barclays Center', 'Bell Center', 'Bell MTS Place', 'Bridgestone Arena', 'Canadian Tire Centre', 'Capital One Arena', 'Gila River Arena', 'Honda Center', 'KeyBank Center', 'Little Caesars Arena', 'Madison Square Garden', 'Nationwide Arena', 'Pepsi Center', 'PNC Arena', 'PPG Paints Arena', 'Prudential Center', 'Rogers Arena', 'Rogers Place', 'Scotiabank Saddledome', 'SAP Center', 'Scottrade Center', 'Staples Center', 'TD Garden', 'T-Mobile Arena', 'United Center', 'Wells Fargo Center', 'Xcel Energy Center')

capacity <- c(18819, 19092, 18532, 19250, 15795, 21302, 15321, 17113, 17373, 18506, 17125, 17174, 19070, 19515, 18006, 18144, 17809, 18680, 18387, 16514, 18910, 18347, 19289, 17562, 18724, 18230, 17565, 17368, 19717, 19543, 17954)

team <- c('Toronto Maple Leafs', 'Tampa Bay Lightning', 'Dallas Stars', 'Florida Panthers', 'New York Islanders', 'Montreal Canadiens', 'Winnipeg Jets', 'Nashville Predators', 'Ottawa Senators', 'Washington Capitals', 'Arizona Coyotes', 'Anaheim Ducks', 'Buffalo Sabres', 'Detroit Red Wings', 'New York Rangers', 'Columbus Blue Jackets', 'Colorado Avalanche', 'Carolina Hurricanes', 'Pittsburgh Penguins', 'New Jersey Devils', 'Vancouver Canucks', 'Edmonton Oilers', 'Calgary Flames', 'San Jose Sharks', 'St. Louis Blues', 'Los Angeles Kings', 'Boston Bruins', 'Vegas Golden Knights', 'Chicago Blackhawks', 'Philadelphia Flyers', 'Minnesota Wild')

division <- c('atlantic', 'atlantic', 'central', 'atlantic', 'metro', 'atlantic', 'central', 'central', 'atlantic', 'metro', 'pacific', 'pacific' ,'atlantic', 'atlantic', 'metro', 'metro', 'central', 'metro', 'metro', 'metro', 'pacific', 'pacific', 'pacific', 'pacific', 'central', 'pacific','atlantic', 'pacific', 'central', 'metro', 'central')
#lat <- c(43.643333, 27.942778, 32.790556, 26.158333, 40.68265, 45.496111, 49.892778, 36.159167, 45.296944, 38.898056, 33.531944, 33.807778, 42.875, 42.341172, 40.750556, 39.969283, 39.748611, 35.803333, 40.439444, 40.733611, 49.277778, 53.546944, 51.0375, 37.332778,38.626667, 34.043056, 42.366303, 36.102778, 41.880556, 39.901111, 44.944722)

#lng <- c(-79.379167, -82.451944, -96.810278, -80.325556, -73.974689, -73.569444, -97.143611, -86.778611, -75.927222, -77.020833, -112.261111, -117.876667, -78.876389, -83.054911, -73.993611, -83.006111, -105.0075, -78.721944, -79.989167, -74.171111, -123.108889, -113.497778, -114.051944, -121.901111, -90.2025, -118.267222, -71.062228, -115.178333, -87.674167, -75.171944, -93.101111)

address <- c("40 Bay Street", "401 Channelside Drive", "2500 Victory Avenue", "1 Panther Parkway", "620 Atlantic Avenue", "1909, avenue des Canadiens-de-Montréal", "300 Portage Avenue", "501 Broadway", "1000 Palladium Drive", "601 F Street NW", "9400 West Maryland Avenue", "2695 East Katella Avenue", "1 Seymour H. Knox III Plaza", "2645 Woodward Avenue", "4 Pennsylvania Plaza", "200 West Nationwide Boulevard", "1000 Chopper Circle", "1400 Edwards Mill Road", "1001 Fifth Avenue", "25 Lafayette Street", "800 Griffiths Way", "104 Avenue NW", "555 Saddledome Rise SE", "525 West Santa Clara Street", "1401 Clark Avenue", "1111 South Figueroa Street", "	100 Legends Way", "3780 South Las Vegas Boulevard", "1901 West Madison Street", "3601 South Broad Street", "199 Kellogg Boulevard West")

city <- c("Toronto", "Tampa", "Dallas", "Sunrise", "Brooklyn", "Montreal", "Winnipeg", "Nashville", "Ottawa", "Washington", "Glendale", "Anaheim", "Buffalo", "Detroit", "New York", "Columbus", "Denver", "Raleigh", "Pittsburgh", "Newark", "Vancouver", "Edmonton", "Calgary", "San Jose", "St. Louis", "Los Angeles", "Boston", "Paradise", "Chicago", "Philadelphia", "Saint Paul")

state <- c("Ontario", "Florida", "Texas", "Florida", "New York", "Quebec", "Manitoba", "Tennessee", "Ontario", "D.C.", "Arizona", "California", "New York", "Michigan", "New York", "Ohio", "Colorado", "North Carolina", "Pennsylvania", "New Jersey", "British Columbia", "Alberta", "Alberta", "California", "Missouri", "California", "Massachusetts", "Nevada", "Illinois", "Pennsylvania", "Minnesota")
nhl.data <- data.frame(division, team, arena, capacity, address, city, state)
nhl.data


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$team_table <- DT::renderDataTable({
    DT::datatable(subset(nhl.data, division %in% input$division))
  })
  output$about_tab <- renderUI({
    div(
    HTML("This application allows you to see teams in the different NHL Divisions. ", 
        "<p><p> As a user, you can select just one, or multiple divisions and see a table of which teams are included in your selection.",
        "<p><p> In the table, you can select the number of rows to display per page and sort on each column as well as search within the table.")
    )
    })
})
