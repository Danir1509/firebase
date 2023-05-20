import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduccion_firebase/services/firebase.dart';
import 'package:firebase_core/firebase_core.dart';

class FireBaseApp extends StatefulWidget {
  const FireBaseApp({super.key});

  @override
  State<FireBaseApp> createState() => _FireBaseAppState();
}

class _FireBaseAppState extends State<FireBaseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Firebase',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FIREBASE'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FutureBuilder(
            future: getUsuarios(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    //return Text(snapshot.data?[index]['nombre']);
                    return ListTile(
                      title: Text(snapshot.data?[index]['nombre']),

                      onTap: (() async {
                        await Navigator.pushNamed(context, "/edit");
                      }),
                    );
                  }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(
              context, '/add',
              );
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
