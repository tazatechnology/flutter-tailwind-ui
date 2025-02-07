// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

part of 'components.dart';

/// Source code for [_TBackdropFilterBlur]
class _TBackdropFilterBlurSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 2.0, 4.0, 8.0])
      TBackdropFilter.blur(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterBrightness]
class _TBackdropFilterBrightnessSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.5, 1.0, 1.25, 1.5])
      TBackdropFilter.brightness(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterContrast]
class _TBackdropFilterContrastSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.5, 1.0, 1.25, 2.0])
      TBackdropFilter.contrast(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterGrayscale]
class _TBackdropFilterGrayscaleSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 0.5, 0.75, 1.0])
      TBackdropFilter.grayscale(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterHueRotate]
class _TBackdropFilterHueRotateSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 90.0, 180.0, 270.0])
      TBackdropFilter.hueRotate(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterInvert]
class _TBackdropFilterInvertSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 0.25, 0.75, 1.0])
      TBackdropFilter.invert(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterSaturate]
class _TBackdropFilterSaturateSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.5, 1.0, 1.5, 2.0])
      TBackdropFilter.saturate(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

/// Source code for [_TBackdropFilterSepia]
class _TBackdropFilterSepiaSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 0.5, 0.75, 1.0])
      TBackdropFilter.sepia(
        value: value,
        background: Image.asset('assets/img/reference.jpeg', height: 100),
        child: Container(width: 60, height: 60, color: Colors.white30),
      ),
  ],
)
""";
}

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
  final controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
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
        controller: TWidgetStatesController(disabled: true),
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
  final controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
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
    elevation: TElevation.shadow_sm,
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
      return states.hovered ? TElevation.shadow_md : TElevation.shadow_sm;
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
  child: Text('Card Content'),
)
""";
}

/// Source code for [_TCardElevation]
class _TCardElevationSource {
  static const String code = r"""
const TCard(
  elevation: TElevation.shadow_2xl,
  child: Text('Card Content'),
)
""";
}

/// Source code for [_TCardBorderRadius]
class _TCardBorderRadiusSource {
  static const String code = r"""
const TCard(
  borderRadius: TBorderRadius.rounded_none,
  child: Text('Card Content'),
)
""";
}

/// Source code for [_TCardBorderSide]
class _TCardBorderSideSource {
  static const String code = r"""
const TCard(
  border: BorderSide(color: TColors.indigo, width: 2),
  child: Text('Card Content'),
)
""";
}

/// Source code for [_TCardHeader]
class _TCardHeaderSource {
  static const String code = r"""
TCard(
  header: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Card Heading'),
      TButton.filled(child: Text('Action')),
    ],
  ),
  child: ListView.separated(
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Item'), Text('Item')],
    ),
    separatorBuilder: (context, index) => const Divider(),
  ),
)
""";
}

/// Source code for [_TCardHeaderNoBorder]
class _TCardHeaderNoBorderSource {
  static const String code = r"""
TCard(
  headerBorder: BorderSide.none,
  header: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Card Heading'),
      TButton.filled(child: Text('Action')),
    ],
  ),
  child: ListView.separated(
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Item'), Text('Item')],
    ),
    separatorBuilder: (context, index) => const Divider(),
  ),
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
      animationDuration: const Duration(milliseconds: 200),
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
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
  initialValue: [TSelectionGroupVariant.values.first],
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
  initialValue: [TSelectionGroupVariant.values.first],
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
  initialValue: [TSelectionGroupVariant.values.first],
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
  initialValue: [TSelectionGroupVariant.values.first],
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
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
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
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
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupSeparatedDisabled]
class _TCheckboxGroupSeparatedDisabledSource {
  static const String code = r"""
TCheckboxGroup.separated(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupCardDisabled]
class _TCheckboxGroupCardDisabledSource {
  static const String code = r"""
TCheckboxGroup.card(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxGroupPanelDisabled]
class _TCheckboxGroupPanelDisabledSource {
  static const String code = r"""
TCheckboxGroup.panel(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TCheckboxGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TCheckboxTileActive]
class _TCheckboxTileActiveSource {
  static const String code = r"""
TCheckboxTile(
  title: const Text('Checkbox Tile'),
  description: const Text('This is active.'),
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileActiveDisabled]
class _TCheckboxTileActiveDisabledSource {
  static const String code = r"""
TCheckboxTile(
  title: const Text('Checkbox Tile'),
  description: const Text('This is active and disabled.'),
  enabled: false,
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileInactiveDisabled]
class _TCheckboxTileInactiveDisabledSource {
  static const String code = r"""
TCheckboxTile(
  title: const Text('Checkbox Tile'),
  description: const Text('This is inactive and disabled.'),
  enabled: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileCardActive]
class _TCheckboxTileCardActiveSource {
  static const String code = r"""
TCheckboxTile.card(
  title: const Text('Checkbox Tile'),
  description: const Text('This is active.'),
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileCardActiveDisabled]
class _TCheckboxTileCardActiveDisabledSource {
  static const String code = r"""
TCheckboxTile.card(
  title: const Text('Checkbox Tile'),
  description: const Text('This is active and disabled.'),
  enabled: false,
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileCardInactiveDisabled]
class _TCheckboxTileCardInactiveDisabledSource {
  static const String code = r"""
TCheckboxTile.card(
  title: const Text('Checkbox Tile'),
  description: const Text('This is inactive and disabled.'),
  enabled: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileLeading]
class _TCheckboxTileLeadingSource {
  static const String code = r"""
TCheckboxTile(
  title: const Text('Checkbox Tile'),
  description: const Text('Control is placed at the leading side.'),
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileTrailing]
class _TCheckboxTileTrailingSource {
  static const String code = r"""
TCheckboxTile(
  title: const Text('Checkbox Tile'),
  description: const Text('Control is placed at the trailing side.'),
  affinity: TControlAffinity.trailing,
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileLeadingCard]
class _TCheckboxTileLeadingCardSource {
  static const String code = r"""
TCheckboxTile.card(
  title: const Text('Checkbox Tile'),
  description: const Text('Control is placed at the leading side.'),
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TCheckboxTileTrailingCard]
class _TCheckboxTileTrailingCardSource {
  static const String code = r"""
TCheckboxTile.card(
  title: const Text('Checkbox Tile'),
  description: const Text('Control is placed at the trailing side.'),
  affinity: TControlAffinity.trailing,
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TDialogBasic]
class _TDialogBasicSource {
  static const String code = r"""
TButton.outlined(
  child: const Text('Show Dialog'),
  onPressed: () => TDialog.show<void>(
    context: context,
    builder: (context) {
      return TDialog(
        title: const Text('Register account'),
        content: const Text(
          'Are you sure you want to register your account?',
        ),
        actions: [
          TButton.filled(
            child: const Text('Register'),
            onPressed: () {},
          ),
        ],
      );
    },
  ),
)
""";
}

/// Source code for [_TDialogIcon]
class _TDialogIconSource {
  static const String code = r"""
TButton.outlined(
  child: const Text('Show Dialog with Icon'),
  onPressed: () => TDialog.show<void>(
    context: context,
    builder: (context) {
      return TDialog(
        icon: const Icon(Icons.account_circle, size: TSpace.v32),
        title: const Text('Register account'),
        content: const Text(
          'Are you sure you want to register your account?',
        ),
        actions: [
          TButton.filled(
            child: const Text('Register'),
            onPressed: () {},
          ),
        ],
      );
    },
  ),
)
""";
}

/// Source code for [_TDialogClose]
class _TDialogCloseSource {
  static const String code = r"""
TButton.outlined(
  child: const Text('Show Dialog with Close'),
  onPressed: () => TDialog.show<void>(
    context: context,
    builder: (context) {
      return TDialog(
        showClose: true,
        showCancel: false,
        title: const Text('Register account'),
        content: const Text(
          'Are you sure you want to register your account?',
        ),
        actions: [
          TButton.filled(
            child: const Text('Register'),
            onPressed: () {},
          ),
        ],
      );
    },
  ),
)
""";
}

/// Source code for [_TDialogCustomCancel]
class _TDialogCustomCancelSource {
  static const String code = r"""
TButton.outlined(
  child: const Text('Show Dialog with Cancel'),
  onPressed: () => TDialog.show<void>(
    context: context,
    builder: (context) {
      return TDialog(
        title: const Text('Register account'),
        content: const Text(
          'Are you sure you want to register your account?',
        ),
        cancel: const Row(
          spacing: TSpace.v6,
          children: [
            Icon(Icons.arrow_back, size: 15),
            Text('Back'),
          ],
        ),
        actions: [
          TButton.filled(
            child: const Text('Register'),
            onPressed: () {},
          ),
        ],
      );
    },
  ),
)
""";
}

/// Source code for [_TFilterBlur]
class _TFilterBlurSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 2.0, 4.0, 8.0])
      TFilter.blur(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterBrightness]
class _TFilterBrightnessSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.5, 1.0, 1.25, 1.5])
      TFilter.brightness(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterContrast]
class _TFilterContrastSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.5, 1.0, 1.25, 2.0])
      TFilter.contrast(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterGrayscale]
class _TFilterGrayscaleSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 0.5, 0.75, 1.0])
      TFilter.grayscale(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterHueRotate]
class _TFilterHueRotateSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 90.0, 180.0, 270.0])
      TFilter.hueRotate(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterInvert]
class _TFilterInvertSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 0.25, 0.75, 1.0])
      TFilter.invert(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterSaturate]
class _TFilterSaturateSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.5, 1.0, 1.5, 2.0])
      TFilter.saturate(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFilterSepia]
class _TFilterSepiaSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v20,
  runSpacing: TSpace.v20,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final value in [0.0, 0.5, 0.75, 1.0])
      TFilter.sepia(
        value: value,
        child: Image.asset('assets/img/reference.jpeg', height: 100),
      ),
  ],
)
""";
}

/// Source code for [_TFormBasic]
class _TFormBasicSource {
  static const String code = r"""
class _TFormBasic extends StatefulWidget {
  const _TFormBasic();

  @override
  State<_TFormBasic> createState() => _TFormBasicState();
}

class _TFormBasicState extends State<_TFormBasic> {
  final controller = TFormController();

  @override
  Widget build(BuildContext context) {
    return TForm(
      controller: controller,
      child: Column(
        spacing: TSpace.v24,
        children: [
          TInput(
            labelText: 'Email',
            hintText: 'Enter your email',
            validator: (value) {
              if (value?.contains('@') ?? false) {
                return null;
              }
              return 'Please enter a valid email';
            },
          ),
          TInput(
            labelText: 'Password',
            hintText: 'Enter your password',
            obscure: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          TExpand.width(
            child: TButton.filled(
              onPressed: controller.validate,
              child: const Text('Validate Form'),
            ),
          ),
        ],
      ),
    );
  }
}
""";
}

/// Source code for [_TFormTrackFieldValues]
class _TFormTrackFieldValuesSource {
  static const String code = r"""
class _TFormTrackFieldValues extends StatefulWidget {
  const _TFormTrackFieldValues();

  @override
  State<_TFormTrackFieldValues> createState() => _TFormTrackFieldValuesState();
}

class _TFormTrackFieldValuesState extends State<_TFormTrackFieldValues> {
  final controller = TFormController();

  Future<void> onPressed() async {
    controller.validate();
    final values = controller.getTFormFieldValues();
    await TDialog.show<void>(
      context: context,
      builder: (context) {
        return TDialog(
          title: const Text('Form Field Values'),
          contentTextStyle: TTextStyle.text_md.copyWith(
            color: context.tw.color.body,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final entry in values.entries)
                Column(
                  children: [
                    Row(
                      children: [
                        TText('`${entry.key}`'),
                        const Spacer(),
                        TText('`${entry.value}`'),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TForm(
      controller: controller,
      child: Column(
        spacing: TSpace.v24,
        children: [
          const TInput(
            id: 'email',
            labelText: 'Email',
            initialValue: 'test@example.com',
          ),
          const TInput(
            id: 'password',
            labelText: 'Password',
            initialValue: '123abc',
            obscure: true,
          ),
          TExpand.width(
            child: TButton.filled(
              onPressed: onPressed,
              child: const Text('Get Field Values'),
            ),
          ),
        ],
      ),
    );
  }
}
""";
}

/// Source code for [_TFormAllFields]
class _TFormAllFieldsSource {
  static const String code = r"""
class _TFormAllFields extends StatefulWidget {
  const _TFormAllFields();

  @override
  State<_TFormAllFields> createState() => __TFormAllFieldsState();
}

class __TFormAllFieldsState extends State<_TFormAllFields> {
  final controller = TFormController();

  Future<void> onPressed() async {
    controller.validate();
    final values = controller.getTFormFieldValues();
    await TDialog.show<void>(
      context: context,
      builder: (context) {
        return TDialog(
          title: const Text('Form Field Values'),
          contentTextStyle: TTextStyle.text_md.copyWith(
            color: context.tw.color.body,
          ),
          cancel: const Text('Close'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final entry in values.entries)
                Column(
                  children: [
                    Row(
                      children: [
                        TText('`${entry.key}`'),
                        const Spacer(),
                        TText('`${entry.value}`'),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCard(
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sample Form'),
          TButton.filled(
            size: TWidgetSize.sm,
            onPressed: onPressed,
            child: const Text('Get Values'),
          ),
        ],
      ),
      child: TForm(
        controller: controller,
        child: Column(
          spacing: TSpace.v24,
          children: [
            Row(
              spacing: TSpace.v12,
              children: [
                const Expanded(
                  child: TInput(
                    id: 'id-input',
                    labelText: 'Input',
                    initialValue: 'Bob',
                    hintText: 'Enter your name',
                  ),
                ),
                Expanded(
                  child: TSelect(
                    id: 'id-select',
                    labelText: 'Select',
                    initialValue: 1,
                    items: const [1, 2, 3],
                  ),
                ),
              ],
            ),
            TSlider(
              id: 'id-slider',
              labelText: 'Slider',
              initialValue: 0.75,
            ),
            Row(
              children: [
                Expanded(
                  child: TRadioGroup(
                    id: 'id-radio-group',
                    label: const Text('Radio Group'),
                    initialValue: 2,
                    children: [
                      for (final value in [1, 2, 3])
                        TRadioGroupItem(
                          title: Text(value.toString()),
                          value: value,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: TCheckboxGroup(
                    id: 'id-checkbox-group',
                    label: const Text('Checkbox Group'),
                    initialValue: const [2],
                    children: [
                      for (final value in [1, 2, 3])
                        TCheckboxGroupItem(
                          title: Text(value.toString()),
                          value: value,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            TCheckboxTile.card(
              id: 'id-checkbox-tile',
              title: const Text('Checkbox Tile'),
              affinity: TControlAffinity.trailing,
            ),
            TSwitchTile.card(
              id: 'id-switch-tile',
              title: const Text('Switch Tile'),
              affinity: TControlAffinity.trailing,
            ),
          ],
        ),
      ),
    );
  }
}
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
  final controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
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
        controller: TWidgetStatesController(disabled: true),
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
  final controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
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
    elevation: TElevation.shadow_sm,
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
      return states.hovered ? TElevation.shadow_md : TElevation.shadow_sm;
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

/// Source code for [_TInputSize]
class _TInputSizeSource {
  static const String code = r"""
Column(
  spacing: TSpace.v16,
  children: [
    for (final size in TInputSize.values)
      TInput(
        size: size,
        labelText: 'Email (${size.title})',
        hintText: 'you@example.com',
      ),
  ],
)
""";
}

/// Source code for [_TInputWithLabel]
class _TInputWithLabelSource {
  static const String code = r"""
const TInput(
  labelText: 'Email',
  hintText: 'you@example.com',
)
""";
}

/// Source code for [_TInputWithLabelWidget]
class _TInputWithLabelWidgetSource {
  static const String code = r"""
const TInput(
  label: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Email'),
      TText(
        '* Required',
        style: TextStyle(
          fontWeight: TFontWeight.normal,
          color: TColors.red,
          fontSize: TFontSize.text_xs,
        ),
      ),
    ],
  ),
  hintText: 'you@example.com',
)
""";
}

/// Source code for [_TInputWithHelp]
class _TInputWithHelpSource {
  static const String code = r"""
const TInput(
  labelText: 'Email',
  hintText: 'you@example.com',
  helpText: 'This is a help message.',
)
""";
}

/// Source code for [_TInputWithHelpWidget]
class _TInputWithHelpWidgetSource {
  static const String code = r"""
const TInput(
  labelText: 'Email',
  hintText: 'you@example.com',
  help: TText('This is a help `widget`'),
)
""";
}

/// Source code for [_TInputWithError]
class _TInputWithErrorSource {
  static const String code = r"""
const TInput(
  initialValue: 'invalid-email',
  labelText: 'Email',
  hintText: 'you@example.com',
  errorText: 'This is an error message.',
)
""";
}

/// Source code for [_TInputWithErrorWidget]
class _TInputWithErrorWidgetSource {
  static const String code = r"""
const TInput(
  initialValue: 'invalid-email',
  labelText: 'Email',
  hintText: 'you@example.com',
  error: TText('This is an error `widget`'),
)
""";
}

/// Source code for [_TInputWithDisabledState]
class _TInputWithDisabledStateSource {
  static const String code = r"""
const TInput(
  enabled: false,
  labelText: 'Email',
  hintText: 'Enter your email',
)
""";
}

/// Source code for [_TInputWithReadOnlyState]
class _TInputWithReadOnlyStateSource {
  static const String code = r"""
const TInput(
  readOnly: true,
  initialValue: 'me@example.com',
  labelText: 'Email',
)
""";
}

/// Source code for [_TInputWithIconPrefix]
class _TInputWithIconPrefixSource {
  static const String code = r"""
const TInput(
  labelText: 'Email',
  hintText: 'you@example.com',
  prefix: Icon(Icons.mail_outline, size: 15),
)
""";
}

/// Source code for [_TInputWithIconSuffix]
class _TInputWithIconSuffixSource {
  static const String code = r"""
const TInput(
  obscure: true,
  labelText: 'Password',
  hintText: 'Enter your password',
  suffix: Icon(Icons.security, size: 15),
)
""";
}

/// Source code for [_TInputArea]
class _TInputAreaSource {
  static const String code = r"""
const TInput.area(
  labelText: 'Bio',
  hintText: 'Tell us about yourself',
)
""";
}

/// Source code for [_TInputGallerySubscribe]
class _TInputGallerySubscribeSource {
  static const String code = r"""
class _TInputGallerySubscribe extends StatefulWidget {
  const _TInputGallerySubscribe();

  @override
  State<_TInputGallerySubscribe> createState() =>
      _TInputGallerySubscribeState();
}

class _TInputGallerySubscribeState extends State<_TInputGallerySubscribe> {
  final buttonController = TWidgetStatesController();
  final textController = TextEditingController();

  String? selectedUser = 'User A';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: TScreen.max_w_xs,
          child: TInput(
            controller: textController,
            labelText: 'Email address',
            hintText: 'you@example.com',
            borderRadius:
                const WidgetStatePropertyAll(TBorderRadius.rounded_l_md),
            prefix: const Icon(Icons.mail_outline, size: 15),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        TButton.filled(
          size: TWidgetSize.lg,
          controller: buttonController,
          theme: TStyleTheme.all(
            borderRadius: TBorderRadius.rounded_r_md,
          ),
          child: const Text('Subscribe'),
          onPressed: () {},
        ),
      ],
    );
  }
}
""";
}

/// Source code for [_TPopoverExample]
class _TPopoverExampleSource {
  static const String code = r"""
class _TPopoverExample extends StatefulWidget {
  const _TPopoverExample();

  @override
  State<_TPopoverExample> createState() => _TPopoverExampleState();
}

class _TPopoverExampleState extends State<_TPopoverExample> {
  final controller = TPopoverController();

  @override
  Widget build(BuildContext context) {
    return TPopover(
      controller: controller,
      anchor: TSplitButton.filled(
        trailing: const Icon(Icons.arrow_drop_down, size: 18),
        onPressedTrailing: controller.toggle,
        child: const Text('Actions'),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}
""";
}

/// Source code for [_TPopoverAlignment]
class _TPopoverAlignmentSource {
  static const String code = r"""
class _TPopoverAlignment extends StatefulWidget {
  const _TPopoverAlignment(this.alignment);
  final Alignment alignment;

  @override
  State<_TPopoverAlignment> createState() => _TPopoverAlignmentState();
}

class _TPopoverAlignmentState extends State<_TPopoverAlignment> {
  final controller = TPopoverController();

  @override
  Widget build(BuildContext context) {
    String name = widget.alignment.toString().split('.').last;
    name = name[0].toUpperCase() + name.substring(1);
    return TPopover(
      alignment: widget.alignment,
      controller: controller,
      anchor: SizedBox(
        width: TSpace.v128,
        child: TButton.filled(
          onPressed: controller.toggle,
          child: Text(widget.alignment.title),
        ),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}
""";
}

/// Source code for [_TPopoverAnimationDefault]
class _TPopoverAnimationDefaultSource {
  static const String code = r"""
class _TPopoverAnimationDefault extends StatefulWidget {
  const _TPopoverAnimationDefault();

  @override
  State<_TPopoverAnimationDefault> createState() =>
      _TPopoverAnimationDefaultState();
}

class _TPopoverAnimationDefaultState extends State<_TPopoverAnimationDefault> {
  final controller = TPopoverController();

  @override
  Widget build(BuildContext context) {
    return TPopover(
      controller: controller,
      anchor: SizedBox(
        width: TSpace.v128,
        child: TButton.filled(
          onPressed: controller.toggle,
          child: const Text('Default'),
        ),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}
""";
}

/// Source code for [_TPopoverAnimationNone]
class _TPopoverAnimationNoneSource {
  static const String code = r"""
class _TPopoverAnimationNone extends StatefulWidget {
  const _TPopoverAnimationNone();

  @override
  State<_TPopoverAnimationNone> createState() => _TPopoverAnimationNoneState();
}

class _TPopoverAnimationNoneState extends State<_TPopoverAnimationNone> {
  final controller = TPopoverController();

  @override
  Widget build(BuildContext context) {
    return TPopover(
      controller: controller,
      animationOptions: const TAnimatedOptions.none(),
      anchor: SizedBox(
        width: TSpace.v128,
        child: TButton.filled(
          onPressed: controller.toggle,
          child: const Text('None'),
        ),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}
""";
}

/// Source code for [_TPopoverAnimationCustom]
class _TPopoverAnimationCustomSource {
  static const String code = r"""
class _TPopoverAnimationCustom extends StatefulWidget {
  const _TPopoverAnimationCustom();

  @override
  State<_TPopoverAnimationCustom> createState() =>
      _TPopoverAnimationCustomState();
}

class _TPopoverAnimationCustomState extends State<_TPopoverAnimationCustom> {
  final controller = TPopoverController();

  @override
  Widget build(BuildContext context) {
    return TPopover(
      controller: controller,
      animationOptions: TAnimatedOptions(
        duration: const Duration(milliseconds: 250),
        curveIn: Curves.easeOutExpo,
        curveOut: Curves.easeInOut,
        opacity: Tween(begin: 0, end: 1),
        position: Tween(begin: const Offset(0, 0.5), end: Offset.zero),
        scale: Tween(begin: 0.95, end: 1),
        turns: Tween(begin: 0.95, end: 1),
      ),
      anchor: SizedBox(
        width: TSpace.v128,
        child: TButton.filled(
          onPressed: controller.toggle,
          child: const Text('Custom'),
        ),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}
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
      animationDuration: const Duration(milliseconds: 200),
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: TSelectionGroupVariant.values.first,
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: TSelectionGroupVariant.values.first,
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: TSelectionGroupVariant.values.first,
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: TSelectionGroupVariant.values.first,
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
  initialValue: TSelectionGroupVariant.values.first,
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
  initialValue: TSelectionGroupVariant.values.first,
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
  initialValue: TSelectionGroupVariant.values.first,
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
  initialValue: TSelectionGroupVariant.values.first,
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: 'Small',
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: 'Small',
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: 'Small',
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
  label: const Text('Group Types'),
  description: const Text('Select the card type to use'),
  initialValue: 'Small',
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
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupSeparatedDisabled]
class _TRadioGroupSeparatedDisabledSource {
  static const String code = r"""
TRadioGroup.separated(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupCardDisabled]
class _TRadioGroupCardDisabledSource {
  static const String code = r"""
TRadioGroup.card(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TRadioGroupPanelDisabled]
class _TRadioGroupPanelDisabledSource {
  static const String code = r"""
TRadioGroup.panel(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TRadioGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TSelectSize]
class _TSelectSizeSource {
  static const String code = r"""
Column(
  spacing: TSpace.v16,
  children: [
    for (final size in TInputSize.values)
      TSelect(
        labelText: 'Select Number (${size.title})',
        size: size,
        initialValue: 1,
        items: const [1, 2, 3],
        itemBuilder: (value) => Text(value.toString()),
        selectedItemBuilder: (value) => Text('Selected: $value'),
      ),
  ],
)
""";
}

/// Source code for [_TSelectLabelText]
class _TSelectLabelTextSource {
  static const String code = r"""
TSelect(
  labelText: 'Size',
  items: TWidgetSize.values,
  itemBuilder: (value) => Text(value.name.toUpperCase()),
  selectedItemBuilder: (value) {
    return Text('Selected: ${value.name.toUpperCase()}');
  },
)
""";
}

/// Source code for [_TSelectLabelWidget]
class _TSelectLabelWidgetSource {
  static const String code = r"""
TSelect(
  label: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Size'),
      TText(
        '* Required',
        style: TextStyle(
          fontWeight: TFontWeight.normal,
          color: TColors.red,
          fontSize: TFontSize.text_xs,
        ),
      ),
    ],
  ),
  items: TWidgetSize.values,
  itemBuilder: (value) => Text(value.name.toUpperCase()),
  selectedItemBuilder: (value) {
    return Text('Selected: ${value.name.toUpperCase()}');
  },
)
""";
}

/// Source code for [_TSelectScrollable]
class _TSelectScrollableSource {
  static const String code = r"""
TSelect(
  labelText: 'Select a number (0-1,000)',
  items: List.generate(1000, (ii) => ii),
  itemBuilder: (value) => Text(value.toString()),
  selectedItemBuilder: (value) => Text('Number: $value'),
)
""";
}

/// Source code for [_TSelectEnabled]
class _TSelectEnabledSource {
  static const String code = r"""
TSelect(
  labelText: 'Select a number',
  initialValue: 50,
  items: List.generate(100, (ii) => ii),
  itemBuilder: (value) => Text(value.toString()),
  selectedItemBuilder: (value) => Text('Number: $value'),
)
""";
}

/// Source code for [_TSelectDisabled]
class _TSelectDisabledSource {
  static const String code = r"""
TSelect(
  enabled: false,
  initialValue: 50,
  labelText: 'Select a number',
  items: List.generate(100, (ii) => ii),
  itemBuilder: (value) => Text(value.toString()),
  selectedItemBuilder: (value) => Text('Number: $value'),
)
""";
}

/// Source code for [_TSelectSelectedIconLeading]
class _TSelectSelectedIconLeadingSource {
  static const String code = r"""
TSelect(
  initialValue: 'User B',
  labelText: 'Add a user',
  items: const ['User A', 'User B', 'User C'],
  selectedIcon: const Icon(Icons.circle, size: 10),
  selectedIconAffinity: TControlAffinity.leading,
  itemBuilder: (value) => Text(value),
  selectedItemBuilder: (value) => Text(value),
)
""";
}

/// Source code for [_TSelectSelectedIconTrailing]
class _TSelectSelectedIconTrailingSource {
  static const String code = r"""
TSelect(
  initialValue: 'User B',
  labelText: 'Add a user',
  items: const ['User A', 'User B', 'User C'],
  selectedIcon: const Icon(Icons.circle, size: 10),
  itemBuilder: (value) => Text(value),
  selectedItemBuilder: (value) => Text(value),
)
""";
}

/// Source code for [_TSelectAllowDeselect]
class _TSelectAllowDeselectSource {
  static const String code = r"""
TSelect(
  initialValue: 'User B',
  allowDeselect: true,
  labelText: 'Add a user',
  items: const ['User A', 'User B', 'User C'],
  itemBuilder: (value) => Text(value),
  selectedItemBuilder: (value) => Text(value),
)
""";
}

/// Source code for [_TSelectSearch]
class _TSelectSearchSource {
  static const String code = r"""
TSelect(
  labelText: 'Fruit Selection',
  allowDeselect: true,
  closeOnSelect: false,
  items: const ['apple', 'banana', 'cherry', 'date', 'elderberry'],
  itemBuilder: (value) => Text(value),
  selectedItemBuilder: (value) => Text(value),
  onSearch: (options, term) {
    final optionsLower =
        options.map((option) => option.toLowerCase()).toList();
    return optionsLower
        .where((option) => option.contains(term.toLowerCase()))
        .toList();
  },
)
""";
}

/// Source code for [_TSelectGalleryAddUser]
class _TSelectGalleryAddUserSource {
  static const String code = r"""
class _TSelectGalleryAddUser extends StatefulWidget {
  const _TSelectGalleryAddUser();

  @override
  State<_TSelectGalleryAddUser> createState() => _TSelectGalleryAddUserState();
}

class _TSelectGalleryAddUserState extends State<_TSelectGalleryAddUser> {
  final buttonController = TWidgetStatesController();
  String? selectedUser = 'User A';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: TSelect(
            initialValue: selectedUser,
            allowDeselect: true,
            closeOnSelect: false,
            labelText: 'Add a user',
            items: const ['User A', 'User B', 'User C'],
            placeholder: const Text('Select user'),
            borderRadius: const WidgetStatePropertyAll(
              TBorderRadius.rounded_l_md,
            ),
            itemBuilder: (value) => Text(value),
            selectedItemBuilder: (value) => Text(value),
            onChanged: (value) {
              selectedUser = value;
              buttonController.disabled = selectedUser == null;
            },
          ),
        ),
        TButton.filled(
          size: TWidgetSize.lg,
          controller: buttonController,
          theme: TStyleTheme.all(
            borderRadius: TBorderRadius.rounded_r_md,
          ),
          child: const Text('Add'),
          onPressed: () {},
        ),
      ],
    );
  }
}
""";
}

/// Source code for [_TSliderEnabled]
class _TSliderEnabledSource {
  static const String code = r"""
TSlider(
  initialValue: 0.5,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderDisabled]
class _TSliderDisabledSource {
  static const String code = r"""
TSlider(
  enabled: false,
  initialValue: 0.5,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderEditable]
class _TSliderEditableSource {
  static const String code = r"""
TSlider(
  editable: true,
  initialValue: 0.5,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderLabelText]
class _TSliderLabelTextSource {
  static const String code = r"""
TSlider(
  labelText: 'Slider Label',
  initialValue: 0.5,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderLabelWidget]
class _TSliderLabelWidgetSource {
  static const String code = r"""
TSlider(
  label: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Slider Label'),
      TText(
        '* Required',
        style: TextStyle(
          fontWeight: TFontWeight.normal,
          color: TColors.red,
          fontSize: TFontSize.text_xs,
        ),
      ),
    ],
  ),
  initialValue: 0.5,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderValueLabels]
class _TSliderValueLabelsSource {
  static const String code = r"""
TSlider(
  initialValue: 0.5,
  showValueLabels: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderValueLabelsEditable]
class _TSliderValueLabelsEditableSource {
  static const String code = r"""
TSlider(
  initialValue: 0.5,
  showValueLabels: true,
  editable: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderValueLabelsFormatter]
class _TSliderValueLabelsFormatterSource {
  static const String code = r"""
TSlider(
  initialValue: 0.5,
  showValueLabels: true,
  formatter: (value) => value.toStringAsFixed(3),
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderTooltipCustomize]
class _TSliderTooltipCustomizeSource {
  static const String code = r"""
TSlider(
  initialValue: 0.5,
  tooltipBorderColor: Colors.black,
  tooltipColor: TColors.red.shade900,
  tooltipTextStyle: const TextStyle(color: Colors.white),
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderTooltipFormatter]
class _TSliderTooltipFormatterSource {
  static const String code = r"""
TSlider(
  initialValue: 0.5,
  tooltipFormatter: (value) => 'Current Value: ${value.toStringAsFixed(3)}',
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSliderController]
class _TSliderControllerSource {
  static const String code = r"""
class _TSliderController extends StatefulWidget {
  const _TSliderController();

  @override
  State<_TSliderController> createState() => _TSliderControllerState();
}

class _TSliderControllerState extends State<_TSliderController> {
  final buttonController = TWidgetStatesController();
  final sliderController = TSliderController(initialValue: 0.5);

  @override
  void dispose() {
    buttonController.dispose();
    sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSlider(
          controller: sliderController,
          showValueLabels: true,
          onChanged: (value) {},
        ),
        TSizedBox.y8,
        TButton.outlined(
          controller: buttonController,
          onPressed: () => sliderController.value = 0.5,
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
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
      controller: TWidgetStatesController(),
      controllerLeading: TWidgetStatesController(),
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
      controller: TWidgetStatesController(),
      controllerLeading: TWidgetStatesController(),
      controllerTrailing: TWidgetStatesController(),
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
      controller: TWidgetStatesController(),
      controllerTrailing: TWidgetStatesController(),
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
  final controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
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
        controller: TWidgetStatesController(disabled: true),
        controllerTrailing: TWidgetStatesController(disabled: true),
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
  final controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
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

/// Source code for [_TSwitchActive]
class _TSwitchActiveSource {
  static const String code = r"""
class _TSwitchActive extends StatefulWidget {
  const _TSwitchActive();

  @override
  State<_TSwitchActive> createState() => _TSwitchActiveState();
}

class _TSwitchActiveState extends State<_TSwitchActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
""";
}

/// Source code for [_TSwitchActiveDisabled]
class _TSwitchActiveDisabledSource {
  static const String code = r"""
TSwitch(
  enabled: false,
  value: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchInactiveDisabled]
class _TSwitchInactiveDisabledSource {
  static const String code = r"""
TSwitch(
  enabled: false,
  value: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchColors]
class _TSwitchColorsSource {
  static const String code = r"""
class _TSwitchColors extends StatefulWidget {
  const _TSwitchColors();

  @override
  State<_TSwitchColors> createState() => _TSwitchColorsState();
}

class _TSwitchColorsState extends State<_TSwitchColors> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TSwitch(
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

/// Source code for [_TSwitchIndicator]
class _TSwitchIndicatorSource {
  static const String code = r"""
class _TSwitchIndicator extends StatefulWidget {
  const _TSwitchIndicator();

  @override
  State<_TSwitchIndicator> createState() => _TSwitchIndicatorState();
}

class _TSwitchIndicatorState extends State<_TSwitchIndicator> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: _value,
      indicator: Icon(_value ? Icons.check : Icons.close),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
""";
}

/// Source code for [_TSwitchTileActive]
class _TSwitchTileActiveSource {
  static const String code = r"""
TSwitchTile(
  title: const Text('Switch Tile'),
  description: const Text('This is active.'),
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchTileActiveDisabled]
class _TSwitchTileActiveDisabledSource {
  static const String code = r"""
TSwitchTile(
  title: const Text('Switch Tile'),
  description: const Text('This is active and disabled.'),
  enabled: false,
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchTileInactiveDisabled]
class _TSwitchTileInactiveDisabledSource {
  static const String code = r"""
TSwitchTile(
  title: const Text('Switch Tile'),
  description: const Text('This is inactive and disabled.'),
  enabled: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchTileCardActive]
class _TSwitchTileCardActiveSource {
  static const String code = r"""
TSwitchTile.card(
  title: const Text('Switch Tile'),
  description: const Text('This is active.'),
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchTileCardActiveDisabled]
class _TSwitchTileCardActiveDisabledSource {
  static const String code = r"""
TSwitchTile.card(
  title: const Text('Switch Tile'),
  description: const Text('This is active and disabled.'),
  enabled: false,
  initialValue: true,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchTileCardInactiveDisabled]
class _TSwitchTileCardInactiveDisabledSource {
  static const String code = r"""
TSwitchTile.card(
  title: const Text('Switch Tile'),
  description: const Text('This is inactive and disabled.'),
  enabled: false,
  onChanged: (value) {},
)
""";
}

/// Source code for [_TSwitchTileLeading]
class _TSwitchTileLeadingSource {
  static const String code = r"""
TSwitchTile(
  title: const Text('Switch Tile'),
  description: const Text('Control is placed at the leading side.'),
  initialValue: true,
  onChanged: (value) => {},
)
""";
}

/// Source code for [_TSwitchTileTrailing]
class _TSwitchTileTrailingSource {
  static const String code = r"""
TSwitchTile(
  title: const Text('Switch Tile'),
  description: const Text('Control is placed at the trailing side.'),
  affinity: TControlAffinity.trailing,
  initialValue: true,
  onChanged: (value) => {},
)
""";
}

/// Source code for [_TSwitchTileLeadingCard]
class _TSwitchTileLeadingCardSource {
  static const String code = r"""
TSwitchTile.card(
  title: const Text('Switch Tile'),
  description: const Text('Control is placed at the leading side.'),
  initialValue: true,
  onChanged: (value) => {},
)
""";
}

/// Source code for [_TSwitchTileTrailingCard]
class _TSwitchTileTrailingCardSource {
  static const String code = r"""
TSwitchTile.card(
  title: const Text('Switch Tile'),
  description: const Text('Control is placed at the trailing side.'),
  affinity: TControlAffinity.trailing,
  initialValue: true,
  onChanged: (value) => {},
)
""";
}

/// Source code for [_TSwitchGroupBasic]
class _TSwitchGroupBasicSource {
  static const String code = r"""
TSwitchGroup(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupSeparated]
class _TSwitchGroupSeparatedSource {
  static const String code = r"""
TSwitchGroup.separated(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupCard]
class _TSwitchGroupCardSource {
  static const String code = r"""
TSwitchGroup.card(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupPanel]
class _TSwitchGroupPanelSource {
  static const String code = r"""
TSwitchGroup.panel(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupBasicTrailing]
class _TSwitchGroupBasicTrailingSource {
  static const String code = r"""
TSwitchGroup(
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupSeparatedTrailing]
class _TSwitchGroupSeparatedTrailingSource {
  static const String code = r"""
TSwitchGroup.separated(
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupCardTrailing]
class _TSwitchGroupCardTrailingSource {
  static const String code = r"""
TSwitchGroup.card(
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupPanelTrailing]
class _TSwitchGroupPanelTrailingSource {
  static const String code = r"""
TSwitchGroup.panel(
  initialValue: [TSelectionGroupVariant.values.first],
  onChanged: (value) {},
  affinity: TControlAffinity.trailing,
  children: [
    for (final variant in TSelectionGroupVariant.values)
      TSwitchGroupItem(
        title: Text(variant.title),
        description: Text('Creates a ${variant.name} switch group'),
        value: variant,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupBasicHorizontal]
class _TSwitchGroupBasicHorizontalSource {
  static const String code = r"""
TSwitchGroup(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupSeparatedHorizontal]
class _TSwitchGroupSeparatedHorizontalSource {
  static const String code = r"""
TSwitchGroup.separated(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupCardHorizontal]
class _TSwitchGroupCardHorizontalSource {
  static const String code = r"""
TSwitchGroup.card(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupPanelHorizontal]
class _TSwitchGroupPanelHorizontalSource {
  static const String code = r"""
TSwitchGroup.panel(
  label: const Text('Group Types'),
  description: const Text('Select the group type to use'),
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  axis: Axis.horizontal,
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupBasicDisabled]
class _TSwitchGroupBasicDisabledSource {
  static const String code = r"""
TSwitchGroup(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupSeparatedDisabled]
class _TSwitchGroupSeparatedDisabledSource {
  static const String code = r"""
TSwitchGroup.separated(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupCardDisabled]
class _TSwitchGroupCardDisabledSource {
  static const String code = r"""
TSwitchGroup.card(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
""";
}

/// Source code for [_TSwitchGroupPanelDisabled]
class _TSwitchGroupPanelDisabledSource {
  static const String code = r"""
TSwitchGroup.panel(
  initialValue: const ['Alpha'],
  onChanged: (value) {},
  children: [
    for (final item in ['Alpha', 'Beta', 'Gamma'])
      TSwitchGroupItem(
        title: Text(item),
        value: item,
        enabled: item != 'Beta',
      ),
  ],
)
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
