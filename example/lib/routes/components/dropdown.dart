part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTDropdown
// =============================================================================

class ComponentRouteTDropdown extends StatelessWidget {
  const ComponentRouteTDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TDropdown',
      description: 'A widget to triggers a dropdown overlay',
      children: [
        const AppSection(
          title: 'Basic Dropdown',
          children: [
            AppPreviewCard(
              title: 'Default',
              code: _TDropdownExampleSource.code,
              child: _TDropdownExample(),
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
                code: _TDropdownAlignmentSource.code,
                child: _TDropdownAlignment(alignment),
              ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TDropdownExample
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TDropdownExample extends StatefulWidget {
  const _TDropdownExample();

  @override
  State<_TDropdownExample> createState() => _TDropdownExampleState();
}

class _TDropdownExampleState extends State<_TDropdownExample> {
  final controller = TDropdownController();

  @override
  Widget build(BuildContext context) {
    return TDropdown(
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
// CLASS: _TDropdownAlignment
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TDropdownAlignment extends StatefulWidget {
  const _TDropdownAlignment(this.alignment);
  final Alignment alignment;

  @override
  State<_TDropdownAlignment> createState() => _TDropdownAlignmentState();
}

class _TDropdownAlignmentState extends State<_TDropdownAlignment> {
  final controller = TDropdownController();

  @override
  Widget build(BuildContext context) {
    String name = widget.alignment.toString().split('.').last;
    name = name[0].toUpperCase() + name.substring(1);
    return TDropdown(
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
