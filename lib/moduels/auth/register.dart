import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla/Layout/homelayout.dart';
import 'package:salla/moduels/auth/login.dart';

import '../component/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var sB;
  bool isPass = true;
  final _auth = FirebaseAuth.instance;
  IconData failIcon = Icons.visibility_outlined;
  var controller = TextEditingController();
  var birthDateController = TextEditingController();
  var phoneController = TextEditingController();
  var userController = TextEditingController();

  var passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('WELCOME TO SALLA')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      width: double.infinity,
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScNB05UtcO1Hi8iW9xzgyy-gr9DmPLO2DHbQ&usqp=CAU'))),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    height: 50,
                    child: const Center(
                      child: Text('Please Enter Some Information',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextForm(
                      controller: userController,
                      type: TextInputType.text,
                      label: 'User Name',
                      hint: 'Enter your Name',
                      prefix: Icons.person,
                      validatorr: (String? value) {
                        if (value!.isEmpty) {
                          return 'You Must Enter Name';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextForm(
                      controller: controller,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      hint: 'Enter Email',
                      prefix: Icons.email,
                      validatorr: (String? value) {
                        if (value!.isEmpty) {
                          return 'You Must Enter Email';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextForm(
                      submitted: (value) {
                        if (formKey.currentState!.validate()) {
                          return;
                        }
                      },
                      isPassword: isPass,
                      suffix: failIcon,
                      onPress: () {
                        return changeIconPassword();
                      },
                      controller: passController,
                      type: TextInputType.visiblePassword,
                      label: 'password',
                      hint: 'Enter password',
                      prefix: Icons.lock_outline_rounded,
                      validatorr: (String? value) {
                        if (value!.isEmpty) {
                          return "You Must Enter Password";
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextForm(
                      controller: phoneController,
                      type: TextInputType.text,
                      label: 'Phone Number',
                      hint: 'Enter your phone',
                      prefix: Icons.person,
                      validatorr: (String? value) {
                        if (value!.isEmpty) {
                          return 'You Must Enter phone Number';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextForm(
                      controller: birthDateController,
                      type: TextInputType.datetime,
                      label: 'BirthDate',
                      hint: 'Enter your BirthDate',
                      prefix: Icons.person,
                      validatorr: (String? value) {
                        if (value!.isEmpty) {
                          return 'You Must Enter BirthDate';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        final String name = userController.text;
                        final String email = controller.text;
                        final String password = passController.text;
                        final String phone = phoneController.text;
                        final String birtheDate = birthDateController.text;
                        final docUser = FirebaseFirestore.instance
                            .collection("users")
                            .doc();
                        final user = UsersModel(
                            name: name,
                            email: email,
                            password: password,
                            phone: phone,
                            birthdate: birtheDate);
                        final json = user.toFirebase();
                        docUser.set(json);
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: controller.text,
                                password: passController.text)
                            .then((value) async {
                          await postDetailsToFirestore();
                          User? user = _auth.currentUser;

                          return Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeLayout()));
                        }).catchError((error) {
                          if (kDebugMode) {
                            print(error);
                          }
                          Fluttertoast.showToast(
                              msg: error.toString(),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.white,
                              textColor: Colors.red,
                              fontSize: 15);
                        });
                      }
                    },
                    text: 'confirm',
                    isUppercase: true,
                  ),
                  Row(
                    children: [
                      const Text("Have account?"),
                      defaultTextBotton(
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          text: 'Login now')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeIconPassword() {
    setState(() {
      isPass = !isPass;
      failIcon = isPass
          ? failIcon = Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UsersModel userModel = UsersModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = userController.text;
    userModel.phone = phoneController.text;
    userModel.birthdate = birthDateController.text;
    userModel.password = passController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toFirebase());
  }
}
