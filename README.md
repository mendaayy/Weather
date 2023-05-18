# Weather

## Introduction
During my specialisation in Smart Mobile, I needed to learn about IOS and creating my first ever Swift app.
So, I chose to do a weather app that fetches the weather of the searched location (with Eindhoven as an initial location). 
It displays the current degree, the description of the weather, min and max temperature, wind speed and humidity of the current weather of a certain location.

## Tools & technologies
- Swift 
- Xcode

## Process 
I first read through some Apple Design Guideliness and went trough the Apple’s Swift UI tutorials. I got some basics so I started with coding my first ever IOS app, a weather app.
I took inspiration of the UI of this [Figma prototype](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.figma.com%2Fcommunity%2Ffile%2F1100826294536456295&psig=AOvVaw2WM5qFcUaOIJaINSdXumZH&ust=1684533149310000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCJjhvpHt__4CFQAAAAAdAAAAABAE). 
At first, I wanted to try out the Weather Kit API so I got access to the school's Apple Developer Program. However, I didn’t manage to integrate that API; my xcode crashes everytime I try to call the WeatherKit library which was unknown why.
So, in the end, I used the[Open Weather API](https://openweathermap.org/api/one-call-3), the current weather API. 
For this app, I struggled with retrieving the data from the API. I tried different ways and couldn’t do it and in the end, I found out it was because I put “Codable” to the structs instead of “Decodable”.

## UI

<img width="506" alt="Screenshot 2023-03-20 at 07 44 10" src="https://github.com/mendaayy/Weather/assets/122844229/ff45b3e9-efea-4c97-861b-d70b4edddc64">

## Note
When trying out the app, make sure to fill in the Open Weather API key in the WeatherService file line 27.
