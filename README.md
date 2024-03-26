# Mystery Dining Adventure

## Overview

Welcome to Mystery Dining Adventure! This Flutter project aims to provide users with an exciting and suspenseful dining experience by leveraging the Yelp API to select and recommend dining spots based on user preferences.

## Getting Started

### Project Setup

Follow these steps to set up the project:

1. Click on the code button to see the repository link.
2. Open your terminal and run the following command to clone the repository:
    ```bash
    git clone https://github.com/oghenekparobor/mystery_dinning_adventure.git
    ```
3. Change to the flutter project directory:
    ```bash
    cd mystery_dinning_adventure
    ```
4. Install the Flutter plugins:
    ```bash
    flutter pub get
    ```
5. Run this command to create the `.env` file with your Yelp API credentials:
    ```bash
    echo "BaseUrl=https://api.yelp.com" >> .env && echo "Key={Your Yelp API Key goes here}" >> .env
    ```
    Replace `{Your Yelp API Key goes here}` with your actual Yelp API key.
6. Check the `.env` file to ensure that everything is in order before proceeding.
7. Generate all required classes:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
8. Connect a physical device or start an emulator, and run the project:
    ```bash
    flutter run
    ```

### Feature Overview

#### Mystery Search

Users input their dining preferences, and the app selects the best match based on the Yelp Fusion-powered system. The preferences are customizable, allowing users to specify categories and other preferences inside the power preference.

#### Culinary Roulette

This interactive feature suggests a restaurant to the user at random using an actual roulette filled with the best matches based on their preferences and location. Users have the option to spin the wheel again or accept the recommendation.

#### Adventure Log

Powered by SQLite technology, users can keep track of their adventurous dining experiences locally. They can provide reviews and ratings for each session, with logs stored only on their devices.

### Packages

This project was built using Clean Architecture and relies on the following packages:

1. `roulette`: Used to present businesses in an actual roulette that can be spun.
2. `Animate Do`: Provides animation effects.
3. `location`: Retrieves the user's device location.
4. `Location Picker Flutter Map`: A map for searching and selecting locations.

### Project Instructions

#### Core Features

1. **Mystery Search**: Users input their preferences, and the app selects a dining spot for them, revealing it in an engaging and suspenseful manner.
2. **Culinary Roulette**: An interactive feature allowing users to spin a wheel for random restaurant suggestions, based on their location and preferences.
3. **Adventure Log**: Users can track their mystery dining experiences, including writing reviews and rating the surprise factor.

#### Using the Yelp API

The Yelp Fusion api was mainly used to get categories Yelp Fusion works with and provide the business based on some query command.



```
mystery_dinning_adventure
├─ .gitignore
├─ .metadata
├─ README.md
├─ analysis_options.yaml
├─ android
├─ assets
│  ├─ animations
│  │  ├─ drumming.json
│  │  ├─ empty.json
│  │  ├─ search.json
│  │  └─ splash.json
│  └─ images
│     ├─ find_restaurant.png
│     └─ map_background.png
├─ lib
│  ├─ core
│  │  ├─ __extension_export.dart
│  │  ├─ __network_export.dart
│  │  ├─ __resources_export.dart
│  │  ├─ app_core.dart
│  │  ├─ app_strings.dart
│  │  ├─ database
│  │  │  └─ database.dart
│  │  ├─ env
│  │  │  ├─ env.dart
│  │  │  └─ env.g.dart
│  │  ├─ extension
│  │  │  ├─ context.dart
│  │  │  ├─ state.dart
│  │  │  ├─ string.dart
│  │  │  └─ widget.dart
│  │  ├─ logger
│  │  │  └─ app_logger.dart
│  │  ├─ network
│  │  │  ├─ dio_wrapper.dart
│  │  │  ├─ impl.dart
│  │  │  ├─ network_info.dart
│  │  │  └─ state.dart
│  │  ├─ params
│  │  │  ├─ .gitkeep
│  │  │  └─ business.dart
│  │  ├─ resources
│  │  │  ├─ .gitkeep
│  │  │  ├─ loader.dart
│  │  │  ├─ notification.dart
│  │  │  ├─ notification_wrapper.dart
│  │  │  └─ primary_button.dart
│  │  ├─ routes
│  │  │  ├─ .gitkeep
│  │  │  └─ route.dart
│  │  ├─ service_locator
│  │  │  ├─ injection_container.config.dart
│  │  │  ├─ injection_container.dart
│  │  │  └─ register_module.dart
│  │  ├─ storage
│  │  │  └─ storage.dart
│  │  ├─ theme
│  │  │  ├─ .gitkeep
│  │  │  └─ theme.dart
│  │  └─ usecase
│  │     └─ usecase.dart
│  ├─ data
│  │  ├─ datasources
│  │  │  ├─ local
│  │  │  │  ├─ .gitkeep
│  │  │  │  └─ local.dart
│  │  │  └─ remote
│  │  │     ├─ .gitkeep
│  │  │     └─ remote.dart
│  │  ├─ models
│  │  │  ├─ .gitkeep
│  │  │  ├─ attribute.dart
│  │  │  ├─ category.dart
│  │  │  ├─ coordinate.dart
│  │  │  ├─ location.dart
│  │  │  └─ restaurant.dart
│  │  └─ repositories
│  │     ├─ .gitkeep
│  │     └─ repo_impl.dart
│  ├─ domain
│  │  ├─ entities
│  │  │  ├─ .gitkeep
│  │  │  ├─ attribute.dart
│  │  │  ├─ business.dart
│  │  │  ├─ category.dart
│  │  │  ├─ coordinate.dart
│  │  │  └─ location.dart
│  │  ├─ repositories
│  │  │  ├─ .gitkeep
│  │  │  └─ repo.dart
│  │  └─ usecases
│  │     ├─ .gitkeep
│  │     ├─ businesses.dart
│  │     ├─ categories.dart
│  │     ├─ location.dart
│  │     └─ log.dart
│  ├─ main.dart
│  └─ presentation
│     ├─ notifier
│     │  ├─ .gitkeep
│     │  └─ notifier.dart
│     ├─ pages
│     │  ├─ .gitkeep
│     │  ├─ diner
│     │  │  ├─ dinning_preference.dart
│     │  │  ├─ reveal.dart
│     │  │  ├─ roullete.dart
│     │  │  ├─ see_restaurant.dart
│     │  │  └─ select_reveal.dart
│     │  ├─ home
│     │  │  └─ home.dart
│     │  ├─ location
│     │  │  └─ location.dart
│     │  └─ splash.dart
│     └─ widgets
│        ├─ .gitkeep
│        ├─ arrow.dart
│        ├─ category_chip.dart
│        ├─ change_location.dart
│        ├─ date.dart
│        ├─ diner_tile.dart
│        ├─ leave_a_review.dart
│        ├─ price.dart
│        ├─ radius.dart
│        ├─ review.item.dart
│        └─ title_content.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ test
│  ├─ core
│  │  ├─ error
│  │  │  └─ .gitkeep
│  │  ├─ params
│  │  │  └─ .gitkeep
│  │  ├─ resources
│  │  │  └─ .gitkeep
│  │  ├─ routes
│  │  │  └─ .gitkeep
│  │  ├─ theme
│  │  │  └─ .gitkeep
│  │  └─ usecase
│  │     └─ .gitkeep
│  ├─ data
│  │  ├─ datasources
│  │  │  ├─ local
│  │  │  │  └─ .gitkeep
│  │  │  └─ remote
│  │  │     └─ .gitkeep
│  │  ├─ models
│  │  │  └─ .gitkeep
│  │  └─ repositories
│  │     └─ .gitkeep
│  ├─ domain
│  │  ├─ entities
│  │  │  └─ .gitkeep
│  │  ├─ repositories
│  │  │  └─ .gitkeep
│  │  └─ usecases
│  │     └─ .gitkeep
│  ├─ presentation
│  │  ├─ blocs
│  │  │  └─ .gitkeep
│  │  ├─ pages
│  │  │  └─ .gitkeep
│  │  └─ widgets
│  │     └─ .gitkeep
│  └─ widget_test.dart

```