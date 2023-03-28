# Практическая работа №9
## Тема: FireStore
### Цель работы: познакомиться с FireStore. Разработать приложение на реализацию сохранения данных пользователей на основе практической работы №8.

Firestore - это база данных документов NoSQL, созданная для автоматического масштабирования, высокой производительности и простоты разработки приложений. Хотя интерфейс Firestore обладает многими из тех же функций, что и традиционные базы данных, будучи базой данных NoSQL, он отличается от них тем, как описывает взаимосвязи между объектами данных.

Ход работы:
1.	Сохранение данных при регистрации пользователя в firestore
2.	Редактирование данных пользователя в firestore.
3.	Работа с данными CRUD
4.  Динамическое обновление данных

1) Подключение Cloud Firestore в Firebase

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice9/images/PR9%2610CloudFire.png)

2) Добавление коллекции в Cloud Firestore в метод регистрации пользователя в Firebase

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice9/images/PR9%2610CollectionUsers.png)

3) Обновление профиля пользователя

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice9/images/PR9%2610UpdateProfile.png)

Результат работы:

1) Обновление профиля

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice9/images/PR9%2610UpdateProfileUI.jpg)

2) Динамическое обновление пользователей

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice9/images/PR9%2610DynamicUsersUI.jpg)

### Вывод: в ходе практической работы познакомился с Firestore. Разработал приложение на реализацию сохранения данных пользователей на основе практической работы №8.