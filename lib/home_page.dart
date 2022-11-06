import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _productList = [
    'Apple',
    'Mango',
    'Orange',
    'Banana',
    'Straberry',
    'Cherry'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorderable list"),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (context, index) {
            return Card(
              // All items in the list must have a unique [Key],
              // Every product in our list is unique thats why we setting the same name
              key: ValueKey(_productList[index]),
              child: ListTile(
                title: Text(_productList[index]),
              ),
            );
          },
          itemCount: _productList.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _productList.removeAt(oldIndex);
              _productList.insert(newIndex, element);
            });
          }),
    );
  }
}
