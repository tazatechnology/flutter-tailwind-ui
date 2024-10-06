import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// The default shades for Flutter Tailwind UI color palettes
const _shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950];

/// List of all the Flutter Tailwind UI color palettes
const _colors = {
  'Slate': TColors.slate,
  'Gray': TColors.gray,
  'Zinc': TColors.zinc,
  'Neutral': TColors.neutral,
  'Stone': TColors.stone,
  'Red': TColors.red,
  'Orange': TColors.orange,
  'Amber': TColors.amber,
  'Yellow': TColors.yellow,
  'Lime': TColors.lime,
  'Green': TColors.green,
  'Emerald': TColors.emerald,
  'Teal': TColors.teal,
  'Cyan': TColors.cyan,
  'Sky': TColors.sky,
  'Blue': TColors.blue,
  'Indigo': TColors.indigo,
  'Violet': TColors.violet,
  'Purple': TColors.purple,
  'Fuchsia': TColors.fuchsia,
  'Pink': TColors.pink,
  'Rose': TColors.rose,
};

// =================================================
// CLASS: ColorsRoute
// =================================================

class ColorsRoute extends StatelessWidget {
  const ColorsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          section: 'Design System',
          title: 'Configuration',
        ),
        const Text(
          "Flutter Tailwind UI includes an expertly-crafted default color palette out-of-the-box that is a great starting point if you don't have your own specific branding in mind.\n\nThese colors have been ported from the Tailwind CSS default color palettes.",
        ),
        for (final entry in _colors.entries)
          ColorPalette(
            name: entry.key,
            color: entry.value,
          ),
      ],
    );
  }
}

// =================================================
// CLASS: ColorPalette
// =================================================

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    required this.name,
    required this.color,
    super.key,
  });
  final String name;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    final isLight = context.isLightTheme;

    return Padding(
      padding: TOffset.t32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: TOffset.b8,
            child: Text(
              name,
              style: context.text_sm.semibold.copyWith(
                color: TColors.slate[isLight ? 900 : 200],
              ),
            ),
          ),
          Row(
            children: [
              for (final shade in _shades)
                Expanded(
                  child: ColorSwatch(
                    color: color,
                    shade: shade,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// =================================================
// CLASS: ColorSwatch
// =================================================

class ColorSwatch extends StatefulWidget {
  const ColorSwatch({
    required this.color,
    required this.shade,
    super.key,
  });
  final MaterialColor color;
  final int shade;

  @override
  State<ColorSwatch> createState() => _ColorSwatchState();
}

class _ColorSwatchState extends State<ColorSwatch> {
  bool copied = false;
  MouseCursor get mouseCursor =>
      copied ? SystemMouseCursors.basic : SystemMouseCursors.click;

  late final Color color;
  late final String hexColor;

  // -------------------------------------------------
  // METHOD: copy
  // -------------------------------------------------

  @override
  void initState() {
    super.initState();
    color = widget.color[widget.shade] ?? Colors.transparent;
    hexColor = '#${color.value.toRadixString(16).substring(2)}';
  }

  // -------------------------------------------------
  // METHOD: copy
  // -------------------------------------------------

  Future<void> copy() async {
    if (copied) {
      return;
    }
    setState(() => copied = true);
    await Clipboard.setData(ClipboardData(text: hexColor));
    await Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() => copied = false);
      }
    });
  }

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final isLight = context.isLightTheme;

    return InkWell(
      mouseCursor: mouseCursor,
      onTap: copy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: widget.shade == _shades.last ? TOffset.r0 : TOffset.r8,
            width: double.infinity,
            height: TSpacingScale.v40,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: isLight ? Colors.black12 : Colors.white24,
                width: 0.5,
              ),
              borderRadius: TBorderRadius.rounded,
            ),
            constraints: const BoxConstraints(
              minWidth: TSpacingScale.v40,
            ),
            child: copied
                ? FaIcon(
                    FontAwesomeIcons.check,
                    color: color.contrastBlackWhite()?.withOpacity(0.8),
                  )
                : null,
          ),
          Padding(
            padding: TOffset.t8 + TOffset.b2,
            child: Text(
              widget.shade.toString(),
              style: context.text_xs.medium.copyWith(
                color: isLight ? TColors.slate.shade900 : Colors.white,
              ),
            ),
          ),
          Text(
            copied ? 'Copied' : color.toHex(),
            style: context.text_xs.mono.copyWith(
              fontSize: 10,
              fontWeight: copied ? FontWeight.bold : FontWeight.normal,
              color: copied ? null : TColors.slate[isLight ? 500 : 400],
            ),
          ),
        ],
      ),
    );
  }
}
