part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTBadge
// =============================================================================

class ComponentRouteTBadge extends StatelessWidget {
  const ComponentRouteTBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TBadge',
      description: 'A full customizable badge widget',
      children: [
        AppPreviewCard(
          title: 'Basic badge',
          code: _TBadgeBasicSource.code,
          child: _TBadgeBasic(),
        ),
        AppPreviewCard(
          title: 'Outlined badge',
          code: _TBadgeOutlinedSource.code,
          child: _TBadgeOutlined(),
        ),
        AppPreviewCard(
          title: 'Filled badge',
          code: _TBadgeFilledSource.code,
          child: _TBadgeFilled(),
        ),
        AppPreviewCard(
          title: 'Soft badge',
          code: _TBadgeSoftSource.code,
          child: _TBadgeSoft(),
        ),
        AppPreviewCard(
          title: 'Basic badge (sizes)',
          code: _TBadgeBasicSizesSource.code,
          child: _TBadgeBasicSizes(),
        ),
        AppPreviewCard(
          title: 'Badge with leading',
          code: _TBadgeLeadingSource.code,
          child: _TBadgeLeading(),
        ),
        AppPreviewCard(
          title: 'Badge with gesture callbacks',
          code: _TBadgeCallbackSource.code,
          child: _TBadgeCallback(),
        ),
        AppPreviewCard(
          title: 'Custom badge theme (`TBadgeTheme`)',
          code: _TBadgeCustomThemeSource.code,
          child: _TBadgeCustomTheme(),
        ),
        AppPreviewCard(
          title: 'Stateful badge theme (`TBadgeTheme`)',
          code: _TBadgeStatefulThemeSource.code,
          child: _TBadgeStatefulTheme(),
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
    return const TBadge(
      child: Text('Badge'),
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
// CLASS: _TBadgeBasicSizes
// =============================================================================

@GenerateSource()
class _TBadgeBasicSizes extends StatelessWidget {
  const _TBadgeBasicSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    return const TBadge.filled(
      leading: Icon(Icons.circle, size: 6, color: TColors.indigo),
      child: Text('Badge'),
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
      child: const Text('Badge'),
      onPressed: () {
        // Handle badge press
      },
      onHover: (isHovered) {
        // Handle badge hover
      },
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
    );
  }
}
