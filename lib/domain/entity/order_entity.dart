import 'package:flutter_practice_2/domain/entity/tovar.dart';

class OrderEntity{
  late int id;
  final String nameOrder;
  final TovarEntity nameProduct;

  OrderEntity({
    required this.nameOrder,
    required this.nameProduct,
  });
}