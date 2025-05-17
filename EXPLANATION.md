
**Project Structure Explanation & Library Used**

This project use a modular and scalable architecture using a feature-based approach with a clean separation of concerns. Below is an explanation of each top-level directory under the `lib/` folder:

**config**

Contains global configuration files and constants used throughout the app :
-   App themes
-  App Colors
-   Environment variables

**core**

Holds foundational logic that can be shared across all features :
-   Global Bindings
-   Common utilities or helpers
-   Error handling
-   Base classes
- Network
    
**data**

Responsible for implementing the data layer of the application.
-   DataSource for local and remote
-   Models from API Structure

**domain**

Defines the **business logic** of the app in a framework-agnostic way :
-   Entities (used this for view needed data)
-   Repositories 
-   Usecases
    
----------------**This is the core of Clean Architecture.**-------------

 **features**

Organized by **feature modules**. Each subfolder represents a self-contained feature of the app:

-   **favorites/** – logic and UI for managing favorite movies
-   **home/** – displays the main movie list (now playing, popular, etc.)
-   **movie_detail/** – handles detailed movie information
-   **search/** – movie search functionality
-   **splashscreen/** – splash screen or app intro
    
Each feature module will having structure: 
 - controller
 - view
 - binding class
 - etc (when needed)

**routes**
Centralized routing configuration,

**main.dart**
The entry point of the application. Initializes the app, bindings, theme, and navigation.

----------

**Library used**

- get -> Used for state management and routing
- hive -> Local database for caching
- path_provider -> For accessing device storage
- dio -> HTTP client for network requests
- dio_request_inspector -> For inspecting HTTP requests and responses 
- json_serializable -> For JSON serialization
- json_annotation -> For JSON serialization annotations
- logger -> For better logging
- infinite_scroll_pagination -> For pagination in lists
- cached_network_image -> For caching images
- shimmer -> For loading placeholders
- intl  -> For internationalization and date formatting
- flutter_keyboard_visibility -> For detecting keyboard visibility and used to dismiss keyboard when tapping outside the text field

----------

**Benefits of This Structure**

-   **Scalability**: Easy to grow features without affecting unrelated code.
-   **Separation of Concerns**: Logic, UI, and data are well-separated.
-   **Reusability**: Shared logic is centralized in `core/` and `domain/`.

Why feature-based approach? because when code base is growing that can be "self-documented" code that can be readable for developers and easier collaboration due to each team maybe can have their responsibility folder.