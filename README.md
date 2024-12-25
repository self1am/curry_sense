# CurrySense

CurrySense is a mobile application designed to assist visually impaired individuals in identifying dishes and accessing relevant information about them. By leveraging cutting-edge machine learning models for image recognition, this app provides an accessible way for users to recognize meals and make informed dining choices. The application is built using cross-platform frameworks for seamless operation on both Android and iOS devices.

## Features

- **Dish Recognition**: Uses a trained machine learning model to identify dishes from captured images.
- **Accessible Interface**: Designed with visually impaired users in mind, featuring voice-guided navigation and screen reader compatibility.
- **Relevant Information**: Provides additional details about the identified dish, such as ingredients, nutritional information, and possible allergens.
- **Cross-Platform**: Built using Flutter for compatibility with both Android and iOS.

## Technology Stack

- **Frontend Framework**: Flutter (Dart) 
- **Machine Learning Model**: TensorFlow Lite or Firebase ML Kit for on-device inference
- **Backend**: Firebase or Node.js for managing data and user interactions
- **Cloud Storage**: Firebase Storage or AWS S3 for storing images and model files
- **Database**: Firebase Firestore or MongoDB for storing user preferences and historical data

## Installation

### Prerequisites
- Flutter SDK or Node.js (depending on the selected framework)
- Android Studio and/or Xcode for emulators
- Visual Studio Code or your preferred IDE
- Dart (for Flutter) or JavaScript (for React Native)
- Firebase account for integration

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/self1am/curry_sense.git
.git
   ```
2. Navigate to the project directory:
   ```bash
   cd curry_sense

   ```
3. Install dependencies:
   - For Flutter:
     ```bash
     flutter pub get
     ```

4. Set up Firebase:
   - Add your Firebase configuration file (`google-services.json` for Android or `GoogleService-Info.plist` for iOS) to the appropriate directories.
5. Run the application:
   - For Flutter:
     ```bash
     flutter run
     ```

## Usage

1. Open the app and grant necessary permissions (camera and storage).
2. Use the voice navigation feature to capture an image of the dish.
3. Wait for the app to identify the dish and provide detailed information audibly or on the screen.
4. Access the history tab to view previously identified dishes.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork this repository.
2. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature description"
   ```
4. Push to your branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For questions or suggestions, please contact:
- **Hanafe Mira**
- Email: hanafe.mira@example.com
- GitHub: [https://github.com/hanafemira](https://github.com/hanafemira)

