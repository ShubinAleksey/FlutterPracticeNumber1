# Практическая работа № 3
## Тема: Реализация регистрации и авторизации пользователей для системы магазина одежды

#### Цель работы: Реализовать регистрацию и авторизацию пользователя. Каждое поле на экране авторизации и регистрации провалидировать минимум 3 критериями максимум 5. После успешной авторизации перейти на экран в зависимости от роли пользователя. Если авторизация или регистрация не удалась нужно вывести сообщение при помощи Snack Bar.

#### Ход работы:

1) Исходя из предыдущей практической работы, была создана сущность модели "Роль" с уже записанными двумя значениями "Админ" и "Кассир".

![tableRole](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_practice_2/flutter_practice_2/assets/practice2_tableRole.png "tableRole")

2) Далее создаем в проекте на уровне core (ядра) папку usecases с файлом auth_use_case для объявления ссылки типа двух функций: "Авторизация" и "Регистрация".

![AuthUseCase](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_AuthUseCase.png "AuthUseCase")

3) Теперь на уровне domain создаются ещё две папки usecase и repositories в данных двух папках будут находится взаимосвязанные классы, которые будут передовать в данные методы "Авторизации" и "Регистрации" параметры атрибутов сущностей, которые необходимы для работы.

![AuthRepositories](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_AuthRepositories.png "AuthRepositories")

4) Теперь на уровне model создается папка repositories с классом auth_repository_impl. Это основной класс реализации функций "Регистрации" и "Авторизации". В этом классе как раз проходит логика на уровне базы данных с различными проверками.

![AuthRepositoryImpl](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_AuthRepositoryImpl.png "AuthRepositoryImpl")

4) Теперь создаются представления для приложения, в этих представлениях как раз будет проходить валидация атрибутов сущностей и в зависимости от конкретной роли перенаправлять на нужное представление

![Validation](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_Validation.png "Validation")

![IfStatement](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_IfStatement.png "IfStatement")

4) На фотографиях ниже представлены представления (после перехода от конкретной роли) ролей.

![Cassir](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_Cassir.png "Cassir")

![Admin](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/practice3_Admin.png "Admin")
#### Результат работы:

1) Представление регистрации

![Regis](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/registration.jpg "Regis")

2) Представление авторизации

![Auth](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/authorization.jpg "Auth")

3) Ошибка при регистрации

![RegErr](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/registration_error.jpg "RegErr")

4) Успешная регистрация

![RegSuc](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/registration_succ.jpg "RegSuc")

5) Ошибка при авторизации

![AuthErr](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/authorization_fail.jpg "AuthErr")

6) Переход в окно кассира

![WinCassir](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/cassir.jpg "WinCassir")

7) Переход в окно админа

![WinAdmin](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/admin.jpg "WinAdmin")

8) Записи в базе данных

![DBusers](https://github.com/ShubinAleksey/FlutterPracticeNumber1/blob/flutter_prectice3/assets/database_result.png "DBusers")

#### Вывод: в ходе выполнения практической работы были получены навыки по реализации регистрации и авторизации пользователя. Каждое поле на экране авторизации и регистрации были провалидированы 3 критериями. После успешной авторизации переходилось на экран в зависимости от роли пользователя. Если авторизация или регистрация не удалась выводилось сообщение при помощи Snack Bar.
