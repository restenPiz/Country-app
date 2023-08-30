import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  final Map<String, dynamic> countryData;

  const ShowScreen({required this.countryData});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country App'),
      ),
      body: ListView(
        children: [
          Container(
            child: Text('Nome: ${countryData['name']['common']}'),
          ),
        ],
      ),
    );
  }
}