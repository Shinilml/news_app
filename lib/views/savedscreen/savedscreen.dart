import 'package:flutter/material.dart';

class Savedscreen extends StatelessWidget {
  const Savedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          "Saved News",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Icon(Icons.more_vert),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Text(
          "No saved news",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
