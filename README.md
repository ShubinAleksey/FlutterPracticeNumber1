# Практическая работа № 5
## Тема: SharedPreferences

#### Цель работы: реализовать экран с редактируемым блоком для передачи и сохранения данных через SharedPreferences. Реализовать сохранение темы приложения Cubit с помощью SharedPreferences. Возвращать данные экрана при закрытии и повторном открытии приложения.

#### Ход работы:

1) Сперва необходимо подключить в pubspec.yaml библиотеку shared_preferences и flutter_bloc. Первым делом создадим cubit и state для смены темы приложения. Принцип работы создания темы схож с практической работы номер 4.

![ThemeMode](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/pract5_ThemMode.png "ThemeMode")

![ThemeState](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/pract5_ThemeState.png "ThemeState")

2) Далее создадим второй экран приложения для передачи данных через SharedPreferences

![Screen2](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/pract5_Screen2.png "Screen2")

3) Теперь как по принципу 4 работы, на уровне MyApp создается BlocBuilder с подвязкой Cubit с темами. Но теперь с подключением метода SharedPreferences на булевых значениям. Чтобы при нажатии floatingActionButton проверялось, какая тема стоит на приложении и потом возвращает конкретный булевый тип (true/false), так будет сохраняться значение

![ThemeCool](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/pract5_ThemeCool.png "ThemeCool")

4) Теперь настраивается EditTextController. Он работает на геттерах-сеттерах, при загрузке приложения вызывает метод гет, который записался локально у SharedPreferences. При сеттере отправляет запись у SharedPreferences

![EdtText](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/pract5_TextCool.png "EdtText")

5) Далее идет представление, которое перебрасывает на 2 экран приложения, принимает в себя метод на сеттер SharedPrefferences. А у кнопки, как говорилось в 3 пункте изменяет булевое значение и меняет тему приложения

![MoveChange](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/pract5_ChangeAndMove.png "MoveChange")
#### Результат работы:

![1Screen](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/1screen.jpg "1Screen")

![2Screen](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice5/assets/2screen.jpg "2Screen")

#### Вывод: в ходе выполнения практической работы были получены навыки по реализации экрана с редактируемым блоком для передачи и сохранения данных через SharedPreferences. Реализовал сохранение темы приложения Cubit с помощью SharedPreferences. Возвращал данные экрана при закрытии и повторном открытии приложения.