import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla/Layout/homelayout.dart';
import 'package:salla/moduels/auth/register.dart';

import '../component/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPass = true;

  IconData failcon = Icons.visibility_outlined;

  var controller = TextEditingController();

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
                              'https://pbs.twimg.com/profile_images/1443191599756890112/aDjgxfVK_400x400.png'))),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Login Now To Show Our Offers',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(
                    height: 30,
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
                      suffix: failcon,
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
                    height: 30,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: controller.text,
                                password: passController.text)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeLayout())))
                            .catchError((error) {
                          print(error);
                          Fluttertoast.showToast(
                              msg:
                                  'ERROR : ${error.toString()}  please Try Again',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.white,
                              textColor: Colors.red,
                              fontSize: 18,
                              timeInSecForIosWeb: 5);
                        });
                      }
                    },
                    text: 'login',
                    isUppercase: true,
                  ),
                  Row(
                    children: [
                      const Text("Dont't have account?"),
                      defaultTextBotton(
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          text: 'register now')
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
      failcon = isPass
          ? failcon = Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }
}
