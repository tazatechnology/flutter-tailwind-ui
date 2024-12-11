// ignore_for_file: unnecessary_raw_strings
// Generated code - do not modify by hand

part of 'components.dart';

/// Source code for [_TBadgeBasic]
class _TBadgeBasicSource {
  static const String code = r"""
const TBadge(
  child: Text('Badge'),
)
""";
}

/// Source code for [_TBadgeOutlined]
class _TBadgeOutlinedSource {
  static const String code = r"""
const TBadge.outlined(
  child: Text('Badge'),
)
""";
}

/// Source code for [_TBadgeFilled]
class _TBadgeFilledSource {
  static const String code = r"""
const TBadge.filled(
  child: Text('Badge'),
)
""";
}

/// Source code for [_TBadgeSoft]
class _TBadgeSoftSource {
  static const String code = r"""
const TBadge.soft(
  child: Text('Badge'),
)
""";
}

/// Source code for [_TBadgeBasicSizes]
class _TBadgeBasicSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v32,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.end,
  children: [
    for (final size in TBadgeSize.values)
      TBadge(
        size: size,
        tooltip: '``$size``',
        child: const Text('Badge'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TBadgeLeading]
class _TBadgeLeadingSource {
  static const String code = r"""
const TBadge.filled(
  leading: Icon(Icons.circle, size: 6, color: TColors.indigo),
  child: Text('Badge'),
)
""";
}

/// Source code for [_TBadgeCallback]
class _TBadgeCallbackSource {
  static const String code = r"""
TBadge.filled(
  child: const Text('Badge'),
  onPressed: () {
    // Handle badge press
  },
  onHover: (isHovered) {
    // Handle badge hover
  },
)
""";
}

/// Source code for [_TBadgeCustomTheme]
class _TBadgeCustomThemeSource {
  static const String code = r"""
TBadge.filled(
  theme: TBadgeTheme(
    border:
        WidgetStateProperty.all(Border.all(color: TColors.sky.shade100)),
    backgroundColor: WidgetStateProperty.all(TColors.sky.shade50),
    padding: WidgetStateProperty.all(TOffset.x10 + TOffset.y4),
    borderRadius: WidgetStateProperty.all(TBorderRadius.rounded_none),
    textStyle: WidgetStateProperty.all(
      TextStyle(color: TColors.sky.shade800).medium,
    ),
  ),
  child: const Text('Badge'),
)
""";
}

/// Source code for [_TBadgeStatefulTheme]
class _TBadgeStatefulThemeSource {
  static const String code = r"""
TBadge.filled(
  theme: TBadgeTheme(
    animationDuration: const Duration(milliseconds: 250),
    border: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return Border.all(color: TColors.sky);
      }
      return Border.all(color: TColors.sky.shade100);
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TColors.sky.shade100;
      }
      return TColors.sky.shade50;
    }),
    padding: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TOffset.x16 + TOffset.y4;
      }
      return TOffset.x10 + TOffset.y4;
    }),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TBorderRadius.rounded_2xl;
      }
      return TBorderRadius.rounded_none;
    }),
    textStyle: WidgetStateProperty.resolveWith((states) {
      final style = TextStyle(color: TColors.sky.shade800).medium;
      if (states.hovered) {
        return style.semibold;
      }
      return style.medium;
    }),
  ),
  child: const Text('Badge'),
)
""";
}

/// Source code for [_TButtonBasic]
class _TButtonBasicSource {
  static const String code = r"""
TButton(
  child: const Text('Button'),
  onPressed: () {},
)
""";
}

/// Source code for [_TButtonLink]
class _TButtonLinkSource {
  static const String code = r"""
TButton.link(
  child: const Text('Button'),
  onPressed: () {},
)
""";
}

/// Source code for [_TButtonFilled]
class _TButtonFilledSource {
  static const String code = r"""
TButton.filled(
  child: const Text('Button'),
  onPressed: () {},
)
""";
}

/// Source code for [_TButtonOutlined]
class _TButtonOutlinedSource {
  static const String code = r"""
TButton.outlined(
  child: const Text('Button'),
  onPressed: () {},
)
""";
}

/// Source code for [_TButtonBasicSizes]
class _TButtonBasicSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v32,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.end,
  children: [
    for (final size in TButtonSize.values)
      TButton(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonLinkSizes]
class _TButtonLinkSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v32,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.end,
  children: [
    for (final size in TButtonSize.values)
      TButton.link(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonFilledSizes]
class _TButtonFilledSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v32,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.end,
  children: [
    for (final size in TButtonSize.values)
      TButton.filled(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonOutlinedSizes]
class _TButtonOutlinedSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v32,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.end,
  children: [
    for (final size in TButtonSize.values)
      TButton.outlined(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonLinkColors]
class _TButtonLinkColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  children: [
    for (final color in [
      Colors.black,
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TButton.link(
        color: color,
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonFilledColors]
class _TButtonFilledColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  children: [
    for (final color in [
      Colors.black,
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TButton.filled(
        color: color,
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonOutlinedColors]
class _TButtonOutlinedColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  children: [
    for (final color in [
      Colors.black,
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TButton.outlined(
        color: color,
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}
