# 📝 Notes App

A clean, modern, and efficient notes-taking application built with Flutter. This app focuses on a smooth user experience, utilizing local storage for offline access and reactive state management.

---

## 🔎 Overview

The **Notes App** is designed to help users capture their thoughts instantly. By using **Hive**, the app ensures that your data is stored locally with lightning-fast performance. The architecture follows the **BLoC/Cubit** pattern, ensuring a clear separation between the UI and business logic, making the app scalable and easy to maintain.

---

## ✨ Key Features

* **Local Persistence:** Powered by **Hive**, allowing users to save, read, edit and delete notes without an internet connection.
* **Reactive State Management:** Uses **Cubit** to handle states efficiently (Loading, Success, Empty, and Error states).
* **Interactive Animations:**
* **Swipe-to-Delete:** Implemented with smooth animations to enhance the user experience when removing notes.
* **Custom UI:** A clean, minimalist design with custom fonts and colors.

---

## 📱 Demo & Showcase

Check out the app in action:

> [🎬 Watch the App Demo Video here](YOUR_DRIVE_LINK_HERE)

---

## 🛠 Technologies Used

The app leverages the following tools and libraries:

| Category | Technology |
| :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev/) |
| **State Management** | [Bloc / Cubit](https://pub.dev/packages/flutter_bloc) |
| **Database** | [Hive](https://pub.dev/packages/hive) (NoSQL Local Storage) |
| **Code Generation** | [Build Runner](https://pub.dev/packages/build_runner) & [Hive Generator](https://pub.dev/packages/hive_generator) |
| **Animations** | Flutter Animation Library (Dismissible) |

---

## 🚀 Getting Started

To get a local copy up and running, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone [https://github.com/your-username/notes-app.git](https://drive.google.com/file/d/1IHj9G1KxogIVPm3930GVnuhTaKaelpic/view?usp=sharing)
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run Code Generation:**
    (Since the app uses Hive TypeAdapters, run this to generate `.g.dart` files)

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

---
