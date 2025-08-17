# 🎬 MovieApp

A Flutter application built with **Domain-Driven Design (DDD)** architecture, integrating with [TMDB API](https://www.themoviedb.org/) to browse and search movies.

## 🚀 Features
- Splash screen with app branding
- Search movies by title
- Display movie details (release date, rating, description, votes)
- Clean architecture with **DDD pattern**
- State management using **BLoC**

## 📂 Project Structure

```
lib/
│ main.dart                     # Entry point
│
├───application                 # Global app configuration
│   ├── app.dart
│   └── routes.dart
│
├───core                        # Shared modules
│   ├───error
│   │   └── server-exception.dart
│   ├───networks
│   ├───storage
│   └───utils
│
└───features
    ├───movie
    │   ├───data
    │   │   ├───datasource
    │   │   │   └── movie-datasource.dart
    │   │   └───repository
    │   │       └── movies-repository-impl.dart
    │   │
    │   ├───domain
    │   │   ├───entities
    │   │   │   └── movie.dart
    │   │   ├───repository
    │   │   │   └── movie-repository.dart
    │   │   └───usecase
    │   │       ├── get_movies.dart
    │   │       └── search_movies.dart
    │   │
    │   └───presentation
    │       ├───bloc
    │       │   ├── movie-bloc.dart
    │       │   ├── movies-event.dart
    │       │   └── movies-state.dart
    │       ├───pages
    │       │   └── movies-page.dart
    │       └───widgets
    │           ├── movie-item.dart
    │           └── search-movie.dart
    │
    └───splash
        ├───data
        ├───domain
        └───presentation
            ├───bloc
            ├───pages
            │   └── splash-page.dart
            └───widgets
```

## 🏗️ DDD Layers Explained

### 📱 Presentation Layer
- Handles UI & state management
- Components:
  - `bloc/` - State management (events, states, blocs)
  - `pages/` - Screens (`MoviesPage`, `SplashPage`)
  - `widgets/` - UI components (`MovieItem`, `SearchMovie`)

### 🧠 Domain Layer
- Pure business logic without external dependencies
- Components:
  - `entities/` - Core business models (`Movie`)
  - `repository/` - Abstract contracts
  - `usecase/` - Application-specific logic (`GetMovies`, `SearchMovies`)

### 💾 Data Layer
- Responsible for fetching raw data (from API, DB, etc.)
- Components:
  - `datasource/` - API & local storage
  - `repository-impl/` - Implements domain repositories

## 🛠️ Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/movieapp-ddd.git
   cd movieapp-ddd
   ```

2. Get dependencies:
   ```sh
   flutter pub get
   ```

3. Add your TMDB API key in the configuration file

4. Run the app:
   ```sh
   flutter run
   ```

## 📚 Tech Stack

- **Flutter** - UI Framework
- **BLoC** - State Management
- **DDD** - Architecture Pattern
- **TMDB API** - Movie Data Source

## 📸 Screenshots

![Movie Home Screen](https://raw.githubusercontent.com/AmineNaboulsi/flutter-movie-app-dddd-tmdb/refs/heads/develop/assets/screenshots/Screenshot%201.png)
![Movie Details Screen](https://raw.githubusercontent.com/AmineNaboulsi/flutter-movie-app-dddd-tmdb/refs/heads/develop/assets/screenshots/Screenshot%202.png)
