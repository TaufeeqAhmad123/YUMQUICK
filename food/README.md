# FoodieExpress - Food Delivery Flutter App

A modern food delivery Flutter application with Provider state management, featuring splash screen, onboarding, authentication, and home screen with food categories and restaurants.

## Features

- **Splash Screen**: Animated app introduction with branding
- **Onboarding**: Three-screen introduction to app features
- **Authentication**: Login and signup screens with form validation
- **Home Screen**: Food categories, restaurant listings, and search functionality
- **State Management**: Provider pattern for managing app state
- **Modern UI**: Clean, responsive design with custom components

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart      # App color palette
│   │   └── app_strings.dart     # App text constants
│   └── router/
│       └── app_router.dart      # GoRouter configuration
├── providers/
│   ├── auth_provider.dart       # Authentication state management
│   ├── food_provider.dart       # Food data state management
│   └── onboarding_provider.dart # Onboarding state management
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart    # Login screen
│   │   ├── signup_screen.dart   # Signup screen
│   │   └── widgets/             # Auth-related widgets
│   ├── home/
│   │   ├── home_screen.dart     # Main home screen
│   │   └── widgets/             # Home-related widgets
│   ├── onboarding/
│   │   ├── onboarding_screen.dart # Onboarding flow
│   │   └── widgets/             # Onboarding widgets
│   └── splash/
│       └── splash_screen.dart   # Splash screen
└── main.dart                    # App entry point
```

## Dependencies

- **provider**: State management
- **go_router**: Navigation and routing
- **google_fonts**: Custom fonts
- **shared_preferences**: Local storage
- **cached_network_image**: Image caching
- **flutter_svg**: SVG support

## Getting Started

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run the App**
   ```bash
   flutter run
   ```

## App Flow

1. **Splash Screen**: Shows app logo and branding for 3 seconds
2. **Onboarding**: Three screens introducing app features (skippable)
3. **Authentication**: Login/Signup with form validation
4. **Home Screen**: Browse food categories and restaurants

## State Management

The app uses Provider for state management with three main providers:

- **AuthProvider**: Manages user authentication state
- **OnboardingProvider**: Tracks onboarding completion
- **FoodProvider**: Manages food categories and restaurant data

## Features Overview

### Authentication
- Email/password validation
- Loading states
- Persistent login state
- Social login UI (ready for implementation)

### Home Screen
- Welcome message with user name
- Search functionality
- Food category filtering
- Restaurant listings with ratings and delivery times
- Favorite restaurants toggle

### UI Components
- Custom text fields with validation
- Animated category cards
- Restaurant cards with images
- Search bar with filter button
- Social login buttons

## Customization

### Colors
Edit `lib/core/constants/app_colors.dart` to customize the app's color scheme.

### Strings
Edit `lib/core/constants/app_strings.dart` to modify app text content.

### Food Data
Modify `lib/providers/food_provider.dart` to add more categories and restaurants.

## Future Enhancements

- Restaurant detail screens
- Menu items and ordering
- Cart functionality
- Payment integration
- Order tracking
- User profile management
- Push notifications
- Real-time updates

## License

This project is created for demonstration purposes.
