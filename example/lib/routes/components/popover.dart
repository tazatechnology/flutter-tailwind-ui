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
          title: 'Basic Popover',
          children: [
            AppPreviewCard(
              title: 'Default',
              code: _TPopoverExampleSource.code,
              child: _TPopoverExample(),
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
                title: '``$alignment``',
                code: _TPopoverAlignmentSource.code,
                child: _TPopoverAlignment(alignment),
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
    String name = widget.alignment.toString().split('.').last;
    name = name[0].toUpperCase() + name.substring(1);
    return TPopover(
      alignment: widget.alignment,
      controller: controller,
      anchor: TButton.filled(
        onPressed: controller.toggle,
        child: const Text('Dropdown'),
      ),
      content: const SizedBox(
        height: 100,
        width: 200,
        child: Center(child: Text('Content')),
      ),
    );
  }
}
