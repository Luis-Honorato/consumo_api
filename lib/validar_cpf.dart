import 'package:flutter/material.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart'; 
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ValidarCPF extends StatefulWidget {
  const ValidarCPF({ Key? key }) : super(key: key);

  @override
  State<ValidarCPF> createState() => _ValidarCPFState();
}

class _ValidarCPFState extends State<ValidarCPF> {

  var cpfFormater = new MaskTextInputFormatter(
    mask: '###.###.###-##', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  var _cpfController = TextEditingController();
  
  var texto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Validar CPF'), centerTitle: true,),

      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Digite um CPF para valida-lo!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(
            width: 350,
            child: Column(
              children: [
                TextField(
                  inputFormatters: [cpfFormater],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('000.000.000-00')
                  ),
                  controller: _cpfController,
                ),
                ElevatedButton(
                  onPressed: () {
                    String cpf = _cpfController.text;
                    setState(() {
                      if(CPFValidator.isValid(cpf)){
                        texto = 'CPF Válido!';
                      } else{
                        texto = 'CPF Inválido!';
                      }
                      print(cpf);
                    });
                  }, 
                  child: Text('Validar')
                )
              ],
            ),
          ),
          Text(texto, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ]
      )),
    );
  }
}