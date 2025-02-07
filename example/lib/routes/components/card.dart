part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTCard
// =============================================================================

class ComponentRouteTCard extends StatelessWidget {
  const ComponentRouteTCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TCard',
      description: 'Basic card component',
      reference:
          'https://tailwindui.com/components/application-ui/layout/cards',
      children: [
        AppSection(
          title: 'Card Features',
          children: [
            AppPreviewCard(
              title: 'Default',
              code: _TCardBasicSource.code,
              child: _TCardBasic(),
            ),
            AppPreviewCard(
              title: 'Elevation',
              code: _TCardElevationSource.code,
              child: _TCardElevation(),
            ),
            AppPreviewCard(
              title: 'Border Radius',
              code: _TCardBorderRadiusSource.code,
              child: _TCardBorderRadius(),
            ),
            AppPreviewCard(
              title: 'Border Side',
              code: _TCardBorderSideSource.code,
              child: _TCardBorderSide(),
            ),
          ],
        ),
        AppSection(
          title: 'Card Header',
          children: [
            AppPreviewCard(
              title: 'Header',
              code: _TCardHeaderSource.code,
              child: _TCardHeader(),
            ),
            AppPreviewCard(
              title: 'Header without border',
              code: _TCardHeaderNoBorderSource.code,
              child: _TCardHeaderNoBorder(),
            ),
            AppPreviewCard(
              title: 'Header with custom border',
              code: _TCardHeaderCustomBorderSource.code,
              child: _TCardHeaderCustomBorder(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCardBasic
// =============================================================================

@GenerateSource()
class _TCardBasic extends StatelessWidget {
  const _TCardBasic();

  @override
  Widget build(BuildContext context) {
    return const TCard(
      child: Text('Card Content'),
    );
  }
}

// =============================================================================
// CLASS: _TCardElevation
// =============================================================================

@GenerateSource()
class _TCardElevation extends StatelessWidget {
  const _TCardElevation();

  @override
  Widget build(BuildContext context) {
    return const TCard(
      elevation: TElevation.shadow_2xl,
      child: Text('Card Content'),
    );
  }
}

// =============================================================================
// CLASS: _TCardBorderRadius
// =============================================================================

@GenerateSource()
class _TCardBorderRadius extends StatelessWidget {
  const _TCardBorderRadius();

  @override
  Widget build(BuildContext context) {
    return const TCard(
      borderRadius: TBorderRadius.rounded_none,
      child: Text('Card Content'),
    );
  }
}

// =============================================================================
// CLASS: _TCardBorderSide
// =============================================================================

@GenerateSource()
class _TCardBorderSide extends StatelessWidget {
  const _TCardBorderSide();

  @override
  Widget build(BuildContext context) {
    return const TCard(
      border: BorderSide(color: TColors.indigo, width: 2),
      child: Text('Card Content'),
    );
  }
}

// =============================================================================
// CLASS: _TCardHeader
// =============================================================================

@GenerateSource()
class _TCardHeader extends StatelessWidget {
  const _TCardHeader();

  @override
  Widget build(BuildContext context) {
    return TCard(
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
    );
  }
}

// =============================================================================
// CLASS: _TCardHeaderNoBorder
// =============================================================================

@GenerateSource()
class _TCardHeaderNoBorder extends StatelessWidget {
  const _TCardHeaderNoBorder();

  @override
  Widget build(BuildContext context) {
    return TCard(
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
    );
  }
}

// =============================================================================
// CLASS: _TCardHeaderCustomBorder
// =============================================================================

@GenerateSource()
class _TCardHeaderCustomBorder extends StatelessWidget {
  const _TCardHeaderCustomBorder();

  @override
  Widget build(BuildContext context) {
    return TCard(
      headerBorder: const BorderSide(color: TColors.indigo, width: 2),
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
    );
  }
}
