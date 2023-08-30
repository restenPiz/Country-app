// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

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
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0), // Ajuste o valor conforme necessário
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 1.0,
                            ),
                            Text(countryData['name']['official'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 1.0,
                            ),
                            Text(
                              countryData['flags']['alt'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                height: 2,
                              ),
                            ),
                            Text(
                              //?Mix the datas
                              'The capital of ${countryData['name']['common']} is ${countryData['capital'][0]}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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