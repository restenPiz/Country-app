// ignore_for_file: avoid_print, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  //!Inicio do metodo responsavel por fazer o fetch dos dados
  List<Map<String, dynamic>> apiData = [];

  //? Função para buscar dados da API e atualizar o estado
  Future<void> fetchData() async {

    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/independent?status=true'));
    
    if (response.statusCode == 200) {
      setState(() {
        apiData = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      print('Erro na requisição: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Buscar dados da API quando o widget é inicializado
  }

  //*Inicio do metodo responsavel por redirecionar para outra widget
  void navigateToShowScreen(Map<String, dynamic> countryData) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ShowScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      //?Removendo o debugger do meu app
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Country App'),
        ),
        body: ListView(
          children: [
            //?Percorrendo o laco para printar os dados
            for(var item in apiData)
            ElevatedButton(

              //?Adicionando cor nos butoes
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
              onPressed: (){

                navigateToShowScreen(item); 

              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(item['name']['common']),
                    subtitle: Text(item['name']['official']),
                    leading: Image.network(
                      item['flags']['png'],
                      width: 80,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),    
                ],
              ),
            ),       
          ],
        ),

        //?Inicio do butao de pesquisa
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            navigateToShowScreen(apiData[0]);
          },
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}

//?Inicio da widget que vai ser responsavel por mostrar os detalhes

class ShowScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Use the countryData to display specific country details
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display other country details as needed
          ],
        ),
      ),
    );
  }
}
