# UIKit TMDB App

## General Explanation
### Usage
- Swipe left and right tableView header, click to navigate detail screen.
- Swipe down and up tableView cells, click desired cell to navigate detail screen.
- Swipe down and up movie overview in detail screen, if it is long more than screen.
- Click IMDb logo to redirect IMDb web page.

### Structure
- Paginations & Pull To Refresh
- IMDB redirection with imdb_id
- Error & Load handle
- /movie/now_playing for slider.
- /movie/upcoming for list.
- /movie/{movie_id}. for movie details.
- I used MVVM as default design pattern
- I devided Constants, Extension, Enumeration, protocols as much as possible.
- I devided groups with related files.
- I added comment as much as possible, rather I prefered well designed function and property names.
- I try to avoid retain cycle, and cared variables reference count.
- I try to avoid massive ViewController. So, I devided function with related extensions.
- I didn’t add any UI or UT tests

## Think I am done or not
### General Requirements
-  + App should be coded with Swift Programming Language
-  + At least one 3rd party library should be implemented with CocoaPods.
-  + All screens should be pixel perfect design.
-  + App should be fully functional.
-  + Clean architectural design.
-  + Codable
-  + Network Layer

### General Optionals
- + Git
- + Proper Gitflow Usage (I didnt use GitFlow, but i simulate its flow)
- + gitignore

###Bonuses
- + Clean code style.
- - Abstracting the 3rd party libraries.
- + MVVM Architecture
- + High Order Function usage

- Finally, I added three demo to demonstrate my work. ->

Feature-Ver-1 Demo         |  Feature-Ver-2 Demo       |  Feature-Ver-3 Demo
:-------------------------:|:-------------------------:|:-------------------------:
![](DemoGifs/Feature-Ver-1.gif)|![](DemoGifs/Feature-Ver-2.gif)|![](DemoGifs/Feature-Ver-3.gif) 
