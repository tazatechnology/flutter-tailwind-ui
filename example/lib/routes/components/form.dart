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
              maxWidth: TScreen.max_w_sm,
              code: _TFormBasicSource.code,
              child: _TFormBasic(),
            ),
            AppPreviewCard(
              title: 'Track field values',
              maxWidth: TScreen.max_w_sm,
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
                  'All of the input elements in this package are instrument to work with `TForm` and in turn allow for easy value lookup and validation.',
              maxWidth: TScreen.max_w_sm,
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
          spacing: TSpace.v32,
          children: [
            const Row(
              spacing: TSpace.v12,
              children: [
                Expanded(
                  child: TInput(
                    labelText: 'Input',
                    initialValue: 'Bob',
                    hintText: 'Enter your name',
                  ),
                ),
                Expanded(
                  child: TSelect(
                    labelText: 'Select',
                    initialValue: 1,
                    items: [1, 2, 3],
                  ),
                ),
              ],
            ),
            const TSlider(
              labelText: 'Slider',
              initialValue: 0.75,
            ),
            Row(
              children: [
                Expanded(
                  child: TRadioGroup(
                    label: const Text('Radio Group'),
                    groupValue: TSelectionGroupVariant.values.first,
                    children: [
                      for (final variant in TSelectionGroupVariant.values)
                        TRadioGroupItem(
                          title: Text(variant.title),
                          value: variant,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: TCheckboxGroup(
                    label: const Text('Checkbox Group'),
                    groupValue: [TSelectionGroupVariant.values.first],
                    children: [
                      for (final variant in TSelectionGroupVariant.values)
                        TCheckboxGroupItem(
                          title: Text(variant.title),
                          value: variant,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
