import 'dart:convert';

import 'package:consumo_api/usuario_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({ Key? key }) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários'), centerTitle: true,),
      body: FutureBuilder<dynamic>(
        future: _pegarUsuarios(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                var usuario = snapshot.data![index];
              return ListTile(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => UsuarioPage(usuario: usuario)));},
                leading: CircleAvatar(
                  child: Text('${usuario['id']}'),
                ),
                title: Text('${usuario['name']}'),
                subtitle: Text('${usuario['website']}'),
              );
            });
          } else if(snapshot.hasError){
            return Center(child: Text('${snapshot.error}'));
          }

          return const Center(child: CircularProgressIndicator());
        }
        ),
    );
  }

  _pegarUsuarios() async{
    var url = Uri.parse('http://jsonplaceholder.typicode.com/users');
    var resposta = await http.get(url);

    if(resposta.statusCode == 200){
      return jsonDecode(resposta.body);
    } else {
      throw Exception('Não foi Possível Carregar os Usuários');
    }
  }

}