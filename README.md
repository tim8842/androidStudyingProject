# androidStudyingProject
laboratory work for the institute

# Инструкция 

Для запуска приложения необходимо иметь

- Android SDK (если нет физического устройства)
- Android эмулятор или устройство (телефон например pixel5)


Для запуска нужно иметь apk файл.

Он расположен по пути

```horoscope\app-release.apk```

Для запуска приложения нужно запустить эмулятор, перейти в папку в которой у вас установлен Android sdk, далее в папку platform-tools открыть консоль и написать команду
```
adb install <путь до apk файла>
```

После чего следует проверить телефон, у вас должно появится приложение под названием horoscope

Зависимости хранятся в файле 
```horoscope\pubspec.yaml```

Либо вы можете посмотреть их тут:

  flutter_svg: ^2.0.4
  cupertino_icons: ^1.0.2
  readmore: ^2.1.0
  dropdown_button2: ^2.0.0
  datetime_picker_formfield_new: ^2.1.0
  intl: ^0.17.0
  country_state_city_picker: ^1.2.8
  google_maps_flutter: ^2.2.5
  dio: ^5.0.3
  html: ^0.15.2
  custom_sliding_segmented_control: ^1.7.4
  flutter_map: ^3.1.0
  geocoding: ^2.1.0
  tuple: ^2.0.1
  shared_preferences: ^2.0.20
  firebase_core: ^2.10.0
  firebase_auth: ^4.4.2
  email_validator: ^2.1.17

# AUTH
Можно войти в аккаунт с введя следующие данные:

login: test@gmail.com

password: test123

