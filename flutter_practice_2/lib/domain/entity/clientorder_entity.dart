import 'package:flutter_practice_2/domain/entity/order_entity.dart';
import 'package:flutter_practice_2/domain/entity/user_entity.dart';

class ClientOrderEntity{
  late int id;
  final OrderEntity nameOrder;
  final UserEntity nameUser;

  ClientOrderEntity({
    required this.nameOrder,
    required this.nameUser,
  });
}