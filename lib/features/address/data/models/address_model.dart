import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AddressTextEditingController {
  String name;
  String hint;
  TextEditingController controller;
  bool optional;
  RxBool? error;
  TextInputType keyboardType;

  AddressTextEditingController(
      {required this.name,
      required this.hint,
      required this.controller,
      this.optional = false,
      this.keyboardType = TextInputType.text})
      : error = RxBool(false);
}
