import 'package:flutter/material.dart';

import 'package:salla/moduels/component/title%20app.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SALLA For Shopping'),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(


                              children: [
                                Container(

                                  color: Colors.grey[300],
                                  child: const Text(
                                    "-Salla is App for shopping especially shopping for clothes our App is very easy to use by individuals.""-This App sells clothes for women to satisfy their requirements in the world of fashion and shopping.",

                                    style: TextStyle(
                                      fontSize: 20,fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                    "The application sells clothes for women . The application is divided into : ",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    titleApp("1-Login Screen", Icons.login),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    titleApp("2-Homepage", Icons.home),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    titleApp(
                                        "3-Products page", Icons.shopping_bag),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    titleApp(
                                      "4-Information about the app",
                                      Icons.app_blocking,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    titleApp(
                                      "5-Information about Team",
                                      Icons.groups_rounded,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    titleApp(
                                      "6-profile",
                                      Icons.person,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ])),
        ));
  }
}
