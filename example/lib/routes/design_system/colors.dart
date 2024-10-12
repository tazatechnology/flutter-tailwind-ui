import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';
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

/// Enum for the color format
enum ColorFormat {
  hex,
  rgb,
  flutter,
  tailwind,
}

extension on ColorFormat {
  String get name {
    switch (this) {
      case ColorFormat.hex:
        return 'HEX';
      case ColorFormat.rgb:
        return 'RGB';
      case ColorFormat.flutter:
        return '`Color()`';
      case ColorFormat.tailwind:
        return '`TColors`';
    }
  }
}

/// Provider for how to copy a color to the clipboard
final _colorFormatProvider = StateProvider<ColorFormat>((_) => ColorFormat.hex);

// =================================================
// CLASS: ColorsRoute
// =================================================

class ColorsRoute extends ConsumerWidget {
  const ColorsRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tw = context.tw;
    final colorFormat = ref.watch(_colorFormatProvider);

    return AppScrollView.slivers(
      header: const AppSectionHeader(
        section: 'Design System',
        title: 'Default Color Palettes',
      ),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TText(
                "Flutter Tailwind UI includes an expertly-crafted default color palette out-of-the-box that is a great starting point if you don't have your own specific branding in mind. These colors have been ported from the Tailwind CSS default color palettes and are accessible from the `TColors` class.",
              ),
              TSizedBox.y16,
              TRadioList<ColorFormat>.card(
                direction: tw.screen_md ? Axis.horizontal : Axis.vertical,
                expanded: true,
                title: const Text('Select color format'),
                description: const Text(
                  'Determines the format of the color when copied to clipboard',
                ),
                groupValue: colorFormat,
                items: [
                  for (final format in ColorFormat.values)
                    TRadioListItem(
                      title: TText(format.name),
                      value: format,
                      onChanged: (value) {
                        ref.read(_colorFormatProvider.notifier).state = value;
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: _colors.length,
          itemBuilder: (context, index) {
            final entry = _colors.entries.elementAt(index);
            return ColorPalette(
              name: entry.key,
              color: entry.value,
            );
          },
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
    final tw = context.tw;
    final light = tw.light;
    final swatches = _shades.map<Widget>((shade) {
      return Expanded(
        child: ColorSwatch(name: name, color: color, shade: shade),
      );
    }).toList();

    final colorNameWidget = Text(
      name,
      style: tw.text_sm.semibold.copyWith(
        color: TColors.slate[light ? 900 : 200],
      ),
    );

    final screenMedium = tw.screen_md;

    // Add an extra swatch to make the row even on small screens
    if (!screenMedium) {
      swatches.insert(
        0,
        Expanded(
          child: Padding(
            padding: TOffset.t10,
            child: colorNameWidget,
          ),
        ),
      );
    }

    return Padding(
      padding: TOffset.t32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (screenMedium)
            Padding(
              padding: TOffset.b8,
              child: colorNameWidget,
            ),
          if (screenMedium)
            Row(
              children: swatches,
            ),
          if (!screenMedium) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: swatches.sublist(0, 6),
            ),
            TSizedBox.y16,
            Row(
              children: swatches.sublist(6),
            ),
          ],
        ],
      ),
    );
  }
}

// =================================================
// CLASS: ColorSwatch
// =================================================

class ColorSwatch extends ConsumerStatefulWidget {
  const ColorSwatch({
    required this.name,
    required this.color,
    required this.shade,
    super.key,
  });
  final String name;
  final MaterialColor color;
  final int shade;

  @override
  ConsumerState<ColorSwatch> createState() => _ColorSwatchState();
}

class _ColorSwatchState extends ConsumerState<ColorSwatch> {
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
    hexColor = color.value.toRadixString(16).substring(2);
  }

  // -------------------------------------------------
  // METHOD: copy
  // -------------------------------------------------

  Future<void> copy() async {
    if (copied) {
      return;
    }
    setState(() => copied = true);
    var text = '';
    switch (ref.read(_colorFormatProvider)) {
      case ColorFormat.hex:
        text = color.toHex();
      case ColorFormat.rgb:
        text = 'rgb(${color.red}, ${color.green}, ${color.blue})';
      case ColorFormat.flutter:
        text = 'Color(0xFF$hexColor)';
      case ColorFormat.tailwind:
        text = 'TColors.${widget.name.toLowerCase()}.shade${widget.shade}';
    }

    await Clipboard.setData(ClipboardData(text: text));
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
    ref.watch(_colorFormatProvider);
    final tw = context.tw;
    final light = tw.light;
    var isLast = false;
    if (widget.shade == _shades.last) {
      isLast = true;
    }
    if (!tw.screen_md) {
      if (widget.shade == 400) {
        isLast = true;
      }
    }
    return MouseRegion(
      cursor: mouseCursor,
      child: GestureDetector(
        onTap: copy,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: isLast ? TOffset.r0 : TOffset.r8,
              width: double.infinity,
              height: TSpacingScale.v40,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: light ? Colors.black12 : Colors.white24,
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
                style: tw.text_xs.medium.copyWith(
                  color: light ? TColors.slate.shade900 : Colors.white,
                ),
              ),
            ),
            Text(
              copied ? 'Copied' : color.toHex(),
              style: tw.text_xs.mono.copyWith(
                fontSize: 10,
                fontWeight: copied ? FontWeight.bold : FontWeight.normal,
                color: copied ? null : TColors.slate[light ? 500 : 400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
