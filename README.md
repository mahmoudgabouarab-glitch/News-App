# 📰 News App

A modern, production-ready Flutter news application built with **Clean Architecture**, **Riverpod**, and **Hive** for offline-first experience.

---

## ✨ Features

- 🗞️ Browse latest news by category
- 🔍 Search articles with keyword highlighting
- 🔖 Save articles to favorites (offline, via Hive)
- 📍 Location-aware news (via Geolocator)
- 🌐 Open full articles in browser
- 📤 Share articles with friends
- 🖼️ Optimized image loading with caching
- 📱 Fully responsive UI using ScreenUtil

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| State Management | `flutter_riverpod ^3.3.1` |
| Networking | `dio ^5.9.2` + `pretty_dio_logger` |
| Local Storage | `hive_flutter ^1.1.0` |
| Preferences | `shared_preferences ^2.5.5` |
| Image Caching | `cached_network_image ^3.4.1` |
| UI Scaling | `flutter_screenutil ^5.9.3` |
| Functional Programming | `dartz ^0.10.1` |
| Models | `equatable ^2.0.8` |
| Location | `geolocator ^14.0.2` |
| Share | `share_plus ^12.0.2` |
| URL Handling | `url_launcher ^6.3.2` |
| Date Formatting | `intl ^0.20.2` |

---

## 🏗️ Architecture

This project follows **Clean Architecture** with (MVVM):

```
lib/
├── core/
│   ├── network/          # Dio client, interceptors
│   ├── errors/            # Failures & exceptions
│   ├── utils/            # Constants, helpers
│   └── widgets/          # Share Widgets   
│
├── features/
│   └── news/
│       ├── data/
│       │   ├── models/       # JSON models (Equatable)
│       │   └── repo/ # Abstract repository contracts & Repository implementations
│       │
│       └── presentation/
│           ├── ViewModel/    # Riverpod providers & notifiers
│           └── view/      # UI screens & Reusable widgets
|
|
├── News App
└── main.dart
```

---

## 📸 Screenshots

# Home 

<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/b7d6ae39-3624-4631-9cb5-7cdc2df90d44" />

# Details

<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/4e7679c4-3267-4947-ae1c-08b52cc280bd" />

# Search 

<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/5bf79959-c14d-4242-93f1-8b4540200a3a" />

# Drawer

<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/683aa7b5-8197-4853-83dc-fb5cd933dfc9" />

# Favorite

<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/af8f7788-30f8-4d82-8240-b515c15a3fbb" />

# Light Mode

<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/7f0b0fd0-203c-472f-8c3e-9b2b401726cf" />
