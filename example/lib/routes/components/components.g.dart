// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings

part of 'components.dart';

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

/// Source code for [_TBadgeOutlinedSizes]
class _TBadgeOutlinedSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TBadgeSize.values)
      TBadge.outlined(
        size: size,
        tooltip: '``$size``',
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeFilledSizes]
class _TBadgeFilledSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TBadgeSize.values)
      TBadge.filled(
        size: size,
        tooltip: '``$size``',
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeSoftSizes]
class _TBadgeSoftSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TBadgeSize.values)
      TBadge.soft(
        size: size,
        tooltip: '``$size``',
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeOutlinedColors]
class _TBadgeOutlinedColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TBadge.outlined(
        color: color,
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeFilledColors]
class _TBadgeFilledColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TBadge.filled(
        color: color,
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeSoftColors]
class _TBadgeSoftColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TBadge.soft(
        color: color,
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeLeading]
class _TBadgeLeadingSource {
  static const String code = r"""
const Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    TBadge.outlined(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Badge'),
    ),
    TBadge.filled(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Badge'),
    ),
    TBadge.soft(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Badge'),
    ),
  ],
)
""";
}

/// Source code for [_TBadgeTrailing]
class _TBadgeTrailingSource {
  static const String code = r"""
const Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    TBadge.outlined(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Badge'),
    ),
    TBadge.filled(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Badge'),
    ),
    TBadge.soft(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Badge'),
    ),
  ],
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
final border = Border.all(color: TColors.sky.shade100);
final backgroundColor = TColors.sky.shade50;
final padding = TOffset.x10 + TOffset.y4;
const borderRadius = TBorderRadius.rounded_none;
final textStyle = TextStyle(color: TColors.sky.shade800).medium;
return TBadge.filled(
  theme: TBadgeTheme(
    border: WidgetStateProperty.all(border),
    backgroundColor: WidgetStateProperty.all(backgroundColor),
    padding: WidgetStateProperty.all(padding),
    borderRadius: WidgetStateProperty.all(borderRadius),
    textStyle: WidgetStateProperty.all(textStyle),
  ),
  child: const Text('Badge'),
);
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
const TButton(
  child: Text('Button'),
)
""";
}

/// Source code for [_TButtonOutlined]
class _TButtonOutlinedSource {
  static const String code = r"""
const TButton.outlined(
  child: Text('Button'),
)
""";
}

/// Source code for [_TButtonFilled]
class _TButtonFilledSource {
  static const String code = r"""
const TButton.filled(
  child: Text('Button'),
)
""";
}

/// Source code for [_TButtonSoft]
class _TButtonSoftSource {
  static const String code = r"""
const TButton.soft(
  child: Text('Button'),
)
""";
}

/// Source code for [_TButtonLink]
class _TButtonLinkSource {
  static const String code = r"""
const TButton.link(
  child: Text('Button'),
)
""";
}

/// Source code for [_TButtonBasicSizes]
class _TButtonBasicSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TButton(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonOutlinedSizes]
class _TButtonOutlinedSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TButton.outlined(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonFilledSizes]
class _TButtonFilledSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TButton.filled(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonSoftSizes]
class _TButtonSoftSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TButton.soft(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonLinkSizes]
class _TButtonLinkSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TButton.link(
        size: size,
        tooltip: '``$size``',
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonBasicColors]
class _TButtonBasicColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TButton(
        color: color,
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonOutlinedColors]
class _TButtonOutlinedColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
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
      ),
  ],
)
""";
}

/// Source code for [_TButtonFilledColors]
class _TButtonFilledColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
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
      ),
  ],
)
""";
}

/// Source code for [_TButtonSoftColors]
class _TButtonSoftColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.yellow,
      TColors.green,
      TColors.blue,
      TColors.violet,
    ])
      TButton.soft(
        color: color,
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonLinkColors]
class _TButtonLinkColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
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
      ),
  ],
)
""";
}

/// Source code for [_TButtonLeading]
class _TButtonLeadingSource {
  static const String code = r"""
const Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    TButton(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Button'),
    ),
    TButton.outlined(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Button'),
    ),
    TButton.filled(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Button'),
    ),
    TButton.soft(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Button'),
    ),
    TButton.link(
      color: TColors.indigo,
      leading: Icon(Icons.arrow_back),
      child: Text('Button'),
    ),
  ],
)
""";
}

/// Source code for [_TButtonTrailing]
class _TButtonTrailingSource {
  static const String code = r"""
const Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    TButton(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Button'),
    ),
    TButton.outlined(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Button'),
    ),
    TButton.filled(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Button'),
    ),
    TButton.soft(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Button'),
    ),
    TButton.link(
      color: TColors.indigo,
      trailing: Icon(Icons.arrow_forward),
      child: Text('Button'),
    ),
  ],
)
""";
}

/// Source code for [_TButtonCallback]
class _TButtonCallbackSource {
  static const String code = r"""
TButton.filled(
  child: const Text('Button'),
  onPressed: () {
    // Handle button press
  },
  onHover: (isHovered) {
    // Handle button hover
  },
)
""";
}
