import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDecription extends StatelessWidget {
  final String documentid;

  const GetDecription({super.key, required this.documentid});

  @override
  Widget build(BuildContext context) {
    //get collection

    CollectionReference users = FirebaseFirestore.instance.collection('home');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            return  Container(

            width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text('${data['description']}',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            );
          }
          return const Text('loadding...');
        });
  }
}
