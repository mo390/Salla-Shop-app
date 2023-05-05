import 'package:flutter/material.dart';
import '../component/member data.dart';
class TeamInfoScreen extends StatelessWidget {
  const TeamInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TEAM DEVELPOR'),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MemberData(
                          "https://previews.123rf.com/images/putracetol/putracetol1808/putracetol180800174/106705582-female-logo-icon-design.jpg",
                          "Hind Alaa Fathy",
                          "20",
                          " Kafr El-Sheikh",
                          " Kafr El-Sheikh",
                          " Computers and Information Systems",
                          "four"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MemberData(
                          "https://previews.123rf.com/images/putracetol/putracetol1808/putracetol180800174/106705582-female-logo-icon-design.jpg",
                          "Eman Mohamed Wael",
                          "21",
                          " Kafr El-Sheikh",
                          "Mansoura",
                          "Computers and Information Systems ",
                          "four"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MemberData(
                          "https://previews.123rf.com/images/putracetol/putracetol1808/putracetol180800174/106705582-female-logo-icon-design.jpg",
                          "Asmaa Hassan Saqr",
                          "21",
                          " Kafr El-Sheikh",
                          " Menoufia EL-Shohadaa",
                          "Computers and Information Systems ",
                          "four"),
                    ],
                  ),
                  Row(
                    children: [
                      MemberData(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLmLRaBUd5SU_6MKZaJcyXuMs6wYP62lGRUw&usqp=CAU",
                          "Mustafa Muhammad El-Zeftawy",
                          "22",
                          "Mansoura",
                          "Mansoura",
                          "Computers and Information Systems ",
                          "four"),
                    ],
                  )
                ],
              )),
        ));
  }
}
