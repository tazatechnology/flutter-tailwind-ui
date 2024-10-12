import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: CodeBlock
// =================================================

class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return Container(
      decoration: BoxDecoration(
        color: TColors.slate.shade800,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
