import 'package:flutter_practice_2/domain/entity/clientorder_entity.dart';
import 'package:flutter_practice_2/domain/entity/order_entity.dart';
import 'package:flutter_practice_2/domain/entity/user_entity.dart';

class ClientOrder extends ClientOrderEntity {
  late int id;
  final OrderEntity nameOrder;
  final UserEntity nameUser;

  ClientOrder({required this.nameOrder,
  required this.nameUser}) :super(nameOrder: nameOrder, nameUser: nameUser);

  Map<String,dynamic> toMap() {
    return {
      'nameOrder': nameOrder.nameOrder,
      'nameUser' : nameUser.login,
    };
  }

  factory ClientOrder.toFromMap(Map<String,dynamic> json) {
    return ClientOrder(nameOrder: json['nameOrder'],nameUser: json['nameUser']);
  }
}