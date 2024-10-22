# Flutter Weather App

## Overview

The *Flutter Weather App* is a modern mobile application built with *Flutter* and *GetX* for state management. It allows users to search for a city and retrieve current weather conditions using the *OpenWeatherMap API*. The app is designed to provide a smooth user experience with a responsive layout and a clean interface.

## Features

- *User-Friendly Interface*: A simple and intuitive design for easy navigation.
- *City Search*: Users can enter a city name to get current weather information.
- *Current Weather Details*:
  - City Name
  - Current Temperature
  - Weather Condition (e.g., sunny, rainy)
- *Responsive Design*: Optimized for various screen sizes using Flutter's layout widgets.
- *Loading Indicator*: A visual spinner to indicate that data is being fetched.
- *Error Handling*: Displays meaningful messages for invalid city names or network errors.
- *Animations*: Smooth fade-in effects for displaying weather data.
- *Dark Mode Support*: Toggle between light and dark themes based on user preference.

## Screenrecording of the application
- Android app Screenrecording you can access from [here](https://drive.google.com/file/d/1ugsdUeeswPa9xHPm7m5ESEPj1DqmQR1j/view?usp=sharing)
- iOS app Screenrecording you can access from [here](https://drive.google.com/file/d/12FvNxXJv3wAwgXAPzdEZHsAwIq8z0aDH/view?usp=sharing)

## Skills I have used to make This App

- Flutter SDK
- Dart
- GetX for state management
- OpenWeatherMap API for weather data retrieval

## Setup Instructions

### Prerequisites

Ensure you have the following installed:

- Flutter SDK (Follow the instructions [here](https://flutter.dev/docs/get-started/install))
- An IDE such as Android Studio or Visual Studio Code

### Installation Steps

1. *Clone the Repository*:
   ```bash
   git clone https://github.com/Ranvijaykumar9708/Weather_app.git
   cd flutter_weather_app

### Project structure
```bash
lib/
│
├── controllers/       # Contains GetX controllers for state management
├── models/            # Contains data models for parsing API responses
├── services/          # API service classes for fetching weather data
├── views/             # UI components and screens
├── main.dart          # Entry point of the application
└── utils/             # Utility functions and constants