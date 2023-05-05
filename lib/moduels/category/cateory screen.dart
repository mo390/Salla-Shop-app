import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salla/read%20data%20for%20proudcte/read%20price%20prodcte.dart';
import 'package:salla/read%20data%20for%20proudcte/readimage.dart';

import '../../read data for proudcte/read name proudcte.dart';

class CateoryScreen extends StatefulWidget {
  const CateoryScreen({Key? key}) : super(key: key);

  @override
  State<CateoryScreen> createState() => _CateoryScreenState();
}

class _CateoryScreenState extends State<CateoryScreen> {
  List<String> docIds = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('proudcts')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              if (kDebugMode) {
                print(document.reference);
              }
              docIds.add(document.reference.id);
            }));
  }

  void iniState()
  {
    getDocIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDocIds(),
        builder: (context,snapshot)
    {

      return ListView.builder(

          itemCount: docIds.length,
          itemBuilder: (context,index)
          {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child:GetImageProudcts(documentid: docIds[index],)
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GetNameProudcts(documentid:docIds[index]),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GetPriceProudcte(documentid: docIds[index]),
                ),
              ],
            );
          }

      );
    });
  }
}
