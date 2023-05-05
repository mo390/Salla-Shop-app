import 'package:flutter/material.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required String hint,
  required IconData prefix,
  bool isPassword = false,
  required String? Function(String?)? validatorr,
  Function(String)? submitted,
  IconData? suffix,
  Function()? onPress,
  Function? onTapp,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: submitted,
      obscureText: isPassword,
      validator: validatorr,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefix),
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(onPressed: onPress, icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );
Widget defaultTextBotton(
        {required Function() function, required String text}) =>
    TextButton(onPressed: function, child: Text(text.toUpperCase()));

Widget defaultButton({
  double width = double.infinity,
  Color colorBackground = Colors.blue,
  double r = 10.0,
  required Function() function,
  required String text,
  bool isUppercase = true,
}) =>
    Container(
      height: 40,
      decoration: BoxDecoration(
          color: colorBackground, borderRadius: BorderRadius.circular(r)),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );

class UsersModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? birthdate;
  String? phone;

  UsersModel(
      {this.name,
      this.email,
      this.password,
      this.birthdate,
      this.phone,
      this.uid});

  Map<String, dynamic> toFirebase() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "birthdate": birthdate,
      "phone": phone,
      "uid": uid,
    };
  }

  factory UsersModel.fromFirebase(map) {
    return UsersModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      birthdate: map['birthdate'],
      phone: map['phone'],
      uid: map['uid'],
    );
  }
}
