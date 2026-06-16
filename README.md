# MomCare - Teacher & Family Companion

## Overview

MomCare is a beautiful, practical, and heartfelt Flutter application designed specifically for busy teachers and mothers. This app is a special birthday gift that combines everyday productivity tools with precious family memories.

## ✨ Features

### 📋 Daily Planner
- Add, edit, delete tasks
- Daily, weekly, and monthly views
- Task priorities (Low, Medium, High)
- Reminder notifications
- Recurring tasks support

### 🛒 Smart Shopping List
- Organized by categories
- Check-off purchased items
- Search functionality
- Frequently bought items
- Voice input support

### 📸 Family Memory Vault
- Photo albums with captions and dates
- Memory timeline
- Birthday and anniversary reminders
- Family messages section
- Favorite memories collection

### 💰 Household Expense Tracker
- Track income and expenses
- Monthly budget planning
- Spending categories
- Savings goals
- Beautiful pie charts and graphs
- PDF export functionality

### 👨‍🏫 Teacher Toolkit
- **Class Management**: Store class-wise student lists
- **Attendance Tracker**: Track daily attendance
- **Homework Manager**: Create and track assignments
- **Lesson Planner**: Plan daily and weekly lessons
- **Exam & Test Manager**: Record marks and calculate grades
- **Timetable Manager**: School schedule and class reminders
- **School Events**: PTA meetings, exams, holidays

### ❤️ Personal Section "From Aadityaa"
- Personal letter from son
- Favorite family photos
- Birthday wishes
- Special appreciation message

## 🎨 Design

### Color Palette
- **Primary**: Soft Lavender (#B19CD9)
- **Secondary**: Soft Pink (#FFB6D9)
- **Tertiary**: Light Blue (#A0D8F7)
- **Accent**: Cream (#FFF5E1)

### Design Features
- Material Design 3
- Large, readable fonts (Poppins)
- Smooth animations
- Dark mode and light mode support
- Mobile-first responsive UI
- Beautiful gradients and card designs

## 🛠️ Technical Stack

- **Framework**: Flutter 3.0+
- **Language**: Dart 3.0+
- **State Management**: Riverpod
- **Database**: SQLite with local persistence
- **UI**: Material Design 3 with Google Fonts
- **Charts**: FL Charts
- **Notifications**: Flutter Local Notifications
- **Voice**: Speech to Text
- **Image Handling**: Image Picker
- **PDF**: PDF generation and printing

## 📁 Project Structure

```
momcare-app/
├── lib/
│   ├── main.dart
│   ├── config/
│   │   └── theme/
│   │       ├── app_colors.dart
│   │       └── app_theme.dart
│   ├── services/
│   │   ├── database/
│   │   │   ├── database_service.dart
│   │   │   └── database_schema.dart
│   │   └── notification/
│   │       └── notification_service.dart
│   ├── models/
│   │   ├── task_model.dart
│   │   ├── shopping_item_model.dart
│   │   ├── family_memory_model.dart
│   │   ├── expense_model.dart
│   │   ├── class_model.dart
│   │   └── student_model.dart
│   └── presentation/
│       └── screens/
│           ├── home/
│           │   └── home_screen.dart
│           ├── planner/
│           │   └── planner_screen.dart
│           ├── shopping/
│           │   └── shopping_screen.dart
│           ├── memories/
│           │   └── memories_screen.dart
│           ├── expenses/
│           │   └── expenses_screen.dart
│           ├── teacher_toolkit/
│           │   └── teacher_toolkit_screen.dart
│           └── personal/
│               └── personal_section_screen.dart
├── pubspec.yaml
└── README.md
```

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart 3.0 or higher
- Android Studio / Xcode (for running on emulator/device)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AadityaaKumar/momcare-app.git
   cd momcare-app
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running on Different Platforms

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

## 🗄️ Database Schema

The app uses SQLite with the following tables:

- **tasks**: Daily tasks with priorities and reminders
- **shopping_list**: Shopping items organized by category
- **family_memories**: Photos and memories with dates
- **expenses**: Income and expense tracking
- **classes**: Teacher's classes and sections
- **students**: Student information and contact details
- **attendance**: Daily attendance records
- **homework**: Assignment tracking
- **lessons**: Lesson plans and notes
- **marks**: Student grades and exam results
- **timetable**: Weekly class schedule
- **school_events**: School calendar events

## ✨ Key Features Highlights

### 🌙 Dark Mode
Beautiful dark theme that's easy on the eyes, perfect for evening use.

### 📱 Offline Support
Most features work offline. Data syncs when connection is available.

### 🔒 Security
- PIN protection available
- Fingerprint authentication support
- Secure local database

### 📊 Analytics
- Monthly expense reports
- Task completion statistics
- Student performance tracking

### 🔔 Smart Notifications
- Task reminders
- Birthday/Anniversary alerts
- Homework deadlines

## 🏠 Home Dashboard

The home screen displays:
- Welcome greeting
- Today's task count
- Active classes
- Shopping reminders
- Monthly expenses overview
- Recent family memories
- Quick access buttons
- Motivational quotes

## 🎨 Customization

All colors, fonts, and UI elements can be easily customized through:
- `lib/config/theme/app_colors.dart` - Color palette
- `lib/config/theme/app_theme.dart` - Theme configuration

## 🔮 Future Enhancements

- Cloud backup and restore
- Family member sharing
- Advanced analytics
- Voice assistant integration
- Calendar synchronization
- Social sharing features
- Multi-language support

## 📝 Contributing

Contributions are welcome! Please follow the existing code style and structure.

## 📄 License

This project is licensed under the MIT License.

## 📞 Support

For issues, feature requests, or general questions, please open an issue on GitHub.

---

**Made with ❤️ by Aadityaa for Mom**

## Screenshots & Mockups

The app features:
- **Elegant Dashboard**: Warm welcome with task overview
- **Task Management**: Beautiful task cards with priorities
- **Shopping List**: Organized items with categories
- **Expense Tracker**: Visual pie charts and summaries
- **Teacher Toolkit**: Comprehensive class management
- **Personal Section**: Heartfelt messages and photos
- **Dark & Light Modes**: Eye-friendly themes

## Getting Started for Developers

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Clone this repo
3. Run `flutter pub get`
4. Run `flutter run`

## Notes

- The app is designed with accessibility in mind
- Large, readable fonts (16pt+) for easy viewing
- High contrast colors for better visibility
- Simple navigation for intuitive usage
- Focuses on user experience and ease of use

Enjoy using MomCare! 🎁
