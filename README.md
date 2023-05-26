# androidStudyingProject
laboratory work for the institute

![image](https://github.com/tim8842/androidStudyingProject/assets/79981959/4ecab7fc-7862-42e4-83fe-62f31367fa80)

# Инструкция запуска.

Для запуска приложения необходимо иметь

- Android SDK (если нет физического устройства)
- Android эмулятор или устройство (телефон например pixel5)
- Включенный энтернет

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


  - flutter_svg: ^2.0.4
  - cupertino_icons: ^1.0.2
  - readmore: ^2.1.0
  - dropdown_button2: ^2.0.0
  - datetime_picker_formfield_new: ^2.1.0
  - intl: ^0.18.1
  - country_state_city_picker: ^1.2.8
  - google_maps_flutter: ^2.2.5
  - dio: ^5.0.3
  - html: ^0.15.2
  - custom_sliding_segmented_control: ^1.7.4
  - flutter_map: ^3.1.0
  - geocoding: ^2.1.0
  - tuple: ^2.0.1
  - shared_preferences: ^2.0.20
  - firebase_core: ^2.10.0
  - firebase_auth: ^4.4.2
  - email_validator: ^2.1.17
  - cloud_firestore: ^4.7.1

# AUTH
Можно войти в аккаунт с введя следующие данные, также подключена тестовая база данных, которая перестанет работать через месяц, но ее можно будет если что создать (не тестовую). Так будет работать на постоянной основе:

login: test@gmail.com

password: test123

# Как можно монетизировать?

Можно будет встоить рекламу или сделать приложение платное. Например сделать платную подписку или добавить цену в App store или Google play.

# Как и для чего можно использовать?

Пока что это приложение предназначено для просмотра гороскопа на разные временные промежутки. (мужской и женский только на одинь день)
В некоторые периоды его может и не быть, так как наши эксперты иногда не обладают данными на определенный период.

Как использовать и применять приложение вы можете посмотреть тут
[Руководство пользователя](https://github.com/tim8842/androidStudyingProject/blob/main/USERGUIDE.md)

Если хотите посмотреть видео, то тут
[Видео руководство](https://disk.yandex.ru/i/Bf96y4suPOwqJQ)


# Инструкция по сборке

Для сборки вам понадобится flutter и все необходимые компоненты о которых сказано по ссылке
``` https://docs.flutter.dev/get-started/install/windows ```

Затем вам нужно будет зайти в папку horoscope и прописать
``` flutter build apk ```

апк файл будет установлен по пути
```horoscope\build\app\outputs\flutter-apk\app-release.apk```
