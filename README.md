# News App
## Description
News App is a Flutter application designed to provide users with up-to-date news articles. The app integrates with a public News API to fetch and display news headlines, thumbnails, and descriptions. It includes features like navigation to view full article content, error handling, basic API caching, and is built with a focus on clean architecture and advanced UI/UX enhancements.

### Features
User Interface:

#### Displays news articles with headlines, thumbnails, and descriptions.
Navigation to view full article content.
Basic error handling to manage network and API failures.

#### API Integration:
Utilizes NewsAPI to fetch news data.
Handles API requests and responses, with proper error handling.

#### Error Handling:
Gracefully manages network errors and API failures.
Displays informative error messages to users.

#### Code Optimization:
Efficient and performant code implementation.

#### API Caching:
Basic caching to improve performance and handle offline scenarios.

#### Testing:
Includes basic unit and widget tests to ensure functionality.

#### Advanced UI/UX:
Additional UI/UX enhancements beyond basic requirements.

#### Clean Architecture:
Thoughtful separation of concerns and use of design patterns for maintainability.
Installation

Clone the repository:
bash
git clone https://github.com/yourusername/news_app.git

Navigate into the project directory:
bash
cd news_app

Install dependencies:
bash
flutter pub get

Run the app:
bash
flutter run
Configuration
To use the NewsAPI, replace the apiKey in the lib/services/news_services.dart file with your own API key from NewsAPI.

Screenshots
![IMG_20240905_093629](https://github.com/user-attachments/assets/7891cd68-4988-48d9-a0ac-550fd0a343af)
![Screenshot_2024-09-05-09-34-56-61_a467d51f7ea0378ee50edb6aac94ed60](https://github.com/user-attachments/assets/0d8e10ea-95f7-4566-902e-a5934a4e1cd8)
![Screenshot_2024-09-05-09-34-59-39_a467d51f7ea0378ee50edb6aac94ed60](https://github.com/user-attachments/assets/65d757b2-c5b5-49a9-8ff3-54cc16def8f4)
![Screenshot_2024-09-05-09-35-10-22_a467d51f7ea0378ee50edb6aac94ed60](https://github.com/user-attachments/assets/6b8e11ca-7d29-4c70-b0bb-91204fde8b58)

License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
NewsAPI for providing the news data.
Flutter community for excellent documentation and support.
