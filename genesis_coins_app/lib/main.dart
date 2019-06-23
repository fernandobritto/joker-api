import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=SUA-CHAVE";

void main() async{

  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white
    ),
  )); // MaterialApp
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {

  final realController = TextEditingController();
  final cashController = TextEditingController();
  final euroController = TextEditingController();

  double cash;
  double euro;

  void _realChanged(String text){
    double real = double.parse(text);
    cashController.text = (real/cash).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void _cashChanged(String text){
    double cash = double.parse(text);
    realController.text = (cash * this.cash).toStringAsFixed(2);
    euroController.text = (cash * this.cash/euro).toStringAsFixed(2);
  }

  void _euroChanged(String text){
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    cashController.text = (euro * this.euro / cash).toStringAsFixed(2);
  }




  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Gênesis Coin \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text("Carregando Dados...",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0),
                  textAlign: TextAlign.center, ),
                );
              default:
                if(snapshot.hasError){
                  return Center(
                    child: Text("Erro ao Carregar Dados :( ",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25.0),
                      textAlign: TextAlign.center, ),
                  );
                } else {
                  cash = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(Icons.monetization_on, size: 150.0, color: Colors.amber),
                        buildTextField("Reais", "R\$", realController, _realChanged),
                        Divider(),
                        buildTextField("Dolar", "US\$", cashController, _cashChanged),
                        Divider(),
                        buildTextField("Euros", "E", euroController, _euroChanged)
                      ],
                    ),
                  );
                }
            }
          }) // FutureBuilder
    ); //Scaffold
  }
}


Widget buildTextField(String label, String prefix, TextEditingController c, Function f){
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix
    ),
    style: TextStyle(
        color: Colors.amber, fontSize: 25.0
    ),
    onChanged: f,
    keyboardType: TextInputType.number,
  );// TextField
}

