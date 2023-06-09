import 'package:flutter/material.dart';
import 'package:flutter_introduccion_firebase/services/firebase.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController usuariosController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("agregar usuario"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Center(
              child: const Text(
                'Pagina agregar usuario',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            TextField(
              controller: usuariosController,
              decoration: InputDecoration(
              hintText: 'Ingresar el usuario',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                  //print(usuariosController.text);
                  await agregarUsuario(usuariosController.text).then((_) {
                    Navigator.pop(context);
                  });
                  //   Navigator.pop(context);
                },
            child: Text("Guardar")),
          ],
        ),
      ),
    );
  }
}
