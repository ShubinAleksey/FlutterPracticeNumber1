import 'package:flutter_practice_2/domain/entity/order_entity.dart';
import 'package:flutter_practice_2/domain/entity/tovar.dart';

class Order extends OrderEntity {
  late int id;
  final String nameOrder;
  final TovarEntity nameProduct;

  Order({required this.nameOrder,
  required this.nameProduct}) :super(nameOrder: nameOrder, nameProduct: nameProduct);

  Map<String,dynamic> toMap() {
    return {
      'nameOrder': nameOrder,
      'nameProduct' : nameProduct.nameTovar,
      'nameProduct_price' : nameProduct.price,
    };
  }

  factory Order.toFromMap(Map<String,dynamic> json) {
    return Order(nameOrder: json['nameOrder'],nameProduct: json['nameProduct']);
  } 
}