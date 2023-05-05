import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String label;
  void Function()? onTab;
  MyButton({Key? key, required this.label, required this.onTab})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTab,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 250,
            height: 65,
            decoration: const BoxDecoration(

                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            child: Center(
              child: Text(
                widget.label,
                style:
                    const TextStyle( fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
