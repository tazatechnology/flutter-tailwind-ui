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
          title: 'Badge with leading',
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
          title: 'Badge with trailing',
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
          title: 'Badge with callbacks',
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
// CLASS: _TBadgeOutlined
// =============================================================================

@GenerateSource()
class _TBadgeOutlined extends StatelessWidget {
  const _TBadgeOutlined();

  @override
  Widget build(BuildContext context) {
    return const TBadge.outlined(
      child: Text('Badge'),
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
    return const TBadge.filled(
      child: Text('Badge'),
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
    return const TBadge.soft(
      child: Text('Badge'),
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
    return const Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TBadge.outlined(
          color: TColors.indigo,
          leading: Icon(Icons.check),
          child: Text('Badge'),
        ),
        TBadge.filled(
          color: TColors.indigo,
          leading: Icon(Icons.check),
          child: Text('Badge'),
        ),
        TBadge.soft(
          color: TColors.indigo,
          leading: Icon(Icons.check),
          child: Text('Badge'),
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
    return const Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TBadge.outlined(
          color: TColors.indigo,
          trailing: Icon(Icons.check),
          child: Text('Badge'),
        ),
        TBadge.filled(
          color: TColors.indigo,
          trailing: Icon(Icons.check),
          child: Text('Badge'),
        ),
        TBadge.soft(
          color: TColors.indigo,
          trailing: Icon(Icons.check),
          child: Text('Badge'),
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
        TBadge.outlined(
          color: TColors.indigo,
          leading: const Icon(Icons.add),
          tooltipLeading: 'Add',
          onPressedLeading: () {},
          child: const Text('Badge'),
        ),
        TBadge.filled(
          color: TColors.indigo,
          leading: const Icon(Icons.add),
          tooltipLeading: 'Add',
          onPressedLeading: () {},
          child: const Text('Badge'),
        ),
        TBadge.soft(
          color: TColors.indigo,
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
        TBadge.outlined(
          color: TColors.indigo,
          trailing: const Icon(Icons.close),
          tooltipTrailing: 'Remove',
          onPressedTrailing: () {},
          child: const Text('Badge'),
        ),
        TBadge.filled(
          color: TColors.indigo,
          trailing: const Icon(Icons.close),
          tooltipTrailing: 'Remove',
          onPressedTrailing: () {},
          child: const Text('Badge'),
        ),
        TBadge.soft(
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
        border: Border.all(color: TColors.slate),
        backgroundColor: Colors.black,
        padding: TOffset.x10 + TOffset.y4,
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
        border: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return Border.all(color: TColors.sky, width: 1.5);
          }
          return Border.all(color: TColors.slate);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TColors.slate.shade800;
          }
          return Colors.black;
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
          final style = const TextStyle(color: Colors.white).medium;
          if (states.hovered) {
            return style.semibold;
          }
          return style.medium;
        }),
      ),
      onPressed: () {},
      child: const Text('Badge'),
    );
  }
}
