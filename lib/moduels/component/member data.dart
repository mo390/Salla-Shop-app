import 'package:flutter/material.dart';

class MemberData extends StatelessWidget {
  String url;
  String name;
  String age;
  String university;
  String city;
  String grade;
  String faculty;
  MemberData(this.url, this.name, this.age, this.university, this.city,
      this.faculty, this.grade,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.grey[300]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: AlignmentDirectional.center,
              child: CircleAvatar(
                  radius: 70,
                  foregroundColor: Colors.indigo,
                  child: Image.network(
                    url,
                    fit: BoxFit.fill,
                  )),
            ),
            const Divider(color: Colors.brown, thickness: 3),
            Container(
                padding: const EdgeInsets.all(10),
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : $name",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Age :      $age",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("University :$university",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("city :  $city",
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Faculty :  $faculty",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("grade :     $grade",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
