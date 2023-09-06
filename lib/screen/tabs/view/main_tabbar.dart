import 'package:flutter/material.dart';

class MainTabbar extends StatelessWidget {
  MainTabbar({super.key});
  final List<String> items = ['Öğe 1', 'Öğe 2', 'Öğe 3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: const Icon(Icons.star),
          title: Text(items[index]),
        );
      },
    );
  }
}
