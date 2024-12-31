// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
TBadge.filled(
  theme: TBadgeTheme.all(
    border: Border.all(color: TColors.sky.shade100),
    backgroundColor: TColors.sky.shade200,
    padding: TOffset.x10 + TOffset.y4,
    borderRadius: TBorderRadius.rounded_none,
    textStyle: TextStyle(color: TColors.sky.shade800).medium,
  ),
  onPressed: () {},
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
      return TColors.sky.shade200;
    }),
    padding: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TOffset.x16 + TOffset.y4;
      }
      return TOffset.x10 + TOffset.y4;
    }),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TBorderRadius.rounded_full;
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
  onPressed: () {},
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
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
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TButtonVariant.values)
      TButton.raw(
        variant: variant,
        color: TColors.indigo,
        leading: const Icon(Icons.arrow_back),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TButtonTrailing]
class _TButtonTrailingSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TButtonVariant.values)
      TButton.raw(
        variant: variant,
        color: TColors.indigo,
        trailing: const Icon(Icons.arrow_forward),
        child: const Text('Button'),
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

/// Source code for [_TButtonLoading]
class _TButtonLoadingSource {
  static const String code = r"""
class _TButtonLoading extends StatefulWidget {
  const _TButtonLoading();

  @override
  State<_TButtonLoading> createState() => _TButtonLoadingState();
}

class _TButtonLoadingState extends State<_TButtonLoading> {
  late final controllers = List.generate(
    TButtonVariant.values.length,
    (_) => TWidgetController(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> onPressed() async {
    for (final controller in controllers) {
      controller.loading = true;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      for (final controller in controllers) {
        controller.loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TButtonVariant.values)
          TButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            child: const Text('Button'),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TButtonDisabled]
class _TButtonDisabledSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TButtonVariant.values)
      TButton.raw(
        variant: variant,
        controller: TWidgetController(disabled: true),
        child: const Text('Button'),
        onPressed: () {},
      ),
  ],
)
""";
}

/// Source code for [_TButtonLoadingCustom]
class _TButtonLoadingCustomSource {
  static const String code = r"""
class _TButtonLoadingCustom extends StatefulWidget {
  const _TButtonLoadingCustom();

  @override
  State<_TButtonLoadingCustom> createState() => _TButtonLoadingCustomState();
}

class _TButtonLoadingCustomState extends State<_TButtonLoadingCustom> {
  late final controllers = List.generate(
    TButtonVariant.values.length,
    (_) => TWidgetController(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> onPressed() async {
    for (final controller in controllers) {
      controller.loading = true;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      for (final controller in controllers) {
        controller.loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TButtonVariant.values)
          TButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            loading: const Icon(Icons.hourglass_bottom_rounded),
            child: const Text('Button'),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TButtonCustomTheme]
class _TButtonCustomThemeSource {
  static const String code = r"""
TButton.filled(
  theme: TButtonTheme.all(
    border: Border.all(color: TColors.sky.shade100),
    backgroundColor: TColors.sky.shade200,
    elevation: TShadow.shadow,
    padding: TOffset.x10 + TOffset.y4,
    borderRadius: TBorderRadius.rounded_none,
    textStyle: TextStyle(color: TColors.sky.shade800).medium,
  ),
  onPressed: () {},
  child: const Text('Button'),
)
""";
}

/// Source code for [_TButtonStatefulTheme]
class _TButtonStatefulThemeSource {
  static const String code = r"""
TButton.filled(
  theme: TButtonTheme(
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
      return TColors.sky.shade200;
    }),
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TShadow.shadow_md;
      }
      return TShadow.shadow;
    }),
    padding: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TOffset.x16 + TOffset.y4;
      }
      return TOffset.x10 + TOffset.y4;
    }),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TBorderRadius.rounded_full;
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
  onPressed: () {},
  child: const Text('Button'),
)
""";
}

/// Source code for [_TButtonIconCompare]
class _TButtonIconCompareSource {
  static const String code = r"""
Column(
  spacing: TSpace.v6,
  children: [
    for (final size in TButtonSize.values)
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: TSpace.v6,
        children: [
          TIconButton.filled(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          TButton.filled(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
            child: const Text('Button'),
          ),
        ],
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonBasic]
class _TIconButtonBasicSource {
  static const String code = r"""
const TIconButton(
  icon: Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonOutlined]
class _TIconButtonOutlinedSource {
  static const String code = r"""
const TIconButton.outlined(
  icon: Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonFilled]
class _TIconButtonFilledSource {
  static const String code = r"""
const TIconButton.filled(
  icon: Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonSoft]
class _TIconButtonSoftSource {
  static const String code = r"""
const TIconButton.soft(
  icon: Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonBasicSizes]
class _TIconButtonBasicSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TIconButton(
        size: size,
        tooltip: '``$size``',
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonOutlinedSizes]
class _TIconButtonOutlinedSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TIconButton.outlined(
        size: size,
        tooltip: '``$size``',
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonFilledSizes]
class _TIconButtonFilledSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TIconButton.filled(
        size: size,
        tooltip: '``$size``',
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonSoftSizes]
class _TIconButtonSoftSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TIconButton.soft(
        size: size,
        tooltip: '``$size``',
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonBasicColors]
class _TIconButtonBasicColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
    ])
      TIconButton(
        color: color,
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonOutlinedColors]
class _TIconButtonOutlinedColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
    ])
      TIconButton.outlined(
        color: color,
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonFilledColors]
class _TIconButtonFilledColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
    ])
      TIconButton.filled(
        color: color,
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonSoftColors]
class _TIconButtonSoftColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in [
      TColors.slate,
      TColors.red,
      TColors.green,
      TColors.blue,
      TColors.yellow,
      TColors.purple,
    ])
      TIconButton.soft(
        color: color,
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonCallback]
class _TIconButtonCallbackSource {
  static const String code = r"""
TIconButton.filled(
  icon: const Icon(Icons.add),
  onPressed: () {
    // Handle button press
  },
  onHover: (isHovered) {
    // Handle button hover
  },
)
""";
}

/// Source code for [_TIconButtonLoading]
class _TIconButtonLoadingSource {
  static const String code = r"""
class _TIconButtonLoading extends StatefulWidget {
  const _TIconButtonLoading();

  @override
  State<_TIconButtonLoading> createState() => _TIconButtonLoadingState();
}

class _TIconButtonLoadingState extends State<_TIconButtonLoading> {
  late final controllers = List.generate(
    TIconButtonVariant.values.length,
    (_) => TWidgetController(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> onPressed() async {
    for (final controller in controllers) {
      controller.loading = true;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      for (final controller in controllers) {
        controller.loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TIconButtonVariant.values)
          TIconButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TIconButtonDisabled]
class _TIconButtonDisabledSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TIconButtonVariant.values)
      TIconButton.raw(
        variant: variant,
        controller: TWidgetController(disabled: true),
        icon: const Icon(Icons.add),
      ),
  ],
)
""";
}

/// Source code for [_TIconButtonLoadingCustom]
class _TIconButtonLoadingCustomSource {
  static const String code = r"""
class _TIconButtonLoadingCustom extends StatefulWidget {
  const _TIconButtonLoadingCustom();

  @override
  State<_TIconButtonLoadingCustom> createState() =>
      _TIconButtonLoadingCustomState();
}

class _TIconButtonLoadingCustomState extends State<_TIconButtonLoadingCustom> {
  late final controllers = List.generate(
    TIconButtonVariant.values.length,
    (_) => TWidgetController(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> onPressed() async {
    for (final controller in controllers) {
      controller.loading = true;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      for (final controller in controllers) {
        controller.loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TIconButtonVariant.values)
          TIconButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            loading: const Icon(Icons.hourglass_bottom_rounded),
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TIconButtonCustomTheme]
class _TIconButtonCustomThemeSource {
  static const String code = r"""
TIconButton.filled(
  theme: TButtonTheme.all(
    border: Border.all(color: TColors.sky.shade100),
    backgroundColor: TColors.sky.shade200,
    elevation: TShadow.shadow,
    padding: TOffset.a6,
    borderRadius: TBorderRadius.rounded_none,
    textStyle: TextStyle(color: TColors.sky.shade800).medium,
  ),
  onPressed: () {},
  icon: const Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonStatefulTheme]
class _TIconButtonStatefulThemeSource {
  static const String code = r"""
TIconButton.filled(
  theme: TButtonTheme(
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
      return TColors.sky.shade200;
    }),
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TShadow.shadow_md;
      }
      return TShadow.shadow;
    }),
    padding: const WidgetStatePropertyAll(TOffset.a6),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return TBorderRadius.rounded_full;
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
  onPressed: () {},
  icon: const Icon(Icons.add),
)
""";
}
