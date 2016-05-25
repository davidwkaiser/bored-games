# bored-games

'Bored? Games!' is a web application that allows users to search through a database of board games using varying criteria. Users can also save games to their libraries, add other users as friends, give their favorite games 'points' to give them a positive rating, and view their friends' libraries of games.

The application is a Ruby on Rails program that that is hosted on [Heroku](https://bored-games-arch.herokuapp.com/ "Heroku") and uses a PostgreSQL database that was populated using Nokogiri and the [board game geek API](http://boardgamegeek.com/wiki/page/BGG_XML_API2 "Board Game Geek API").

Team A.R.C.H. (Adult Regular Coding Humans)

Members:
* Josh Lugo
* Wesley El-Amin
* Oscar Delgadillo
* David Kaiser

User Stories for MVP:

* As a user...
	* I want to be able to sign up with a unique username and password
	* I want to be able to log in/out with those credentials
	* I want to be able to see a list of all board games
	* I want to see a limited list of board games when I visit the home page
	* I want to have a library of games
	* I want the ability visit a game's page and see:
		* a title	
		* a description
		* the minimum and maximum number of players
		* the time it takes to play a full game
		* the game's mechanics
		* the year the game was published
		* the number of votes a game has
	* I want to be able to add a game to my library
	* I want to be able to remove a game from my library
	* I want to be able to vote on any game I've added to my library
	* I want to be able to see user profiles that show a user's username, friends, and game library
	 	* I only want friends and library to be seen by a user's friends
	* When someone that is not logged in views my page, I only want them to be able to see my username
	* I want to be able to add other users as friends when I visit their profile
	* I want the website to look joyful and fun
	* I want to be able to compare my library to another user's



![schema](./public/schema.png)
