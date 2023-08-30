import 'package:flutter/material.dart';

class ShowScreens extends StatelessWidget {
  final Map<String, dynamic> countryData;

  const ShowScreens({required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Image.network(countryData['flags']['png']),
              ),
              Container(
                child: Column(
                  children: [
                    Text(countryData['name']['common'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(countryData['flags']['alt']),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}