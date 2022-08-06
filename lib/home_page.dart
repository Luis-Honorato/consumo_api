import 'package:consumo_api/busca_cep_page.dart';
import 'package:consumo_api/usuarios_page.dart';
import 'package:consumo_api/validar_cpf.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guia API'), centerTitle: true,),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => UsuariosPage()))
                );
              }, 
              child: Text('Usuários', style: TextStyle(fontSize: 20),)
              ),
              TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuscaCepPage()));
              }, 
              child: Text('Identificador de CEP', style: TextStyle(fontSize: 20),)
              ),
              TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => ValidarCPF())));
              }, 
              child: Text('Validador CPF', style: TextStyle(fontSize: 20),)
              ),
        ]
       ),
      ),
    );
  }
}