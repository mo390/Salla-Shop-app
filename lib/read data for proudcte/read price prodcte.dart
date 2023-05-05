import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class GetPriceProudcte extends StatelessWidget {
  final String documentid;

  const GetPriceProudcte({super.key,  required this.documentid});

  @override
  Widget build(BuildContext context) {
    //get collection

    CollectionReference users=FirebaseFirestore.instance.collection('proudcts');
    return FutureBuilder<DocumentSnapshot>(

        future: users.doc(documentid).get(),
        builder: (context,snapshot)
        {

          if(snapshot.connectionState==ConnectionState.done)
          {
            Map<String,dynamic> data= snapshot.data!.data() as  Map<String,dynamic>;
            return Container(
              height: 40,
              width: double.infinity,

              decoration: BoxDecoration(
                  color: Colors.blue,

                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(

                    'Price : ${data['price']}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),

                ),
              ),
            );
          }
          return Center(child: Column(
            children: const [
              CircularProgressIndicator(color: Colors.blue,),
              Text('loadding....')
            ],
          ));

        });
  }
}
