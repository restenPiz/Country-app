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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Country Name: ${countryData['name']['common']}'),
            // Display other country details as needed
          ],
        ),
      ),
    );
  }
}