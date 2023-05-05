import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetNameProudcts extends StatelessWidget {
  final String documentid;

  const GetNameProudcts({super.key, required this.documentid});

  @override
  Widget build(BuildContext context) {
    //get collection

    CollectionReference users =
        FirebaseFirestore.instance.collection('proudcts');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              height: MediaQuery.of(context).size.height * .08,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text('Name Producer : ${data['name']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            );
          }
          return Center(
              child: Column(
            children: [
              CircularProgressIndicator(
                color: Colors.blue,
              ),
              Text('loadding....')
            ],
          ));
        });
  }
}
