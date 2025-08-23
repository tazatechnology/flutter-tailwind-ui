part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTPopover
// =============================================================================

class ComponentRouteTPopover extends StatelessWidget {
  const ComponentRouteTPopover({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TPopover',
      description: 'Display a popover overlay',
      children: [
        const AppSection(
          title: 'Popover Usage',
          children: [
            AppPreviewCard(
              title: 'Default',
              code: _TPopoverExampleSource.code,
              child: _TPopoverExample(),
            ),
            AppPreviewCard(
              title: 'Prevent close tap outside',
              code: _TPopoverPreventCloseSource.code,
              child: _TPopoverPreventClose(),
            ),
          ],
        ),
        AppSection(
          title: 'Alignment Options',
          children: [
            for (final alignment in [
              Alignment.topLeft,
              Alignment.topCenter,
              Alignment.topRight,
              Alignment.centerLeft,
              Alignment.center,
              Alignment.centerRight,
              Alignment.bottomLeft,
              Alignment.bottomCenter,
              Alignment.bottomRight,
            ])
              AppPreviewCard(
                title: '`$alignment`',
                code: _TPopoverAlignmentSource.code,
                child: _TPopoverAlignment(alignment),
              ),
          ],
        ),
        const AppSection(
          title: 'Animation Options',
          children: [
            AppPreviewCard(
              title: 'Default',
              code: _TPopoverAnimationDefaultSource.code,
              child: _TPopoverAnimationDefault(),
            ),
            AppPreviewCard(
              title: 'None',
              code: _TPopoverAnimationNoneSource.code,
              child: _TPopoverAnimationNone(),
            ),
            AppPreviewCard(
              title: 'Custom',
              code: _TPopoverAnimationCustomSource.code,
              child: _TPopoverAnimationCustom(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TPopoverExample
// =============================================================================

@GenerateSource(buildMethodOnly: false)
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

// =============================================================================
// CLASS: _TPopoverPreventClose
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TPopoverPreventClose extends StatefulWidget {
  const _TPopoverPreventClose();

  @override
  State<_TPopoverPreventClose> createState() => _TPopoverPreventCloseState();
}

class _TPopoverPreventCloseState extends State<_TPopoverPreventClose> {
  final controller = TPopoverController();

  @override
  Widget build(BuildContext context) {
    return TPopover(
      controller: controller,
      closeOnTapOutside: false,
      anchor: TButton.filled(
        onPressed: controller.toggle,
        child: const Text('Prevent Close'),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TPopoverAlignment
// =============================================================================

@GenerateSource(buildMethodOnly: false)
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

// =============================================================================
// CLASS: _TPopoverAnimationDefault
// =============================================================================

@GenerateSource(buildMethodOnly: false)
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

// =============================================================================
// CLASS: _TPopoverAnimationNone
// =============================================================================

@GenerateSource(buildMethodOnly: false)
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

// =============================================================================
// CLASS: _TPopoverAnimationCustom
// =============================================================================

@GenerateSource(buildMethodOnly: false)
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
