# Практическая работа № 10
## Тема: Firebase Storage, FilePicker
### Цель работы: познакомиться с Firebase Storage, Filepicker. Разработать приложение на реализацию функционала работы с картинки на основе практической работы № 8 и 9.

Firebase Storage — это хранилище, встроенное в платформу Firebase. Его можно использовать его для хранения и управления медиафайлами, созданными пользователями Интернета и мобильных приложений.

Filepicker - это элемент управления, который позволяет использовать собственный проводник для выбора одного или нескольких файлов с поддержкой фильтрации расширений и загрузки.

Ход работы:
1.	Реализация функционала для загрузки и удаления картинок в Firebase Storage, а также отображения списка всех картинок, находящихся в Firebase Storage. В списке следующие атрибуты: название картинки, сама картинка, размер и ссылка на картинку.
2.	Связка Cloud Firestore с Firebase Storage. В FireStore храняться все данные картинки
3.	Связка Cloud Firestore с Firebase Storage и FirebaseAuth. Реализация авторизации и регистрации. У пользователя есть свои реальные картинки, которые он может выводить, удалять и изменять. Все данные хранятся в Cloud Firestore, а сама картинка хранится в Firebase Storage.

1) Подключение Storage в Firebase

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