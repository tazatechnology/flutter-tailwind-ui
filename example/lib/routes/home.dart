import 'package:flutter/material.dart';

// =================================================
// CLASS: HomeRoute
// =================================================

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 100; i++)
          ListTile(
            title: Text('Item $i'),
          ),
      ],
    );
  }
}
