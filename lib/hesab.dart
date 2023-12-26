import 'package:flutter/material.dart';
import './user_data.dart';

class Hesab {
  UserData? _userData;

  Hesab({UserData? userData}) : _userData = userData;
  int? counter() {
    if (_userData == null) {
      return null; // Handle the case where _userData is null
    }

    double? result =
        90 + (_userData!.sporgunu ?? 0) - (_userData!.cekilen ?? 0);
    result = result + ((_userData!.boy ?? 0) / (_userData!.kilo ?? 1));

    if (_userData!.choosedgender == 'QADIN') {
      return (result + 3).toInt(); // Convert the result to an integer
    } else {
      return result.toInt(); // Convert the result to an integer
    }
  }
}
