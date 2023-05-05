import 'package:flutter/material.dart';

class titleApp extends StatelessWidget {
  String Title;
  IconData icon;
  titleApp(this.Title,this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text(Title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          width: 5,
        ),
        Icon(icon, color: Colors.indigo),
      ],
    );
  }
}
