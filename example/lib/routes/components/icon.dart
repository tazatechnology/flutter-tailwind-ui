part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTIcon
// =============================================================================

class ComponentRouteTIcon extends StatelessWidget {
  const ComponentRouteTIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TIcon',
      description: 'An icon widget that respects the size of its parent.',
      children: [
        AppSection(
          title: 'Comparison with Flutter `Icon` Widget',
          children: [
            AppPreviewCard(
              title: 'Size Preservation',
              description:
                  "Unlike Flutter's built-in `Icon` widget, `TIcon` automatically scales non-square icons to fit within the requested size without overflowing.",
              code: _TIconComparisonSource.code,
              child: _TIconComparison(),
            ),
          ],
        ),
        AppSection(
          title: 'Basic Usage',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TIconBasicSource.code,
              child: _TIconBasic(),
            ),
            AppPreviewCard(
              title: 'Customization',
              code: _TIconCustomizeSource.code,
              child: _TIconCustomize(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconComparison
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TIconComparison extends StatefulWidget {
  const _TIconComparison();

  @override
  State<_TIconComparison> createState() => _TIconComparisonState();
}

class _TIconComparisonState extends State<_TIconComparison> {
  double size = 32;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: TSpace.v96,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                spacing: TSpace.v12,
                children: [
                  ColoredBox(
                    color: TColors.indigo.shade100,
                    child: TIcon(
                      FontAwesomeIcons.planeLock,
                      size: size,
                      color: TColors.zinc.shade700,
                    ),
                  ),
                  const TText('`TIcon`', style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                spacing: TSpace.v12,
                children: [
                  ColoredBox(
                    color: TColors.indigo.shade100,
                    child: Icon(
                      FontAwesomeIcons.planeLock,
                      size: size,
                      color: TColors.zinc.shade700,
                    ),
                  ),
                  const TText('`Icon`', style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
        TSlider(
          initialValue: size,
          min: 40 - 20,
          max: 40 + 20,
          divisions: 20,
          label: Text('Icon Size: ${size.toInt()}'),
          onChanged: (value) {
            setState(() {
              size = value;
            });
          },
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconBasic
// =============================================================================

@GenerateSource()
class _TIconBasic extends StatelessWidget {
  const _TIconBasic();

  @override
  Widget build(BuildContext context) {
    return const TIcon(Icons.home);
  }
}

// =============================================================================
// CLASS: _TIconCustomize
// =============================================================================

@GenerateSource()
class _TIconCustomize extends StatelessWidget {
  const _TIconCustomize();

  @override
  Widget build(BuildContext context) {
    return const TIcon(
      Icons.home,
      size: 32,
      color: TColors.indigo,
      semanticLabel: 'Home Icon',
      shadows: [
        Shadow(
          color: Colors.black54,
          offset: Offset(2, 2),
          blurRadius: 4,
        ),
      ],
    );
  }
}
