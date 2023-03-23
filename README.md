# Практическая работа №7
## Тема: создание приложения flutter с использованием API
### Цель работы: познакомиться с пакетом Freezed, Dio, Interceptor. Создать приложение, используя созданное API с практической работы №6.
Ход работы: 
Необходимые функции к реализации:
1.	Авторизация через API
2.	Выгрузка данных через API
3.	Редактирование профиля
4.	Логическое физическое удаление
5.	Поиск
6.	Добавление данных
7.	Редактирование данных
8.	Фильтрация
9.	Использовать следующие пакеты bloc/cubit, freezed, 
10.	Использовать interceptor

Freezed - это пакет для генерации кода, который помогает создавать и генерировать классы данных в Dart.

Dio - это мощный HTTP-клиент для Dart / Flutter, который поддерживает глобальную конфигурацию, перехватчики, FormData, отмену запроса, загрузку файлов, тайм-аут, пользовательские адаптеры и т.д.

Interceptor - это плагин, который позволяет перехватывать различные запросы и ответы из http-пакета Dart.

1) Модели базы данных для разработанной темы:

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/modelCategories.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/modelUser.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/modelResponse.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/modelFinance.png)

2) Подключение к API созданной в практической работе №6 на пакете Conduit. Подключение работает с помощью библиотеки DIO

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/Connect.png)

3) Остальные методы Dio для работы авторизации, регистрации, редактирования профиля, получения данных о пользователе и т.д.

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/dio1.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/dio2.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/dio3.png)

4) Работа с Interceptor для обработки каких-либо запросов

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/authenticateInterceptor.png)

Результат работы:

1) Авторизация и регистрация

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/regisUI.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/authUI.png)

2) Добавление финансовой сводки

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/addFinance.png)

3) Редактирование профиля пользователя

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/updateProfileUI.png)

4) Список созданных финансовых сводок и редактирование

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/financeListUI.png)

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/financeEditUI.png)

5) Поиск финансовой сводки

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice7/images/financeSearchUI.png)

### Вывод: в ходе выполнения практической работы, познакомился с пакетами Freezed, Dio, Interceptor. Создал приложение, используя созданное API из практической работы №6. Были реализованы все указаные изначально функции.