import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({ Key? key }) : super(key: key);

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buscar CEP'), centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:  [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Digite o CEP para obter o endereço',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}