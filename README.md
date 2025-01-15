# MapBox Integration App
Aplikasi berbasis mobile Flutter untuk kebutuhan technical test.

![Frame 5](https://github.com/user-attachments/assets/78c68318-27b4-4157-820f-2ced8f364531)

## Instalasi
1. **Clone repository ini**:  
   Buka terminal dan jalankan perintah berikut:
   ```bash
   git clone <URL_REPOSITORY>

2. **Mengunduh semua dependency**
   ```dependency
   flutter pub get
   ```
3. **Jalankan aplikasi**
   ```dependency
   flutter run
   ```
## Third Party
- `BLoC`: Untuk manajemen state.
- `http`: Untuk melakukan permintaan HTTP ke API.
- `go_router`: Digunakan untuk configurasi routing / navigator.
- `mapbox_maps_flutter`: Digunakan untuk integrasi dengan MapBox.
- `get_it`: Mengelola dependency injection (DI)
- `etc`.

## Struktur Folder
```
lib/
└── app/
    ├── core/
    │   ├── const/
    │   ├── dependency/
    │   ├── utils/
    │   └── etc/
    ├── config/
    │   ├── router/
    │   ├── api_config/
    │   └── etc/
    ├── features/
    │   ├── feature_name/
    │   │   ├── data/
    │   │   │   ├── data_sources/
    │   │   │   ├── models/
    │   │   │   └── repositories/
    │   │   ├── domain/
    │   │   │   ├── entities/
    │   │   │   ├── repositories/
    │   │   │   └── use_case/
    │   │   └── presentation/
    │   │       ├── bloc/
    │   │       ├── pages/
    │   │       └── widgets/
    └── main.dart
```

## Credit
- [Github](https://github.com/dimasjayadi99)
- [Linekdin](https://www.linkedin.com/in/dimasjayadi99/)
