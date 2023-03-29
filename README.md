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
