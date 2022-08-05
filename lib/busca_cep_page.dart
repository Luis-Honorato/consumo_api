import 'dart:convert';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({ Key? key }) : super(key: key);

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {

  var cep = '01001000';
  var erro = '';
  var cepFormater = new MaskTextInputFormatter(
    mask: '#####-###', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  final cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar CEP'), centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Digite o CEP para obter o endereço',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(
              width: 350,
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: [cepFormater],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'ex.: 01001-000',
                    ),
                    controller: cepController,
                    
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        cep = cepController.text;
                      });
                      print(cep);
                    }, 
                    child: Text('Buscar')
                    )
                ],
              ),
            ),
            FutureBuilder<dynamic>(
              future: _buscarCep(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Text('Rua: ${snapshot.data!['logradouro']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text('Bairro: ${snapshot.data!['bairro']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text('Cidade: ${snapshot.data!['localidade']} - ${snapshot.data!['uf']}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  );
                } else if(snapshot.hasError){
                  return Center(child: Text('${snapshot.error}'));
                }

                return Text('');
              }
            )
          ],
        ),
      ),
    );
  }

  _buscarCep() async{

    var url = Uri.parse('http://viacep.com.br/ws/$cep/json/');
    var resposta = await http.get(url);

    if(resposta.statusCode == 200){
      return jsonDecode(resposta.body);
    } else{
      print(cep);
    }
  }

}