part of 'design_system.dart';

// Map from space value to Tailwind CSS name
Map<double, String> tailwindNameMap = {
  0: '0',
  1: 'px',
  2: '0.5',
  4: '1',
  6: '1.5',
  8: '2',
  10: '2.5',
  12: '3',
  14: '3.5',
  16: '4',
  20: '5',
  24: '6',
  28: '7',
  32: '8',
  36: '9',
  40: '10',
  44: '11',
  48: '12',
  52: '13',
  56: '14',
  60: '15',
  64: '16',
  72: '18',
  80: '20',
  96: '24',
  112: '28',
  128: '32',
  144: '36',
  160: '40',
  176: '44',
  192: '48',
  208: '52',
  224: '56',
  240: '60',
  256: '64',
  288: '72',
  320: '80',
  384: '96',
};

// =============================================================================
// CLASS: SpacingRoute
// =============================================================================

class SpacingRoute extends StatelessWidget {
  const SpacingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    double scale = 0;
    if (tw.screen.is_md) {
      scale = 1;
    } else if (tw.screen.is_xs) {
      scale = 0.6;
    } else {
      scale = 0.3;
    }

    // Build the table items
    final items = <AppValueTableItem>[];
    for (var ii = 0; ii < TSpace.values.length; ii++) {
      final name = TSpace.names.keys.elementAt(ii);
      final value = TSpace.names.values.elementAt(ii);
      final item = AppValueTableItem(
        name: name,
        value: value.toInt().toString(),
        widget: Row(
          children: [
            Container(
              width: TSpace.v40,
              padding: TOffset.r12,
              child: Text(
                tailwindNameMap[value] ?? '-',
                style: TextStyle(fontFamily: tw.text.fontFamilyMono),
              ),
            ),
            Container(
              color: TColors.cyan.shade400,
              height: TSpace.v16,
              width: value * scale,
            ),
          ],
        ),
      );
      items.add(item);
    }

    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Spacing Scale',
        description: 'The built-in space scaling system',
        className: 'TSpace',
      ),
      children: [
        AppSection(title: 'Overview'),
        const TText(
          'The Flutter Tailwind UI spacing scale is a predefined set of values that helps developers consistently apply margin, padding, width, height, and other spacing-related properties in a design system.\n\nThese values range from `0px` to `384px` and can be accessed as `static const` values from the `TSpace` class. The values scale exponentially and this ensures consistent, scalable, and flexible spacing throughout your designs, enhancing both visual harmony and maintainability.',
        ),
        AppSection(title: 'Spacing Value Reference'),
        AppValueTable(
          header: const [Text('Name'), Text('Pixels'), Text('Tailwind Name')],
          nameWidth: TSpace.v96,
          valueWidth: TSpace.v72,
          valueAlignment: Alignment.center,
          items: items,
        ),
      ],
    );
  }
}
