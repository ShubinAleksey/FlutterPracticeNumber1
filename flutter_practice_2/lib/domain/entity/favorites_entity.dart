import 'package:flutter_practice_2/domain/entity/tovar.dart';
import 'package:flutter_practice_2/domain/entity/user_entity.dart';

class FavoritesEntity{
  late int id;
  final TovarEntity nameProduct;
  final UserEntity nameUser;

  FavoritesEntity({
    required this.nameProduct,
    required this.nameUser,
  });
}