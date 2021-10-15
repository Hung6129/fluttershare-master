import 'package:flutter/material.dart';
import 'package:fluttershare/constrants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final drugsRef = Firestore.instance.collection('drugs');

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    // getData();
    // getDataById();
    super.initState();
  }

  //fetch data with filter
  // getData() async {
  //   final QuerySnapshot snapshot =
  //       await drugsRef.where("isDeadly", isEqualTo: true).getDocuments();
  //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //     print(doc.data);
  //   });
  // }

  //fetch data by ID
  // getDataById() {
  //   final String id = 'tWh22Viv78SLBYS3tnRW';
  //   drugsRef.document(id).get().then((DocumentSnapshot doc) {
  //     print(doc.data);
  //   });
  // }

  //alternative ways to fetch data from firestore
  // getDataById() async {
  //   final String id = 'tWh22Viv78SLBYS3tnRW';
  //   final DocumentSnapshot doc = await drugsRef.document(id).get();
  //     print(doc.data);
  //   }
  // }

  //fetch data from firestore
  // getData() {
  //   drugsRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {
  //       print(doc.data);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color5,
      ),
    );
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}
