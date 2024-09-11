import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LibraryPage(),
    );
  }
}

class LibraryPage extends StatelessWidget {
  final List<String> shelves = ['Shelf 1', 'Shelf 2', 'Shelf 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Library'),
      ),
      body: ListView.builder(
        itemCount: shelves.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(shelves[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShelfPage(shelfName: shelves[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ShelfPage extends StatelessWidget {
  final String shelfName;

  ShelfPage({required this.shelfName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shelfName),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text('Book ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
