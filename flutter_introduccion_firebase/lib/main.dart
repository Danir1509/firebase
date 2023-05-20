import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduccion_firebase/pantallas/add_usuario.dart';
import 'package:flutter_introduccion_firebase/pantallas/firebaseapp.dart';
import 'package:flutter_introduccion_firebase/pantallas/update_usuer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FireBaseMain());
}

class FireBaseMain extends StatelessWidget {
  const FireBaseMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FirebaseCRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => const FireBaseApp(),
        '/add': (context) => const AddUser(),
      },
    );
  }
}
