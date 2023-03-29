# Практическая работа № 10
## Тема: Firebase Storage, FilePicker
### Цель работы: познакомиться с Firebase Storage, Filepicker. Разработать приложение на реализацию функционала работы с картинками на основе практической работы № 8 и 9.

Firebase Storage — это хранилище, встроенное в платформу Firebase. Его можно использовать его для хранения и управления медиафайлами, созданными пользователями Интернета и мобильных приложений.

Filepicker - это элемент управления, который позволяет использовать собственный проводник для выбора одного или нескольких файлов с поддержкой фильтрации расширений и загрузки.

Ход работы:
1.	Реализация функционала для загрузки и удаления картинок в Firebase Storage, а также отображения списка всех картинок, находящихся в Firebase Storage. В списке следующие атрибуты: название картинки, сама картинка, размер и ссылка на картинку.
2.	Связка Cloud Firestore с Firebase Storage. В FireStore храняться все данные картинки
3.	Связка Cloud Firestore с Firebase Storage и FirebaseAuth. Реализация авторизации и регистрации. У пользователя есть свои реальные картинки, которые он может выводить, удалять и изменять. Все данные хранятся в Cloud Firestore, а сама картинка хранится в Firebase Storage.

1) Подключение Storage в Firebase

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610Storage.png)

2) Реализация коллекции для Cloud Firestore - Images

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610ImageCollection.png)

3) Реализация выбора картинки с помощью Filepicker'а

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610ChooseFile.png)

4) Реализация обновления картинки

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610UpdateImage.png)

5) Реализация удаления картинки

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610DeleteImage.png)

Результат работы:

1) Коллекция картинок в Cloud Firestore 

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610CollectionImagesUI.png)

2) Альбом картинок

![image](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice10/images/PR9%2610AlbumUI2.jpg)

### Вывод: в ходе практической работы познакомился с Firebase Storage, Filepicker. Разработал приложение на реализацию функционала работы с картинками на основе практической работы № 8 и 9.