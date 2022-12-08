# Практическая работа № 4
## Тема: Система-счетчик на Cubit

#### Цель работы: реализовать счетчик и смену темы с использованием библиотеки flutter bloc/cubit. Производить запись действий в ListView. Менять значения count счетчика в зависимости от темы приложения.

#### Ход работы:

1) Сперва необходимо подключить в pubspec.yaml библиотеку flutter_bloc, после этого создать папку cubit и создать класс в котором будут хранится главные методы запроса на реализации счетчика и темы. Для счетчика брался параметр с типом int, для смены темы ThemeMode, а для истории создавалась коллекция List на типе String. На фотографиях ниже представлены методы Cubit (инкримент, дикримент, смена темы)

![increment](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/practice4_inc.png "increment")

![decriment](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/pract4_dec.png "decriment")

![theme](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/pract4_theme.png "theme")

2) Также создавался класс State для Cubit, чтобы создать конструктор для переменных.

![CubitState](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/pract4_state.png "CubitState")

3) Дальше создаются представление для приложения, изначально есть Text-овое поле на объекте BlocBuilder который передает в данный текст, значение count. А дальше есть 2 кнопки, которые отвечают за два метода Cubit - инкримент и дикремент. В обоих методах стоит условие от темы приложения, если тема светлая, то инкримент и дикримент будут изменять своё значение на 1, если темное, то на 2.

![CountIncDec](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/pract4_windIncPred.png "CountIncDec")

4) Теперь создается еще один BlocBuilder который работает с ListView. В данном случае, у ListView добавлются значения от того, что было добавлено в коллекцию. В самом файле Cubit в каждом методе записывается запись в коллекцию, что произошло и когда это произошло. Также присутсвует кнопка которая вызывает метод из Cubit по смене темы в приложении.

![ListView](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/pract4_listTheme.png "ListView")
#### Результат работы:

![Result](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice4/assets/pract4_result.png "Result")

#### Вывод: в ходе выполнения практической работы были получены навыки по реализации счетчика и смены темы с использованием библиотеки flutter bloc/cubit. Производил запись действий в ListView. Менял значения count счетчика в зависимости от темы приложения.