import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'database_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseUserSteam,
    //   child: MaterialApp(
    //     home: Wrapper(),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Firebase"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Add Data"),
                  onPressed: () {
                    DatabaseServices.createorupdateProduct("1",
                        name: 'Masker', prince: 10000);
                  },
                ),
                RaisedButton(
                  child: Text("Edit Data"),
                  onPressed: () {
                    DatabaseServices.createorupdateProduct("1",
                        name: 'Pisang', prince: 20000);
                  },
                ),
                RaisedButton(
                  child: Text("Get Data"),
                  onPressed: () async {
                    DocumentSnapshot snapshot =
                        await DatabaseServices.getProduct("1");
                    print(snapshot.data['nama']);
                    print(snapshot.data['harga']);
                  },
                ),
                RaisedButton(
                  child: Text("Delete Data"),
                  onPressed: () async {
                    await DatabaseServices.deleteProduct("1");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
