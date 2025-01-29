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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
  theme: TStyleTheme.all(
    backgroundColor: Colors.black,
    border: Border.all(color: TColors.slate),
    borderRadius: TBorderRadius.rounded_none,
    textStyle: const TextStyle(
      fontWeight: TFontWeight.medium,
      color: Colors.white,
    ),
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
  theme: TStyleTheme(
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
      return TextStyle(
        color: Colors.white,
        fontWeight:
            states.hovered ? TFontWeight.semibold : TFontWeight.medium,
      );
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
      List.generate(TStyleVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
      List.generate(TStyleVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TStyleVariant.values)
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
  theme: TStyleTheme.all(
    height: 32,
    backgroundColor: Colors.black,
    elevation: TShadow.shadow,
    border: Border.all(color: TColors.slate),
    borderRadius: TBorderRadius.rounded_none,
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: TFontWeight.medium,
    ),
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
  theme: TStyleTheme(
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
      return TextStyle(
        color: Colors.white,
        fontWeight:
            states.hovered ? TFontWeight.semibold : TFontWeight.medium,
      );
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
    for (final size in TWidgetSize.values)
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

/// Source code for [_TCardBasic]
class _TCardBasicSource {
  static const String code = r"""
const TCard(
  child: Text('Example Card'),
)
""";
}

/// Source code for [_TCheckboxActive]
class _TCheckboxActiveSource {
  static const String code = r"""
class _TCheckboxActive extends StatefulWidget {
  const _TCheckboxActive();

  @override
  State<_TCheckboxActive> createState() => _TCheckboxActiveState();
}

class _TCheckboxActiveState extends State<_TCheckboxActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TCheckbox(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
""";
}

/// Source code for [_TCheckboxActiveDisabled]
class _TCheckboxActiveDisabledSource {
  static const String code = r"""
TCheckbox(
  enabled: false,
  value: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxInactiveDisabled]
class _TCheckboxInactiveDisabledSource {
  static const String code = r"""
TCheckbox(
  enabled: false,
  value: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxColors]
class _TCheckboxColorsSource {
  static const String code = r"""
class _TCheckboxColors extends StatefulWidget {
  const _TCheckboxColors();

  @override
  State<_TCheckboxColors> createState() => _TCheckboxColorsState();
}

class _TCheckboxColorsState extends State<_TCheckboxColors> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TCheckbox(
            color: color,
            value: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TCheckboxIndicator]
class _TCheckboxIndicatorSource {
  static const String code = r"""
class _TCheckboxIndicator extends StatefulWidget {
  const _TCheckboxIndicator();

  @override
  State<_TCheckboxIndicator> createState() => _TCheckboxIndicatorState();
}

class _TCheckboxIndicatorState extends State<_TCheckboxIndicator> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TCheckbox(
      value: _value,
      indicator: const Icon(Icons.star),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
""";
}

/// Source code for [_TCheckboxGroupBasic]
class _TCheckboxGroupBasicSource {
  static const String code = r"""
TCheckboxGroup(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupSeparated]
class _TCheckboxGroupSeparatedSource {
  static const String code = r"""
TCheckboxGroup.separated(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupCard]
class _TCheckboxGroupCardSource {
  static const String code = r"""
TCheckboxGroup.card(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupPanel]
class _TCheckboxGroupPanelSource {
  static const String code = r"""
TCheckboxGroup.panel(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupBasicTrailing]
class _TCheckboxGroupBasicTrailingSource {
  static const String code = r"""
TCheckboxGroup(
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupSeparatedTrailing]
class _TCheckboxGroupSeparatedTrailingSource {
  static const String code = r"""
TCheckboxGroup.separated(
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupCardTrailing]
class _TCheckboxGroupCardTrailingSource {
  static const String code = r"""
TCheckboxGroup.card(
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupPanelTrailing]
class _TCheckboxGroupPanelTrailingSource {
  static const String code = r"""
TCheckboxGroup.panel(
  groupValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TCheckboxGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} checkbox group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupBasicHorizontal]
class _TCheckboxGroupBasicHorizontalSource {
  static const String code = r"""
TCheckboxGroup(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: const ['Read'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupSeparatedHorizontal]
class _TCheckboxGroupSeparatedHorizontalSource {
  static const String code = r"""
TCheckboxGroup.separated(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: const ['Read'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupCardHorizontal]
class _TCheckboxGroupCardHorizontalSource {
  static const String code = r"""
TCheckboxGroup.card(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: const ['Read'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupPanelHorizontal]
class _TCheckboxGroupPanelHorizontalSource {
  static const String code = r"""
TCheckboxGroup.panel(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: const ['Read'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupBasicDisabled]
class _TCheckboxGroupBasicDisabledSource {
  static const String code = r"""
TCheckboxGroup(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupSeparatedDisabled]
class _TCheckboxGroupSeparatedDisabledSource {
  static const String code = r"""
TCheckboxGroup.separated(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupCardDisabled]
class _TCheckboxGroupCardDisabledSource {
  static const String code = r"""
TCheckboxGroup.card(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupPanelDisabled]
class _TCheckboxGroupPanelDisabledSource {
  static const String code = r"""
TCheckboxGroup.panel(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
      List.generate(TStyleVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
      List.generate(TStyleVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TStyleVariant.values)
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
  theme: TStyleTheme.all(
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
  theme: TStyleTheme(
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

/// Source code for [_TRadioActive]
class _TRadioActiveSource {
  static const String code = r"""
class _TRadioActive extends StatefulWidget {
  const _TRadioActive();

  @override
  State<_TRadioActive> createState() => _TRadioActiveState();
}

class _TRadioActiveState extends State<_TRadioActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TRadio(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
""";
}

/// Source code for [_TRadioActiveDisabled]
class _TRadioActiveDisabledSource {
  static const String code = r"""
TRadio(
  enabled: false,
  value: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TRadioInactiveDisabled]
class _TRadioInactiveDisabledSource {
  static const String code = r"""
TRadio(
  enabled: false,
  value: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TRadioColors]
class _TRadioColorsSource {
  static const String code = r"""
class _TRadioColors extends StatefulWidget {
  const _TRadioColors();

  @override
  State<_TRadioColors> createState() => _TRadioColorsState();
}

class _TRadioColorsState extends State<_TRadioColors> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TRadio(
            color: color,
            value: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
      ],
    );
  }
}
""";
}

/// Source code for [_TRadioIndicator]
class _TRadioIndicatorSource {
  static const String code = r"""
class _TRadioIndicator extends StatefulWidget {
  const _TRadioIndicator();

  @override
  State<_TRadioIndicator> createState() => _TRadioIndicatorState();
}

class _TRadioIndicatorState extends State<_TRadioIndicator> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TRadio(
      value: _value,
      indicator: const Icon(Icons.star),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
""";
}

/// Source code for [_TRadioGroupBasic]
class _TRadioGroupBasicSource {
  static const String code = r"""
TRadioGroup(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupSeparated]
class _TRadioGroupSeparatedSource {
  static const String code = r"""
TRadioGroup.separated(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupCard]
class _TRadioGroupCardSource {
  static const String code = r"""
TRadioGroup.card(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupPanel]
class _TRadioGroupPanelSource {
  static const String code = r"""
TRadioGroup.panel(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupBasicTrailing]
class _TRadioGroupBasicTrailingSource {
  static const String code = r"""
TRadioGroup(
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupSeparatedTrailing]
class _TRadioGroupSeparatedTrailingSource {
  static const String code = r"""
TRadioGroup.separated(
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupCardTrailing]
class _TRadioGroupCardTrailingSource {
  static const String code = r"""
TRadioGroup.card(
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupPanelTrailing]
class _TRadioGroupPanelTrailingSource {
  static const String code = r"""
TRadioGroup.panel(
  groupValue: TSelectionGroupVariant.values.first,
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TRadioGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} radio group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupBasicHorizontal]
class _TRadioGroupBasicHorizontalSource {
  static const String code = r"""
TRadioGroup(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: 'Small',
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Small', 'Medium', 'Large'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupSeparatedHorizontal]
class _TRadioGroupSeparatedHorizontalSource {
  static const String code = r"""
TRadioGroup.separated(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: 'Small',
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Small', 'Medium', 'Large'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupCardHorizontal]
class _TRadioGroupCardHorizontalSource {
  static const String code = r"""
TRadioGroup.card(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: 'Small',
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Small', 'Medium', 'Large'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupPanelHorizontal]
class _TRadioGroupPanelHorizontalSource {
  static const String code = r"""
TRadioGroup.panel(
  title: const Text('Card Types'),
  description: const Text('Select the card type to use'),
  groupValue: 'Small',
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Small', 'Medium', 'Large'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupBasicDisabled]
class _TRadioGroupBasicDisabledSource {
  static const String code = r"""
TRadioGroup(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupSeparatedDisabled]
class _TRadioGroupSeparatedDisabledSource {
  static const String code = r"""
TRadioGroup.separated(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupCardDisabled]
class _TRadioGroupCardDisabledSource {
  static const String code = r"""
TRadioGroup.card(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupPanelDisabled]
class _TRadioGroupPanelDisabledSource {
  static const String code = r"""
TRadioGroup.panel(
  groupValue: const ['Read'],
  onChanged: (value) {},
  children: [
    for (final item in ['Read', 'Write', 'Execute'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Write',
      ),
  ],
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
    for (final size in TWidgetSize.values)
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
      List.generate(TStyleVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TStyleVariant.values)
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
    for (final variant in TStyleVariant.values)
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
      List.generate(TStyleVariant.values.length, (_) => TWidgetController());

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
        for (final variant in TStyleVariant.values)
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

/// Source code for [_TTextBold]
class _TTextBoldSource {
  static const String code = r"""
const TText(
  'These are all bold: **text**, __text__, <strong>text</strong>.',
)
""";
}

/// Source code for [_TTextItalic]
class _TTextItalicSource {
  static const String code = r"""
const TText(
  'These are all italic: *text*, _text_, <em>text</em>.',
)
""";
}

/// Source code for [_TTextUnderline]
class _TTextUnderlineSource {
  static const String code = r"""
const TText(
  'These are all underlined: <u>text</u>, <ins>text</ins>.',
)
""";
}

/// Source code for [_TTextMonospace]
class _TTextMonospaceSource {
  static const String code = r"""
const TText(
  'These are all monospace: ``text``, <mono>text</mono>.',
)
""";
}

/// Source code for [_TTextCode]
class _TTextCodeSource {
  static const String code = r"""
const TText(
  'These are all code: `text`, <code>text</code>.',
)
""";
}

/// Source code for [_TTextLink]
class _TTextLinkSource {
  static const String code = r"""
const Column(
  children: [
    TText(
      'This is a [link](https://pub.dev/packages/flutter_tailwind_ui) to the pub.dev page this project.',
    ),
    TText(
      'This is a [link](/font-family) to an internal route of this app.',
    ),
  ],
)
""";
}

/// Source code for [_TTextBoldItalic]
class _TTextBoldItalicSource {
  static const String code = r"""
const Column(
  children: [
    TText(
      'This _**text**_ is bold and italic - order does not matter.',
    ),
    TText(
      'This **_text_** is bold and italic - order does not matter.',
    ),
  ],
)
""";
}

/// Source code for [_TTextFormattedCode]
class _TTextFormattedCodeSource {
  static const String code = r"""
const Column(
  children: [
    TText(
      'This **`text`** is bold code - order <u>does</u> matter here.',
    ),
    TText(
      'This `**text**` is bold code - order <u>does</u> matter here.',
    ),
  ],
)
""";
}

/// Source code for [_TTextFormattedLink]
class _TTextFormattedLinkSource {
  static const String code = r"""
const Column(
  children: [
    TText(
      'This **[text](https://pub.dev)** is a bold link - order does not matter.',
    ),
    TText(
      'This [**text**](https://pub.dev) is a bold link - order does not matter.',
    ),
  ],
)
""";
}

/// Source code for [_TTextCustomStyle]
class _TTextCustomStyleSource {
  static const String code = r"""
TText(
  'This a custom formatter to create <red>colored</red> text',
  formatters: [
    TRichFormatter(
      regex: [RegExp(r'<red>(.*?)<\/red>')],
      style: const TextStyle(color: TColors.red),
    ),
  ],
)
""";
}

/// Source code for [_TTextCustomStyleBuilderAdvanced]
class _TTextCustomStyleBuilderAdvancedSource {
  static const String code = r"""
TText(
  'This a custom formatter to add an inline <my-button>action</my-button> span',
  formatters: [
    TRichFormatter(
      regex: [RegExp(r'<my-button>(.*?)<\/my-button>')],
      builder: (match) {
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: TButton.outlined(
            size: TWidgetSize.xs,
            selectableText: true,
            tooltip: 'Click Me',
            theme: TStyleTheme(
              animationDuration: const Duration(milliseconds: 100),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              borderRadius: WidgetStateProperty.resolveWith((states) {
                if (states.hovered) {
                  return TBorderRadius.rounded_full;
                } else {
                  return TBorderRadius.rounded_md;
                }
              }),
              textStyle: WidgetStateProperty.all(
                const TextStyle(color: TColors.sky),
              ),
            ),
            child: Text(match.textMatch),
            onPressed: () {},
          ),
        );
      },
    ),
  ],
)
""";
}
