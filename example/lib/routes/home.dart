import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

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
          const Padding(
            padding: TOffset.y10,
            child: Text(
              'Whereas disregard and contempt for human rights have resulted',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
      ],
    );
  }
}
