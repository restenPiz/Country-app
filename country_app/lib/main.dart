import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //!Inicio do metodo responsavel por fazer o fetch dos dados
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/independent?status=true'));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print('Dado do JSON: $responseData');
    } else {
      // Lidar com erros
      print('Erro na requisição: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {

    fetchData();
    
    return MaterialApp(

      //?Removendo o debugger do meu app
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ola Mundo'),
        ),
        body: ListView(
          children: [
            //?Inicio do conteudo do meu applicativo            
          ],
        ),
      ),
    );
  }
}
