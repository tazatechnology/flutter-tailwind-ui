part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTForm
// =============================================================================

class ComponentRouteTForm extends StatelessWidget {
  const ComponentRouteTForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TForm',
      description: 'A form to manage and track user input.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/form-layouts',
      children: [
        AppSection(
          title: 'Example Usage',
          children: [
            AppPreviewCard(
              title: 'Basic',
              maxWidth: TScreen.max_sm,
              code: _TFormBasicSource.code,
              child: _TFormBasic(),
            ),
            AppPreviewCard(
              title: 'Track field values',
              maxWidth: TScreen.max_sm,
              code: _TFormTrackFieldValuesSource.code,
              child: _TFormTrackFieldValues(),
            ),
          ],
        ),
        AppSection(
          title: 'Gallery',
          children: [
            AppPreviewCard(
              title: '`TFormField` components',
              description:
                  'All of the input elements in this package are instrument to work with `TForm` and in turn allow for easy value lookup, validation, and reset.',
              maxWidth: TScreen.max_sm,
              code: _TFormAllFieldsSource.code,
              child: _TFormAllFields(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFormBasic
// =============================================================================

@GenerateSource(buildMethodOnly: false)
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
            label: const Text('Email'),
            hintText: 'Enter your email',
            validator: (value) {
              if (value?.contains('@') ?? false) {
                return null;
              }
              return 'Please enter a valid email';
            },
          ),
          TInput(
            label: const Text('Password'),
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

// =============================================================================
// CLASS: _TFormTrackFieldValues
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TFormTrackFieldValues extends StatefulWidget {
  const _TFormTrackFieldValues();

  @override
  State<_TFormTrackFieldValues> createState() => _TFormTrackFieldValuesState();
}

class _TFormTrackFieldValuesState extends State<_TFormTrackFieldValues> {
  final controller = TFormController();

  /// Displays a dialog with the current values of the form fields.
  Future<void> showFieldValuesDialog() async {
    final values = controller.getTFormFieldValues();
    await TDialog.show<void>(
      context: context,
      builder: (context) {
        return TDialog(
          title: const Text('Form Field Values'),
          contentTextStyle: TTextStyle.text_sm.copyWith(
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
            label: Text('Email'),
            initialValue: 'test@example.com',
          ),
          const TInput(
            id: 'password',
            label: Text('Password'),
            initialValue: '123abc',
            obscure: true,
          ),
          TExpand.width(
            child: TButton.filled(
              onPressed: showFieldValuesDialog,
              child: const Text('Get Field Values'),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: _TFormBasic
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TFormAllFields extends StatefulWidget {
  const _TFormAllFields();

  @override
  State<_TFormAllFields> createState() => __TFormAllFieldsState();
}

class __TFormAllFieldsState extends State<_TFormAllFields> {
  final controller = TFormController();

  /// Displays a dialog with the current values of the form fields.
  Future<void> showFieldValuesDialog() async {
    final values = controller.getTFormFieldValues();
    await TDialog.show<void>(
      context: context,
      builder: (context) {
        return TDialog(
          title: const Text('Form Field Values'),
          contentTextStyle: TTextStyle.text_sm.copyWith(
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
            onPressed: showFieldValuesDialog,
            child: const Text('Values'),
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
                    id: 'input',
                    label: Text('Input'),
                    initialValue: 'Bob',
                    hintText: 'Enter your name',
                  ),
                ),
                Expanded(
                  child: TSelect(
                    id: 'select',
                    label: const Text('Select'),
                    initialValue: 1,
                    items: const [1, 2, 3],
                  ),
                ),
              ],
            ),
            TSlider(
              id: 'slider',
              label: const Text('Slider'),
              initialValue: 0.75,
            ),
            Row(
              children: [
                Expanded(
                  child: TRadioGroup(
                    id: 'radio-group',
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
                    id: 'checkbox-group',
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
              id: 'checkbox-tile',
              title: const Text('Checkbox Tile'),
              affinity: TControlAffinity.trailing,
            ),
            TSwitchTile.card(
              id: 'switch-tile',
              initialValue: true,
              title: const Text('Switch Tile'),
              affinity: TControlAffinity.trailing,
            ),
            TExpand.width(
              child: TButton.filled(
                onPressed: () {
                  controller.reset();
                },
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
