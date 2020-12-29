<!-- PROJECT LOGO -->
<br />
<p align="center"> 

  <a href="https://user-images.githubusercontent.com/62523613/103273127-dd478d80-49be-11eb-90f1-765839156e64.png">
    <img src="https://user-images.githubusercontent.com/62523613/103273127-dd478d80-49be-11eb-90f1-765839156e64.png" alt="Icon" width="80" height="80">
  </a>
  
  <h1 align="center">Full Stack Notes App</h1>
  <p align="center">
    <h3 align ="center">Yet another notes app... with a custom back-end though!<h3>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents
* [Introduction](#introduction)
* [About the Project](#about-the-project)
* [What did I get from this project?](#what-did-i-get-from-this-project)
* [Built With](#built-with)
* [Installation Requirements](#installation-requirements)
* [IMPORTANT INFO](#important-info)
* [License](#license)

## Introduction

Ah, the infamous Notes App that can be found in every apprentice developer's repositories. The cornerstone of building your skills as a programmer... right? Well, in my case, I decided to share this work as I learnt a thing or two here, especially when dealing with JavaScript and external databases. So, without further ado, let's discuss the project itself!

<!-- ABOUT THE PROJECT -->
## About The Project

<p align="center">
  <img width="277" height="527" src="https://user-images.githubusercontent.com/62523613/103273869-9bb7e200-49c0-11eb-96e5-b86383ac77af.gif">
</p>

Full Stack Note App is a project based on <a href="https://www.youtube.com/watch?v=vKCdVAg5h40">Full Stack Note App</a> course. The app could be your another note app, BUT this one stands out as the one having its own MongoDB database stored with a local host. Simply said, the app is on your phone but the data it uses is stored e.g. on your laptop, with which it connects through a local network. 

The final project is not a simple copy-paste, as I decided to introduce some changes:<br>
- Instead of following Ali's directions with storyboards, I decided to go my own way and wrote all the views 100% programmatically.<br>
- The initial version of the project doesn't support line breaks and the Polish alphabet characters (Ą, Ę, Ć, Ź, Ż, Ó, Ł, Ś, Ń) so I have dealt with that as well.
- I got rid of the explicitly unwrapped values and managed the networking errors a little bit so that the user won't be confused when the app is not responding the way it should.

<img src="https://user-images.githubusercontent.com/62523613/103277337-138a0a80-49c9-11eb-8aaa-b9f6e142d078.png" width="1000"/> <img src="https://user-images.githubusercontent.com/62523613/103277519-81363680-49c9-11eb-8efe-5be64d8183e0.png" width="1000"/>

## What did I get from this project?
Among many things I learnt/trained during this project, here are the most important ones for me:
- writing UI programmatically
- creating CRUD network calls in Alamofire
- writing a custom MongoDB API in Node.js with Mongoose
- MVC design pattern
- using delegates and protocols
- implementation of Dynamic Type
- Dark Mode support
- using Swift Package Manager
- testing the API responsiveness with Postman

## Built With
* [Swift 5.3](https://developer.apple.com/swift/)
* [UIKit](https://developer.apple.com/documentation/uikit)
* <a href="https://www.mongodb.com/2">MongoDB</a> 
* <a href="https://mongoosejs.com">Mongoose</a>
* <a href="https://nodejs.org/en/">Node.js</a>

<!-- GETTING STARTED -->

## Installation Requirements

To make the magic happen, you will need these:
- <a href="https://brew.sh">Homebrew</a>
- <a href="https://www.mongodb.com/2">MongoDB</a> 
- <a href="https://mongoosejs.com">Mongoose</a>
- <a href="https://nodejs.org/en/">Node.js</a>
- To make things simplier - <a href="https://code.visualstudio.com">Visual Studio Code</a>

I wouldn't dare try to explain what should be done and how it should be done better than Ali himself, so I strongly encourage you to follow his <a href="https://youtu.be/vKCdVAg5h40?t=533">instructions</a>.

## Important Info
Don't forget to swap the "000.000.0.000" IPv4 address for your own in the project files ('server.js' in 'Server for Note App' folder and 'APIFunctions' in 'Note App iOS Project' folder).

<!-- LICENSE -->
## License

See `LICENSE` for information.
