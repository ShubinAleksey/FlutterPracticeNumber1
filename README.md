# Практическая работа № 2
## Тема: Инициализация работы базы данных для магазина одежды

#### Цель работы: научиться инициализровать базу данных, разработать модели и запросы для информационной системы магазина одежды.

#### Ход работы:

1) Создание класса для написания запросов по созданию таблиц
![DBRequest](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_DBrequest.png "DBRequest")

![DBRequest2](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_DBrequest2.png "DBRequest2")

2) Инициализация базы данных с созданием различных процедур (init, update, create, drop)

![DBHelper](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_DBHelper.png "DBHelper")

![DBHelper2](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_DBHelper2.png "DBHelper2")

![DBHelper3](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_DBHelper3.png "DBHelper3")

3) Создаём модели базы данных, в качестве примера была взята таблица "Заказ"

В модели присутствуют сущности такие как: наименование заказа, наименование товара и его цена

![OrderEntity](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_OrderEntity.png "OrderEntity")

4) Создаём класс для отображения данных из базы данных. Они проходят парсировку в JSON и обратно. В качестве примера была взята таблица "Заказ"

![OrderModel](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_OrderModel.png "OrderModel")

5) Проверим заполнение таблиц через приложение Android Studio и библиотекой DB Navigator

![tableRole](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_tableRole.png "tableRole")

![tableSizeTovar](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_SizeTovar.png "tableSizeTovar")

![tableColorTovar](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_tableColorTovar.png "tableColorTovar")

![tableTypeTovar](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_tableTypeTovar.png "tableTypeTovar")

#### Вывод: в ходе выполнения практической работы были получены навыки по инициализации базы данных, создании моделей, запросов. Создание класса-хелпера который манипулируют с сущностябми таблиц и самой базы данных.
