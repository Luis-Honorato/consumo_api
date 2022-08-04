import 'package:flutter/material.dart';

class UsuarioPage extends StatelessWidget {

    Map<String,dynamic> usuario;

  UsuarioPage({ Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${usuario['name']}'),),

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(usuario['name'],textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(usuario['email'],textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(usuario['username'],textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(usuario['phone'],textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}