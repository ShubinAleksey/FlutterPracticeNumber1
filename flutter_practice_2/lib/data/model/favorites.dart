import 'package:flutter_practice_2/domain/entity/favorites_entity.dart';
import 'package:flutter_practice_2/domain/entity/tovar.dart';
import 'package:flutter_practice_2/domain/entity/user_entity.dart';

class Favorites extends FavoritesEntity {
  late int id;
  final TovarEntity nameProduct;
  final UserEntity nameUser;

  Favorites({required this.nameProduct,
  required this.nameUser}) :super(nameProduct: nameProduct, nameUser: nameUser);

  Map<String,dynamic> toMap() {
    return {
      'nameProduct': nameProduct.nameTovar,
      'nameUser' : nameUser.login,
    };
  }

  factory Favorites.toFromMap(Map<String,dynamic> json) {
    return Favorites(nameProduct: json['nameProduct'],nameUser: json['nameUser']);
  } 
}