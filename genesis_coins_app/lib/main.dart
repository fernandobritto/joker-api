import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

const request = "https://api.hgbrasil.com/finance?format=json&key=SUA-CHAVE";

void main(){

  http.Response response = http.get(request);

  runApp(MaterialApp(
    home: Container(),
  )); // MaterialApp
}
