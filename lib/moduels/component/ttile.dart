import 'package:flutter/material.dart';

class ProfileTitle extends StatelessWidget {
  String title;
  String value;
  ProfileTitle(this.title,this.value, {super.key});
  @override
  Widget build(BuildContext context) {
    return
      Text("$title : $value", style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),);




  }
}
