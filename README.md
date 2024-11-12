# Spotify Music Recommendation App

This is a Shiny-based web application that allows users to create personalized playlists by selecting their favorite music genre and artist. The app fetches Spotify top songs from 2010 to 2019 and visualizes song popularity in a bar chart.

**App Demo:** [Try the app here](https://wia1007-groupv.shinyapps.io/MusicRecommendation/)

## Features

- **Genre Selection**: Choose from 50 different music genres to find songs in your favorite genre.
- **Artist Selection**: After selecting a genre, pick your favorite artist from a dynamic list.
- **Song Recommendation**: Display top songs of the selected artist from 2010 to 2019.
- **Song Popularity Plot**: View a bar chart that visualizes the popularity of each song by the selected artist.

## How to Use

1. **Select Your Favorite Genre**: From the dropdown list, choose a genre you love. There are 50 genres available.
2. **Select Your Favorite Artist**: After selecting a genre, the app will update the list of artists. Choose your favorite artist.
3. **View Song List**: The app will display a table with the top songs of your selected artist from 2010 to 2019.
4. **Popularity Graph**: You can view a bar plot showing the popularity of each song from your chosen artist.

## Technology Stack

- **Shiny**: For building the interactive web application.
- **ggplot2**: For data visualization (creating the bar plot).
- **dplyr**: For data manipulation.
- **bslib**: For creating custom Bootstrap themes.
- **showtext**: For enhanced font rendering.
- **thematic**: For making plots consistent with the app's theme.
- **rsconnect**: For deploying the app to shinyapps.io.

## Data Source

The data is sourced from Kaggle: [Spotify Top Songs (2010-2019)](https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year).

## Installation (For Local Setup)

To run this application locally, you need to have **R** installed along with the following packages:

- `shiny`
- `ggplot2`
- `bslib`
- `showtext`
- `thematic`
- `dplyr`
- `shinyjs`
- `rsconnect`
