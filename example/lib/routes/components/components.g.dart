// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

part of 'components.dart';

/// Source code for [_TBadgeBasic]
class _TBadgeBasicSource {
  static const String code = r"""
TBadge(
  child: const Text('Badge'),
  onPressed: () {},
)
""";
}

/// Source code for [_TBadgeOutlined]
class _TBadgeOutlinedSource {
  static const String code = r"""
TBadge.outlined(
  child: const Text('Badge'),
  onPressed: () {},
)
""";
}

/// Source code for [_TBadgeFilled]
class _TBadgeFilledSource {
  static const String code = r"""
TBadge.filled(
  child: const Text('Badge'),
  onPressed: () {},
)
""";
}

/// Source code for [_TBadgeSoft]
class _TBadgeSoftSource {
  static const String code = r"""
TBadge.soft(
  child: const Text('Badge'),
  onPressed: () {},
)
""";
}

/// Source code for [_TBadgeBasicSizes]
class _TBadgeBasicSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TBadgeSize.values)
      TBadge(
        size: size,
        tooltip: '``$size``',
        onPressed: () {},
        child: const Text('Badge'),
      ),
  ],
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
        onPressed: () {},
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
        onPressed: () {},
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
        onPressed: () {},
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeBasicColors]
class _TBadgeBasicColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in PREVIEW_COLORS)
      TBadge(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TBadge.outlined(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TBadge.filled(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TBadge.soft(
        color: color,
        onPressed: () {},
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeLeading]
class _TBadgeLeadingSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TVariant.values)
      TBadge.raw(
        variant: variant,
        color: TColors.indigo,
        leading: const Icon(Icons.check),
        onPressed: () {},
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeTrailing]
class _TBadgeTrailingSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TVariant.values)
      TBadge.raw(
        variant: variant,
        color: TColors.indigo,
        trailing: const Icon(Icons.check),
        onPressed: () {},
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeCallback]
class _TBadgeCallbackSource {
  static const String code = r"""
TBadge.filled(
  onPressed: () {
    // Handle badge press
  },
  onHover: (isHovered) {
    // Handle badge hover
  },
  child: const Text('Badge'),
)
""";
}

/// Source code for [_TBadgeLeadingCallback]
class _TBadgeLeadingCallbackSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TVariant.values)
      TBadge.raw(
        variant: variant,
        leading: const Icon(Icons.add),
        tooltipLeading: 'Add',
        onPressedLeading: () {},
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeTrailingCallback]
class _TBadgeTrailingCallbackSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TVariant.values)
      TBadge.raw(
        variant: variant,
        color: TColors.indigo,
        trailing: const Icon(Icons.close),
        tooltipTrailing: 'Remove',
        onPressedTrailing: () {},
        child: const Text('Badge'),
      ),
  ],
)
""";
}

/// Source code for [_TBadgeCustomTheme]
class _TBadgeCustomThemeSource {
  static const String code = r"""
TBadge.filled(
  theme: TBadgeTheme.all(
    backgroundColor: Colors.black,
    border: Border.all(color: TColors.slate),
    borderRadius: TBorderRadius.rounded_none,
    textStyle: const TextStyle(color: Colors.white).medium,
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
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TColors.slate.shade800 : Colors.black;
    }),
    padding: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TOffset.x16 : TOffset.x10;
    }),
    border: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return Border.all(color: TColors.sky, width: 1.5);
      }
      return Border.all(color: TColors.slate);
    }),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      return states.hovered
          ? TBorderRadius.rounded_full
          : TBorderRadius.rounded_none;
    }),
    textStyle: WidgetStateProperty.resolveWith((states) {
      const style = TextStyle(color: Colors.white);
      return states.hovered ? style.semibold : style.medium;
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
TButton(
  onPressed: () {},
  child: const Text('Button'),
)
""";
}

/// Source code for [_TButtonOutlined]
class _TButtonOutlinedSource {
  static const String code = r"""
TButton.outlined(
  onPressed: () {},
  child: const Text('Button'),
)
""";
}

/// Source code for [_TButtonFilled]
class _TButtonFilledSource {
  static const String code = r"""
TButton.filled(
  onPressed: () {},
  child: const Text('Button'),
)
""";
}

/// Source code for [_TButtonSoft]
class _TButtonSoftSource {
  static const String code = r"""
TButton.soft(
  onPressed: () {},
  child: const Text('Button'),
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
        onPressed: () {},
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
        onPressed: () {},
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
        onPressed: () {},
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
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TButton(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TButton.outlined(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TButton.filled(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TButton.soft(
        color: color,
        onPressed: () {},
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
    for (final variant in TVariant.values)
      TButton.raw(
        variant: variant,
        color: TColors.indigo,
        leading: const Icon(Icons.arrow_back),
        onPressed: () {},
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
    for (final variant in TVariant.values)
      TButton.raw(
        variant: variant,
        color: TColors.indigo,
        trailing: const Icon(Icons.arrow_forward),
        onPressed: () {},
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
  final controllers =
      List.generate(TVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TVariant.values)
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
    for (final variant in TVariant.values)
      TButton.raw(
        variant: variant,
        controller: TWidgetController(disabled: true),
        onPressed: () {},
        child: const Text('Button'),
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
  final controllers =
      List.generate(TVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TVariant.values)
          TButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            loading: const Icon(Icons.hourglass_bottom),
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
    height: 32,
    backgroundColor: Colors.black,
    elevation: TShadow.shadow,
    border: Border.all(color: TColors.slate),
    borderRadius: TBorderRadius.rounded_none,
    textStyle: const TextStyle(color: Colors.white).medium,
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
    height: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? 48 : 32;
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TColors.slate.shade800 : Colors.black;
    }),
    elevation: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TShadow.shadow_md : TShadow.shadow;
    }),
    padding: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TOffset.x16 : TOffset.x10;
    }),
    border: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return Border.all(color: TColors.sky, width: 1.5);
      }
      return Border.all(color: TColors.slate);
    }),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      return states.hovered
          ? TBorderRadius.rounded_full
          : TBorderRadius.rounded_none;
    }),
    textStyle: WidgetStateProperty.resolveWith((states) {
      const style = TextStyle(color: Colors.white);
      return states.hovered ? style.semibold : style.medium;
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
TIconButton(
  onPressed: () {},
  icon: const Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonOutlined]
class _TIconButtonOutlinedSource {
  static const String code = r"""
TIconButton.outlined(
  onPressed: () {},
  icon: const Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonFilled]
class _TIconButtonFilledSource {
  static const String code = r"""
TIconButton.filled(
  onPressed: () {},
  icon: const Icon(Icons.add),
)
""";
}

/// Source code for [_TIconButtonSoft]
class _TIconButtonSoftSource {
  static const String code = r"""
TIconButton.soft(
  onPressed: () {},
  icon: const Icon(Icons.add),
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
        onPressed: () {},
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
        onPressed: () {},
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
        onPressed: () {},
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
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TIconButton(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TIconButton.outlined(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TIconButton.filled(
        color: color,
        onPressed: () {},
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
    for (final color in PREVIEW_COLORS)
      TIconButton.soft(
        color: color,
        onPressed: () {},
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
  final controllers =
      List.generate(TVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TVariant.values)
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
    for (final variant in TVariant.values)
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
  final controllers =
      List.generate(TVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TVariant.values)
          TIconButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            loading: const Icon(Icons.hourglass_bottom),
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
    height: 32,
    backgroundColor: Colors.black,
    elevation: TShadow.shadow,
    border: Border.all(color: TColors.slate),
    borderRadius: TBorderRadius.rounded_none,
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
    height: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? 48 : 32;
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TColors.slate.shade800 : Colors.black;
    }),
    elevation: WidgetStateProperty.resolveWith((states) {
      return states.hovered ? TShadow.shadow_md : TShadow.shadow;
    }),
    border: WidgetStateProperty.resolveWith((states) {
      if (states.hovered) {
        return Border.all(color: TColors.sky, width: 1.5);
      }
      return Border.all(color: TColors.slate);
    }),
    borderRadius: WidgetStateProperty.resolveWith((states) {
      return states.hovered
          ? TBorderRadius.rounded_full
          : TBorderRadius.rounded_none;
    }),
  ),
  onPressed: () {},
  icon: const Icon(Icons.add),
)
""";
}

/// Source code for [_TSplitButtonBasic]
class _TSplitButtonBasicSource {
  static const String code = r"""
TSplitButton(
  onPressed: () {},
  onPressedTrailing: () {},
  trailing: const Icon(Icons.keyboard_arrow_down),
  child: const Text('Button'),
)
""";
}

/// Source code for [_TSplitButtonOutlined]
class _TSplitButtonOutlinedSource {
  static const String code = r"""
TSplitButton.outlined(
  onPressed: () {},
  onPressedTrailing: () {},
  trailing: const Icon(Icons.keyboard_arrow_down),
  child: const Text('Button'),
)
""";
}

/// Source code for [_TSplitButtonFilled]
class _TSplitButtonFilledSource {
  static const String code = r"""
TSplitButton.filled(
  onPressed: () {},
  onPressedTrailing: () {},
  trailing: const Icon(Icons.keyboard_arrow_down),
  child: const Text('Button'),
)
""";
}

/// Source code for [_TSplitButtonSoft]
class _TSplitButtonSoftSource {
  static const String code = r"""
TSplitButton.soft(
  onPressed: () {},
  onPressedTrailing: () {},
  trailing: const Icon(Icons.keyboard_arrow_down),
  child: const Text('Button'),
)
""";
}

/// Source code for [_TSplitButtonBasicSizes]
class _TSplitButtonBasicSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TSplitButton(
        size: size,
        tooltip: '``$size``',
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonOutlinedSizes]
class _TSplitButtonOutlinedSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TSplitButton.outlined(
        size: size,
        tooltip: '``$size``',
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonFilledSizes]
class _TSplitButtonFilledSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TSplitButton.filled(
        size: size,
        tooltip: '``$size``',
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonSoftSizes]
class _TSplitButtonSoftSizesSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final size in TButtonSize.values)
      TSplitButton.soft(
        size: size,
        tooltip: '``$size``',
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonBasicColors]
class _TSplitButtonBasicColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in PREVIEW_COLORS)
      TSplitButton(
        color: color,
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonOutlinedColors]
class _TSplitButtonOutlinedColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in PREVIEW_COLORS)
      TSplitButton.outlined(
        color: color,
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonFilledColors]
class _TSplitButtonFilledColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in PREVIEW_COLORS)
      TSplitButton.filled(
        color: color,
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonSoftColors]
class _TSplitButtonSoftColorsSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final color in PREVIEW_COLORS)
      TSplitButton.soft(
        color: color,
        onPressed: () {},
        onPressedTrailing: () {},
        trailing: const Icon(Icons.keyboard_arrow_down),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonNoLeadingTrailing]
class _TSplitButtonNoLeadingTrailingSource {
  static const String code = r"""
TSplitButton.filled(
  child: const Text('Button'),
  onPressed: () {},
  onHover: (value) {},
)
""";
}

/// Source code for [_TSplitButtonLeadingTrailing]
class _TSplitButtonLeadingTrailingSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    TSplitButton.filled(
      onPressed: () {},
      onPressedLeading: () {},
      onHover: (value) {},
      onHoverLeading: (value) {},
      tooltip: 'Child Tooltip',
      tooltipLeading: 'Leading Tooltip',
      controller: TWidgetController(),
      controllerLeading: TWidgetController(),
      leading: const Icon(Icons.add),
      child: const Text('Button'),
    ),
    TSplitButton.filled(
      onPressed: () {},
      onPressedLeading: () {},
      onPressedTrailing: () {},
      onHover: (value) {},
      onHoverLeading: (value) {},
      onHoverTrailing: (value) {},
      tooltip: 'Child Tooltip',
      tooltipLeading: 'Leading Tooltip',
      tooltipTrailing: 'Trailing Tooltip',
      controller: TWidgetController(),
      controllerLeading: TWidgetController(),
      controllerTrailing: TWidgetController(),
      leading: const Icon(Icons.add),
      trailing: const Icon(Icons.remove),
      child: const Text('Button'),
    ),
    TSplitButton.filled(
      onPressed: () {},
      onPressedTrailing: () {},
      onHover: (value) {},
      onHoverTrailing: (value) {},
      tooltip: 'Child Tooltip',
      tooltipTrailing: 'Trailing Tooltip',
      controller: TWidgetController(),
      controllerTrailing: TWidgetController(),
      trailing: const Icon(Icons.remove),
      child: const Text('Button'),
    ),
  ],
)
""";
}

/// Source code for [_TSplitButtonLoading]
class _TSplitButtonLoadingSource {
  static const String code = r"""
class _TSplitButtonLoading extends StatefulWidget {
  const _TSplitButtonLoading();

  @override
  State<_TSplitButtonLoading> createState() => _TSplitButtonLoadingState();
}

class _TSplitButtonLoadingState extends State<_TSplitButtonLoading> {
  final controllers =
      List.generate(TVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TVariant.values)
          TSplitButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controllerTrailing: controllers[variant.index],
            onPressedTrailing: onPressed,
            trailing: const Icon(Icons.download),
            child: const Text('Button'),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TSplitButtonDisabled]
class _TSplitButtonDisabledSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v24,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final variant in TVariant.values)
      TSplitButton.raw(
        variant: variant,
        controller: TWidgetController(disabled: true),
        controllerTrailing: TWidgetController(disabled: true),
        trailing: const Icon(Icons.download),
        child: const Text('Button'),
      ),
  ],
)
""";
}

/// Source code for [_TSplitButtonLoadingCustom]
class _TSplitButtonLoadingCustomSource {
  static const String code = r"""
class _TSplitButtonLoadingCustom extends StatefulWidget {
  const _TSplitButtonLoadingCustom();

  @override
  State<_TSplitButtonLoadingCustom> createState() =>
      _TSplitButtonLoadingCustomState();
}

class _TSplitButtonLoadingCustomState
    extends State<_TSplitButtonLoadingCustom> {
  final controllers =
      List.generate(TVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TVariant.values)
          TSplitButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controllerTrailing: controllers[variant.index],
            onPressedTrailing: onPressed,
            trailing: const Icon(Icons.download),
            loadingTrailing: const Icon(Icons.hourglass_bottom),
            child: const Text('Button'),
          ),
      ],
    );
  }
}
""";
}
