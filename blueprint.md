
# Ducati Collection App Blueprint

## Overview

A Flutter application that showcases a collection of Ducati motorcycles. Users can browse different models, view details, add them to favorites, and add them to a shopping cart. The app also includes a map feature to find Ducati dealerships.

## Style, Design, and Features

### Version 1.0.0

*   **Main Screen:** A bottom navigation bar with four tabs: Home, Favorites, Cart, and Map.
*   **Home Screen:**
    *   Displays a header with the app title and a notification icon.
    *   A hero banner with a call to action.
    *   A horizontal list of motorcycle categories.
    *   A horizontal list of popular models.
    *   A special offers section.
    *   A news and events section.
*   **Motorcycle List Screen:** A grid view of all available motorcycles.
*   **Favorites Screen:** (Placeholder)
*   **Cart Screen:** (Placeholder)
*   **Map Screen:** (Placeholder)
*   **Styling:**
    *   **Primary Color:** `Color(0xFFFF3B30)` (Ducati Red)
    *   **Scaffold Background Color:** `Colors.grey[100]`
    *   **Font:** Roboto

## Current Plan: Add Login and Registration

*   **Goal:** Add a login and registration flow to the application.
*   **Steps:**
    1.  Add `go_router` and `google_fonts` to the `pubspec.yaml`.
    2.  Create a `LoginScreen` with email and password fields, a login button, and a link to the registration screen.
    3.  Create a `RegisterScreen` with email, password, and confirm password fields, and a registration button.
    4.  Configure `go_router` to handle navigation:
        *   The initial route will be `/login`.
        *   After successful login, the user will be redirected to the home screen (`/`).
        *   The registration screen will be at `/register`.
    5.  Implement a theme using `google_fonts` and `ThemeData`.
    6.  Create a `ThemeProvider` to manage the app's theme (light/dark mode).
