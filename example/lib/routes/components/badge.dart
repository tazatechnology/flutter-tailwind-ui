part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTBadge
// =============================================================================

class ComponentRouteTBadge extends StatelessWidget {
  const ComponentRouteTBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TBadge',
      description: 'A full customizable badge widget',
      children: [
        AppSection(
          title: 'Badge Types',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TBadgeBasicSource.code,
              child: _TBadgeBasic(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TBadgeOutlinedSource.code,
              child: _TBadgeOutlined(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TBadgeFilledSource.code,
              child: _TBadgeFilled(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TBadgeSoftSource.code,
              child: _TBadgeSoft(),
            ),
          ],
        ),
        AppSection(
          title: 'Badge Sizes',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TBadgeBasicSizesSource.code,
              child: _TBadgeBasicSizes(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TBadgeOutlinedSizesSource.code,
              child: _TBadgeOutlinedSizes(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TBadgeFilledSizesSource.code,
              child: _TBadgeFilledSizes(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TBadgeSoftSizesSource.code,
              child: _TBadgeSoftSizes(),
            ),
          ],
        ),
        AppSection(
          title: 'Badge Colors',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TBadgeBasicColorsSource.code,
              child: _TBadgeBasicColors(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TBadgeOutlinedColorsSource.code,
              child: _TBadgeOutlinedColors(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TBadgeFilledColorsSource.code,
              child: _TBadgeFilledColors(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TBadgeSoftColorsSource.code,
              child: _TBadgeSoftColors(),
            ),
          ],
        ),
        AppSection(
          title: 'Badge with Leading',
          children: const [
            AppPreviewCard(
              title: 'Custom leading widget',
              description:
                  'Note that icon is automatically styled to match the dynamic badge theme.',
              code: _TBadgeLeadingSource.code,
              child: _TBadgeLeading(),
            ),
          ],
        ),
        AppSection(
          title: 'Badge with Trailing',
          children: const [
            AppPreviewCard(
              title: 'Custom trailing widget',
              description:
                  'Note that icon is automatically styled to match the dynamic badge theme.',
              code: _TBadgeTrailingSource.code,
              child: _TBadgeTrailing(),
            ),
          ],
        ),
        AppSection(
          title: 'Badge with Callbacks',
          children: const [
            AppPreviewCard(
              title: 'Custom gesture callbacks',
              description:
                  '`TBadge` supports `onPressed` and `onHover` callbacks.',
              code: _TBadgeCallbackSource.code,
              child: _TBadgeCallback(),
            ),
            AppPreviewCard(
              title: 'Custom gesture callbacks (leading)',
              description:
                  'Leading widgets can have their own gesture callbacks.',
              code: _TBadgeLeadingCallbackSource.code,
              child: _TBadgeLeadingCallback(),
            ),
            AppPreviewCard(
              title: 'Custom gesture callbacks (trailing)',
              description:
                  'Trailing widgets can have their own gesture callbacks.',
              code: _TBadgeTrailingCallbackSource.code,
              child: _TBadgeTrailingCallback(),
            ),
          ],
        ),
        AppSection(
          title: 'Custom badge theming',
          children: const [
            AppPreviewCard(
              title: 'Static theme (``TBadgeTheme``)',
              description:
                  'All theming is powered by the Flutter `WidgetStateProperty` interface. If the you have no need dynamic theming, you can simply pass your styles to the  `TBadgeTheme.all()` factory constructor which calls `WidgetStateProperty.all()` under the hood for all stateful properties.',
              code: _TBadgeCustomThemeSource.code,
              child: _TBadgeCustomTheme(),
            ),
            AppPreviewCard(
              title: 'Stateful theme (``TBadgeTheme``)',
              description:
                  'For full theme control, you can use the `WidgetStateProperty.resolveWith()` method to dynamically change the badge theme based on the current `WidgetState`.',
              code: _TBadgeStatefulThemeSource.code,
              child: _TBadgeStatefulTheme(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBadgeBasic
// =============================================================================

@GenerateSource()
class _TBadgeBasic extends StatelessWidget {
  const _TBadgeBasic();

  @override
  Widget build(BuildContext context) {
    return TBadge(
      child: const Text('Badge'),
      onPressed: () {},
    );
  }
}

// =============================================================================
// CLASS: _TBadgeOutlined
// =============================================================================

@GenerateSource()
class _TBadgeOutlined extends StatelessWidget {
  const _TBadgeOutlined();

  @override
  Widget build(BuildContext context) {
    return TBadge.outlined(
      child: const Text('Badge'),
      onPressed: () {},
    );
  }
}

// =============================================================================
// CLASS: _TBadgeFilled
// =============================================================================

@GenerateSource()
class _TBadgeFilled extends StatelessWidget {
  const _TBadgeFilled();

  @override
  Widget build(BuildContext context) {
    return TBadge.filled(
      child: const Text('Badge'),
      onPressed: () {},
    );
  }
}

// =============================================================================
// CLASS: _TBadgeSoft
// =============================================================================

@GenerateSource()
class _TBadgeSoft extends StatelessWidget {
  const _TBadgeSoft();

  @override
  Widget build(BuildContext context) {
    return TBadge.soft(
      child: const Text('Badge'),
      onPressed: () {},
    );
  }
}

// =============================================================================
// CLASS: _TBadgeBasicSizes
// =============================================================================

@GenerateSource()
class _TBadgeBasicSizes extends StatelessWidget {
  const _TBadgeBasicSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeOutlinedSizes
// =============================================================================

@GenerateSource()
class _TBadgeOutlinedSizes extends StatelessWidget {
  const _TBadgeOutlinedSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeFilledSizes
// =============================================================================

@GenerateSource()
class _TBadgeFilledSizes extends StatelessWidget {
  const _TBadgeFilledSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeFilledSizes
// =============================================================================

@GenerateSource()
class _TBadgeSoftSizes extends StatelessWidget {
  const _TBadgeSoftSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeBasicColors
// =============================================================================

@GenerateSource()
class _TBadgeBasicColors extends StatelessWidget {
  const _TBadgeBasicColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeOutlinedColors
// =============================================================================

@GenerateSource()
class _TBadgeOutlinedColors extends StatelessWidget {
  const _TBadgeOutlinedColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeFilledColors
// =============================================================================

@GenerateSource()
class _TBadgeFilledColors extends StatelessWidget {
  const _TBadgeFilledColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeSoftColors
// =============================================================================

@GenerateSource()
class _TBadgeSoftColors extends StatelessWidget {
  const _TBadgeSoftColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeLeading
// =============================================================================

@GenerateSource()
class _TBadgeLeading extends StatelessWidget {
  const _TBadgeLeading();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeTrailing
// =============================================================================

@GenerateSource()
class _TBadgeTrailing extends StatelessWidget {
  const _TBadgeTrailing();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeCallback
// =============================================================================

@GenerateSource()
class _TBadgeCallback extends StatelessWidget {
  const _TBadgeCallback();

  @override
  Widget build(BuildContext context) {
    return TBadge.filled(
      onPressed: () {
        // Handle badge press
      },
      onHover: (isHovered) {
        // Handle badge hover
      },
      child: const Text('Badge'),
    );
  }
}

// =============================================================================
// CLASS: _TBadgeLeadingCallback
// =============================================================================

@GenerateSource()
class _TBadgeLeadingCallback extends StatelessWidget {
  const _TBadgeLeadingCallback();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeTrailingCallback
// =============================================================================

@GenerateSource()
class _TBadgeTrailingCallback extends StatelessWidget {
  const _TBadgeTrailingCallback();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBadgeCustomTheme
// =============================================================================

@GenerateSource()
class _TBadgeCustomTheme extends StatelessWidget {
  const _TBadgeCustomTheme();

  @override
  Widget build(BuildContext context) {
    return TBadge.filled(
      theme: TBadgeTheme.all(
        backgroundColor: Colors.black,
        border: Border.all(color: TColors.slate),
        borderRadius: TBorderRadius.rounded_none,
        textStyle: const TextStyle(color: Colors.white).medium,
      ),
      onPressed: () {},
      child: const Text('Badge'),
    );
  }
}

// =============================================================================
// CLASS: _TBadgeStatefulTheme
// =============================================================================

@GenerateSource()
class _TBadgeStatefulTheme extends StatelessWidget {
  const _TBadgeStatefulTheme();

  @override
  Widget build(BuildContext context) {
    return TBadge.filled(
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
    );
  }
}
