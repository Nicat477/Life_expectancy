import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconCinsiyyet extends StatelessWidget {
  final String cinsiyyet;
  final IconData icon;
  IconCinsiyyet(
      {this.cinsiyyet = 'default', this.icon = FontAwesomeIcons.addressBook});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Colors.black54),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyyet,
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
