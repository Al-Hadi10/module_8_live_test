import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Page $index');
  final String imageUrl = 'https://via.placeholder.com/150';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildContent(orientation);
        },
      ),
    );
  }

  Widget _buildContent(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItem(imageUrl, items[index]);
        },
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItem(imageUrl, items[index]);
        },
      );
    }
  }

  Widget _buildItem(String imageUrl, String title) {
    return Card(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
