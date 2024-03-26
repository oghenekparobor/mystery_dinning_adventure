# mystery_dinning_adventure

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Project Setup
- Click on the code button to see the repo link
- Open your terminal and run ``` git clone https://github.com/oghenekparobor/mystery_dinning_adventure.git ```
- Change to the flutter project ```cd mystery_dinning_adventure ```
- Install the flutter plugins ```flutter pub get```
- Run this command to create the .env file ``` echo "BaseUrl=https://api.yelp.com" >> .env && echo "Key={Your YELP Key goes here}" >> .env ```
- Please check the .env file to see that everything is in order before running the below command
- Get all generated classes ```dart run build_runner build --delete-conflicting-outputs```
- We either you physical device connected or an emulator run the project ```flutter run```

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