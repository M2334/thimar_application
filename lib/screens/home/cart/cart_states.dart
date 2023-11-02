import 'package:flutter/material.dart';

import 'mdel.dart';
class CartStates{}
class LoadingCartState extends CartStates{}
class SuccessCartState extends CartStates{
  List<CartData> carts;
  SuccessCartState(this.carts);
}
class FailedCartState extends CartStates{}

