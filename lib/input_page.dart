import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './icon_cinsiyyet.dart';
import './my_container.dart';
import './constants.dart';
import './result_page.dart';
import './user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? choosedgender;
  double cekilen = 15;
  double sporgunu = 3;
  int boy = 170;
  int kilo = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildOutlineButton('KILO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Heftede nece defe idman eleyirsiniz",
                    style: parastyle,
                  ),
                  Text(
                    '${sporgunu.round()}',
                    style: numstyle,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: sporgunu.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        sporgunu = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Gunde nece defe cekirsen",
                    style: parastyle,
                  ),
                  Text(
                    '${cekilen.round()}',
                    style: numstyle,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: cekilen.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        cekilen = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        choosedgender = 'QADIN';
                      });
                    },
                    reng: choosedgender == 'QADIN'
                        ? Colors.lightBlue[100] ?? Colors.white
                        : Colors.white,
                    child: IconCinsiyyet(
                      cinsiyyet: "Qadın",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        choosedgender = 'KİŞİ';
                      });
                    },
                    reng: choosedgender == 'KİŞİ'
                        ? Colors.lightBlue[100] ?? Colors.white
                        : Colors.white,
                    child: IconCinsiyyet(
                      cinsiyyet: "Kişi",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                          kilo: kilo,
                          boy: boy,
                          choosedgender: choosedgender,
                          cekilen: cekilen,
                          sporgunu: sporgunu))),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Hesabla', style: parastyle),
            ),
          ),
        ],
      ),
    );
  }

  Row buildOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          child: Text(label, style: parastyle),
          quarterTurns: -1,
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: numstyle,
          ),
          quarterTurns: -1,
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.lightBlue),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
                child: Icon(FontAwesomeIcons.plus, size: 10),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.lightBlue),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy-- : kilo--;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
