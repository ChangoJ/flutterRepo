import 'package:flutter/material.dart';

class ListviewPages extends StatelessWidget {
  const ListviewPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Listview Basico"),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              title: Text("Elemento 1"),
              subtitle: Text("Subtitle"),
              leading: Icon(
                Icons.add_to_queue,
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: Text("Elemento 1"),
              subtitle: Text("Subtitle"),
              leading: Icon(
                Icons.add_to_queue,
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: Text("Elemento 1"),
              subtitle: Text("Subtitle"),
              leading: Icon(
                Icons.add_to_queue,
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: Text("Elemento 1"),
              subtitle: Text("Subtitle"),
              leading: Icon(
                Icons.add_to_queue,
                color: Colors.amber,
              ),
            )
          ],
        ));
  }
}
