// ignore_for_file: avoid_print, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:country_app/Screen/show.dart';
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

  //* Função para buscar dados da API e atualizar o estado
  Future<void> fetchData() async {

    final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/independent?status=true')
    );
    
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
      MaterialPageRoute(builder: (context) => ShowScreens(countryData: countryData)),
    );
  }

  //!Declarando os dados que serao importantes na pesquisa
  TextEditingController searchController = TextEditingController();
  bool isSearchOpen = false;

  //! Inicio do metodo que e responsavel por mudar o estado da pesquisa
  void toogleSearch(){
    setState((){

      //*Altera o estado do search
      isSearchOpen = !isSearchOpen;
      
      if(!isSearchOpen){
        searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      //?Removendo o debugger do meu app
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          //*Creating a simple method to validate the state of search
          title: isSearchOpen
          ? SearchAppBar(controller: searchController)
          : AppBar(title: Text('Country App')),
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

                    //*Afastando o listTile para esquerda
                    contentPadding: EdgeInsets.only(left: 1.0),

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
          onPressed: toogleSearch,
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}

//*Inicio da widget que vai o conter input de pesquisa

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{

  final TextEditingController controller;

  SearchAppBar({required this.controller});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Digite sua pesquisa',
        ),
      ),
    );
  }
}