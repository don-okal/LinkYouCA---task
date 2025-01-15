toDo Management App
This is a task management app built with Flutter, BLoC and Cubit for state management, and Clean Architecture for project structure. The app allows users to manage tasks, add new ones, and delete existing tasks. It also includes local storage functionality using shared_preferences to store tasks offline.

Features
Task Management: Add, edit, and delete tasks.
Swipe to Delete/Edit: Swipe a task from the left to either delete or edit it.
Local Storage: Tasks are saved locally and can be accessed offline.
Real-Time Updates: The app provides real-time task updates using BLoC and Cubit for state management.
Error Handling: Proper error messages are displayed for various scenarios (e.g., server errors, unexpected issues).
Clean Architecture: The app follows Clean Architecture principles, making the code modular and maintainable.
Architecture
The app follows the Clean Architecture pattern, which separates the code into distinct layers:

Presentation Layer: Contains UI components like Widgets and Bloc or Cubit for managing state.
Domain Layer: Contains business logic, UseCases, and entities (e.g., Task).
Data Layer: Contains the data sources (e.g., remote API, local storage) and repositories that provide the data to the domain layer.
State management is handled using BLoC and Cubit, with BLoC managing complex states and Cubit managing simple states for specific tasks.

Installation
Clone the repository:

bash
Copy code
git clone <repository_url>
Install dependencies: Navigate to the project directory and run:

bash
Copy code
flutter pub get
Run the app: You can run the app on an emulator or a physical device:

bash
Copy code
flutter run
Usage
Adding a Task
Tap on the Floating Action Button (FAB) in the bottom-right corner.
Enter the task name and tap Add to save the task.
Deleting or Editing a Task
Swipe left on a task card to reveal the Delete and Edit buttons.
Tap Delete to remove the task, or tap Edit to modify the task (edit functionality can be added as needed).
Refreshing Data
Pull down on the task list to refresh and fetch the latest tasks from the server or local storage.
Local Storage
Tasks are stored in local storage using shared_preferences, allowing the app to work offline. When new tasks are added or existing ones are modified, they are saved to local storage and retrieved when the app is restarted.

Error Handling
The app provides error messages if something goes wrong while fetching tasks or performing other actions.
Server errors will display a message like "Server error: [error message]."
Unexpected errors will display "An unexpected error occurred. Please try again."
Dependencies
flutter_bloc: For state management using the BLoC and Cubit patterns.
shared_preferences: For storing data locally.
dio: For making network requests.
skeletonizer: For skeleton loading indicators.
Contributing
Fork the repository.
Create a new branch (git checkout -b feature/your-feature-name).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature/your-feature-name).
Create a new Pull Request.
