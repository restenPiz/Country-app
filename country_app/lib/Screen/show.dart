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
      body:  Container(
        color: Color.fromARGB(255, 204, 204, 204),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 20,
                    child: ListTile(
                      title: Text(countryData['name']['common'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Image.network(countryData['flags']['png']),
                    ),
                  ),
                  Container(
                    height: 30.0,
                  ),
                  Card(
                    child: Text(countryData['flags']['alt']),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}