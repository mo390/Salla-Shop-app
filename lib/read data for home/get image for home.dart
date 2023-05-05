import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetImageHome extends StatelessWidget {
  final String documentid;

  const GetImageHome({super.key, required this.documentid});

  @override
  Widget build(BuildContext context) {
    //get collection

    CollectionReference users =
    FirebaseFirestore.instance.collection('home');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            return Image.network('${data['image']}');
          }
          return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text('loadding....')
                ],
              ));
        });
  }
}
