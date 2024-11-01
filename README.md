# Flutter Weather App

## Overview

The **Flutter Weather App** is a modern mobile application built with **Flutter** and **GetX** for state management. It enables users to search for a city and retrieve real-time weather information using the **OpenWeatherMap API**. Designed for a seamless experience, the app features a responsive layout, clean interface, and efficient error handling.

## Features

- **User-Friendly Interface**: A simple and intuitive design for easy navigation.
- **City Search**: Users can search for any city to retrieve the current weather details.
- **Current Weather Details**:
  - City Name
  - Current Temperature
  - Weather Condition (e.g., sunny, rainy)
- **Responsive Design**: Optimized for different screen sizes with Flutter's layout widgets.
- **Loading Indicator**: Visual feedback to indicate data is being fetched.
- **Error Handling**: Displays meaningful messages for invalid city names or network errors.
- **Animations**: Smooth fade-in effects for displaying weather data.
- **Dark Mode Support**: Toggle between light and dark themes based on user preference.
- **Local Notifications**:
  - **Full-Screen Intent Notifications**: Displays like an alarm, activating the screen even when the device is locked for high-visibility events such as reminders.
  - **Different Notification Types**:
    - **Standard Notifications**: Regular push notifications for standard updates.
    - **Heads-Up Notifications**: Overlay notifications for immediate visibility.
    - **Full-Screen Notifications**: Automatically navigates to the appropriate screen in the app.
  - Notifications are managed with `flutter_local_notifications` for scheduling and navigation.

## Screenrecording of the Application
- [Android App Screenrecording](https://drive.google.com/file/d/1ugsdUeeswPa9xHPm7m5ESEPj1DqmQR1j/view?usp=sharing)
- [iOS App Screenrecording](https://drive.google.com/file/d/12FvNxXJv3wAwgXAPzdEZHsAwIq8z0aDH/view?usp=sharing)

## Skills Used to Build This App

- **Flutter SDK**
- **Dart**
- **GetX** for state management
- **OpenWeatherMap API** for weather data retrieval

## Setup Instructions

### Prerequisites

Make sure you have the following installed:

- **Flutter SDK** (Follow the instructions [here](https://flutter.dev/docs/get-started/install))
- An IDE like **Android Studio** or **Visual Studio Code**

### Installation Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Ranvijaykumar9708/Weather_app.git
   cd flutter_weather_app
