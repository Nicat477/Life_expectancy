import 'package:flutter/material.dart';
import './user_data.dart';
import './constants.dart';
import './hesab.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Result Page')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    Hesab(userData: _userData).counter().toString(),
                    style: parastyle,
                  ),
                )),
            Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Come back'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                )),
          ],
        ));
  }
}
