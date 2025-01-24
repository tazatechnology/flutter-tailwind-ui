part of 'design_system.dart';

/// The [ColorSwatch] shades used by Tailwind [MaterialColor] definitions
const _shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950];

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

/// Provider for how to copy a color to the clipboard
final _colorFormatProvider =
    StateProvider<ColorFormat>((_) => ColorFormat.tailwind);

// =============================================================================
// ENUM: ColorFormat
// =============================================================================

/// Enum for the color format
enum ColorFormat {
  hex,
  flutter,
  tailwind,
  argb,
  rgbo,
}

extension on ColorFormat {
  String get name {
    switch (this) {
      case ColorFormat.hex:
        return 'HEX';
      case ColorFormat.argb:
        return 'ARGB';
      case ColorFormat.rgbo:
        return 'RGBO';
      case ColorFormat.flutter:
        return '`Color`';
      case ColorFormat.tailwind:
        return '`TColors`';
    }
  }
}

// =============================================================================
// CLASS: ColorsRoute
// =============================================================================

class ColorsRoute extends ConsumerWidget {
  const ColorsRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tw = context.tw;
    final colorFormat = ref.watch(_colorFormatProvider);
    return AppScrollView.slivers(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Colors',
        description: 'The built-in color palettes',
      ),
      slivers: [
        SliverToBoxAdapter(
          child: AppSection(
            title: 'Overview',
            children: [
              const TText(
                "Flutter Tailwind UI includes an expertly-crafted default color palette out-of-the-box that is a great starting point if you don't have your own specific branding in mind. These colors have been ported from the Tailwind CSS default color palettes and are accessible from the `TColors` class.\n\nUse the reference below to copy any color to your clipboard in the format of your choice.",
              ),
              const Divider(height: TSpace.v48),
              TRadioGroup.card(
                width: double.infinity,
                groupValue: colorFormat,
                axis: tw.screen.is_md ? Axis.horizontal : Axis.vertical,
                children: [
                  for (final format in ColorFormat.values)
                    TRadioGroupItem(
                      title: TText(format.name),
                      value: format,
                    ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref.read(_colorFormatProvider.notifier).state = value;
                  }
                },
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

// =============================================================================
// CLASS: ColorPalette
// =============================================================================

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
        child: ColorSwatch(
          key: ValueKey(color[shade]?.toHex()),
          name: name,
          color: color,
          shade: shade,
        ),
      );
    }).toList();

    final colorNameWidget = Text(
      name,
      style: tw.text.style_sm.copyWith(
        color: TColors.slate[light ? 900 : 200],
        fontWeight: TFontWeight.semibold,
      ),
    );

    final screenMedium = tw.screen.is_md;

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
            Row(children: swatches.sublist(6)),
          ],
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: ColorSwatch
// =============================================================================

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

  // ---------------------------------------------------------------------------
  // METHOD: copy
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    color = widget.color[widget.shade] ?? Colors.transparent;
  }

  // ---------------------------------------------------------------------------
  // METHOD: copy
  // ---------------------------------------------------------------------------

  Future<void> copy() async {
    if (copied) {
      return;
    }
    setState(() => copied = true);
    String text = '';
    final r = (color.r * 255).toInt();
    final g = (color.g * 255).toInt();
    final b = (color.b * 255).toInt();
    switch (ref.read(_colorFormatProvider)) {
      case ColorFormat.hex:
        text = color.toHex();
      case ColorFormat.argb:
        text = 'Color.fromARGB(255, $r, $g, $b)';
      case ColorFormat.rgbo:
        text = 'Color.fromRGBO($r, $g, $b, 1)';
      case ColorFormat.flutter:
        text = 'Color(0x${color.toHex(leadingHashSign: false)})';
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

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    ref.watch(_colorFormatProvider);
    final tw = context.tw;
    final light = tw.light;
    bool isLast = false;
    if (widget.shade == _shades.last) {
      isLast = true;
    }
    if (!tw.screen.is_md) {
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
              height: TSpace.v40,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: light ? Colors.black12 : Colors.white24,
                  width: 0.5,
                ),
                borderRadius: TBorderRadius.rounded,
              ),
              constraints: const BoxConstraints(
                minWidth: TSpace.v40,
              ),
              child: copied
                  ? FaIcon(
                      FontAwesomeIcons.check,
                      color: color.contrastBlackWhite()?.withValues(alpha: 0.8),
                    )
                  : null,
            ),
            Padding(
              padding: TOffset.t8 + TOffset.b2,
              child: Text(
                widget.shade.toString(),
                style: tw.text.style_xs.copyWith(
                  color: light ? TColors.slate.shade900 : Colors.white,
                  fontWeight: TFontWeight.medium,
                ),
              ),
            ),
            Text(
              copied ? 'Copied' : color.toHex(includeAlpha: false),
              style: tw.text.style_xs.copyWith(
                fontSize: 10,
                fontWeight: copied ? FontWeight.bold : FontWeight.normal,
                color: copied ? null : TColors.slate[light ? 500 : 400],
                fontFamily: tw.text.fontFamilyMono,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
