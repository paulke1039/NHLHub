Developing Data Products Presentation
========================================================
author: Paul Y. Ke
date: 2/20/2018
autosize: true

Project Overview
========================================================

This project has two parts and is intended to provide the experience of developing a Data Product.

First, a Shiny application was developed and deployed on Rstudio's servers. 
The application can be found here:
https://paulke1039.shinyapps.io/NHLHub/

Second, I used Rstudio Presenter to prepare a reproducible pitch presentation, which you are now watching.
The source for the application and this presentation can be found on GitHub here:
https://github.com/paulke1039/NHLHub


NHL Dataset
========================================================
The dataset was built from data on Wikipedia:
https://en.wikipedia.org/wiki/List_of_National_Hockey_League_arenas



```r
summary(nhl.data)
```

```
     division                  team                         arena   
 atlantic:8   Anaheim Ducks      : 1   Air Canada Cenre        : 1  
 central :7   Arizona Coyotes    : 1   Amalie Arena            : 1  
 metro   :8   Boston Bruins      : 1   American Airlines Center: 1  
 pacific :8   Buffalo Sabres     : 1   Barclays Center         : 1  
              Calgary Flames     : 1   BB&T Center             : 1  
              Carolina Hurricanes: 1   Bell Center             : 1  
              (Other)            :25   (Other)                 :25  
    capacity                           address          city   
 Min.   :15321   \t100 Legends Way          : 1   Anaheim : 1  
 1st Qu.:17468   1 Panther Parkway          : 1   Boston  : 1  
 Median :18347   1 Seymour H. Knox III Plaza: 1   Brooklyn: 1  
 Mean   :18217   1000 Chopper Circle        : 1   Buffalo : 1  
 3rd Qu.:18990   1000 Palladium Drive       : 1   Calgary : 1  
 Max.   :21302   1001 Fifth Avenue          : 1   Chicago : 1  
                 (Other)                    :25   (Other) :25  
          state   
 California  : 3  
 New York    : 3  
 Alberta     : 2  
 Florida     : 2  
 Ontario     : 2  
 Pennsylvania: 2  
 (Other)     :17  
```

Application screenshot
========================================================
![NHLHub Screenshot](NHLHub.png)

Behind the Scenes
========================================================
The user selects one or more divisions using the checkboxes on the left.

A table is generated on the right by subsetting the data frame using the values selected by the user.

The user can select how many rows appear on the page, sort each column of data, and search within the table.
