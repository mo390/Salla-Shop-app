import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../component/components.dart';
import '../component/ttile.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UsersModel loggedInUser = UsersModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UsersModel.fromFirebase(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1443191599756890112/aDjgxfVK_400x400.png"),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ahlan TO Salla App",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${loggedInUser.name}',
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                    ),
                    title: ProfileTitle("Name ", '${loggedInUser.name}'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                    ),
                    title: ProfileTitle("Email", "${loggedInUser.email}"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(25)),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                    ),
                    title:
                        ProfileTitle("Phone Number", "${loggedInUser.phone}"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                    ),
                    title:
                        ProfileTitle("BirthDate ", "${loggedInUser.birthdate}"),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
