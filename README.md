# ⚽ Football App

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Firestore%20%7C%20Auth%20%7C%20Storage-FFCA28?logo=firebase&logoColor=black)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey)
![FlutterFlow](https://img.shields.io/badge/Built%20with-FlutterFlow-7C4DFF)
![License](https://img.shields.io/badge/License-Private-red)

A full-featured **Flutter** mobile application for managing football teams, matches, and community. Built with **FlutterFlow** and powered by **Firebase**, the app provides a unified platform for players, team managers, and fans to stay connected, track game stats, shop for gear, and more.

---

## Features

### Authentication
- Email/password sign-up and login
- Google Sign-In and Sign in with Apple
- Firebase Authentication integration

### Team Management
- Create, edit, and browse football teams
- View detailed team profiles and rosters

### Game & Match Center
- Schedule and create matches
- View match details and update scores
- Track player and team statistics
- Interactive calendar for upcoming fixtures

### Chat
- Real-time messaging between users
- Update and manage chat conversations

### Shop
- Browse and purchase football products
- Admin panel for managing product listings and updates
- Shopping cart and order management

### Feedback System
- Submit and view community feedback
- Admin moderation and response tools
- Feedback statistics dashboard
- Personal feedback history

### User Profiles
- User registration and profile management
- Profile image upload via Firebase Storage

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| Backend | Firebase (Firestore, Auth, Storage) |
| State Management | Provider + AppState |
| Navigation | go_router |
| Charts | fl_chart |
| UI Builder | FlutterFlow |
| Fonts | Google Fonts |
| Media | video_player, image_picker, cached_network_image |
| Animations | flutter_animate, Rive |

---

## Project Structure

```
lib/
├── auth/           # Authentication logic and providers
├── backend/        # Firestore schema, API requests, Firebase helpers
├── cart/           # Shopping cart and orders
├── chat/           # Real-time chat screens
├── components/     # Reusable UI widgets (drawer, dialogs, etc.)
├── feedback/       # Feedback submission, admin, and stats
├── flutter_flow/   # FlutterFlow utilities and theme
├── game/           # Match creation, details, stats, calendar
├── shop/           # Shop listing, admin panel, product updates
├── team/           # Team creation, editing, and listing
├── team_pages/     # Team-specific views
├── user/           # Login, sign-up, and profile screens
├── app_state.dart  # Global app state
└── main.dart       # Entry point
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel, `>=3.0.0`)
- [Firebase CLI](https://firebase.google.com/docs/cli) configured for your project
- Android Studio / Xcode for device emulation

### Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd MobileApp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Place your `google-services.json` in `android/app/`
   - Place your `GoogleService-Info.plist` in `ios/Runner/`

4. **Run the app**
   ```bash
   flutter run
   ```

### Build

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web
```

---

## Firebase Services Used

- **Cloud Firestore** — Real-time database for teams, matches, chats, shop, and feedback
- **Firebase Auth** — User authentication (Email, Google, Apple)
- **Firebase Storage** — Profile images and product media
- **Firebase Performance** — App performance monitoring
- **Cloud Functions** — Server-side API logic (`firebase/functions/`)

---

> This is a private project. Redistribution or reuse of source code requires explicit permission.
