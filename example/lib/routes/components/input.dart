part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTInput
// =============================================================================

class ComponentRouteTInput extends StatelessWidget {
  const ComponentRouteTInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TInput',
      description: 'An input field for text input.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/input-groups',
      children: [
        AppSection(
          title: 'Input Sizes',
          children: [
            AppPreviewCard(
              title: 'Predefined sizes',
              maxWidth: TScreen.max_w_sm,
              code: _TInputSizeSource.code,
              child: _TInputSize(),
            ),
          ],
        ),
        AppSection(
          title: 'Input with label',
          children: [
            AppPreviewCard(
              title: 'String',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithLabelSource.code,
              child: _TInputWithLabel(),
            ),
            AppPreviewCard(
              title: 'Widget',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithLabelWidgetSource.code,
              child: _TInputWithLabelWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Input with help message',
          children: [
            AppPreviewCard(
              title: 'String',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithHelpSource.code,
              child: _TInputWithHelp(),
            ),
            AppPreviewCard(
              title: 'Widget',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithHelpWidgetSource.code,
              child: _TInputWithHelpWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Input with error message',
          children: [
            AppPreviewCard(
              title: 'String',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithErrorSource.code,
              child: _TInputWithError(),
            ),
            AppPreviewCard(
              title: 'Widget',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithErrorWidgetSource.code,
              child: _TInputWithErrorWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Input states',
          children: [
            AppPreviewCard(
              title: 'Disabled',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithDisabledStateSource.code,
              child: _TInputWithDisabledState(),
            ),
            AppPreviewCard(
              title: 'Read-Only',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithReadOnlyStateSource.code,
              child: _TInputWithReadOnlyState(),
            ),
          ],
        ),
        AppSection(
          title: 'Input with icon',
          children: [
            AppPreviewCard(
              title: 'Leading',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithIconPrefixSource.code,
              child: _TInputWithIconPrefix(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              maxWidth: TScreen.max_w_sm,
              code: _TInputWithIconSuffixSource.code,
              child: _TInputWithIconSuffix(),
            ),
          ],
        ),
        AppSection(
          title: 'Input Area',
          children: [
            AppPreviewCard(
              title: 'Default',
              maxWidth: TScreen.max_w_md,
              code: _TInputAreaSource.code,
              child: _TInputArea(),
            ),
          ],
        ),
        AppSection(
          title: 'Gallery',
          children: [
            AppPreviewCard(
              title: 'Email subscribe',
              code: _TInputGallerySubscribeSource.code,
              child: _TInputGallerySubscribe(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TInputSize
// =============================================================================

@GenerateSource()
class _TInputSize extends StatelessWidget {
  const _TInputSize();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSpace.v16,
      children: [
        for (final size in TInputSize.values)
          TInput(
            size: size,
            labelText: 'Email',
            hintText: 'you@example.com',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TInputWithLabel
// =============================================================================

@GenerateSource()
class _TInputWithLabel extends StatelessWidget {
  const _TInputWithLabel();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      labelText: 'Email',
      hintText: 'you@example.com',
    );
  }
}

// =============================================================================
// CLASS: _TInputWithLabelWidget
// =============================================================================

@GenerateSource()
class _TInputWithLabelWidget extends StatelessWidget {
  const _TInputWithLabelWidget();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Email'),
          TText(
            '* Required',
            style: TextStyle(
              fontWeight: TFontWeight.normal,
              color: TColors.red,
              fontSize: TFontSize.text_xs,
            ),
          ),
        ],
      ),
      hintText: 'you@example.com',
    );
  }
}

// =============================================================================
// CLASS: _TInputWithHelp
// =============================================================================

@GenerateSource()
class _TInputWithHelp extends StatelessWidget {
  const _TInputWithHelp();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      labelText: 'Email',
      hintText: 'you@example.com',
      helpText: 'This is a help message.',
    );
  }
}

// =============================================================================
// CLASS: _TInputWithHelpWidget
// =============================================================================

@GenerateSource()
class _TInputWithHelpWidget extends StatelessWidget {
  const _TInputWithHelpWidget();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      labelText: 'Email',
      hintText: 'you@example.com',
      help: TText('This is a help `widget`'),
    );
  }
}

// =============================================================================
// CLASS: _TInputWithError
// =============================================================================

@GenerateSource()
class _TInputWithError extends StatelessWidget {
  const _TInputWithError();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      initialValue: 'invalid-email',
      labelText: 'Email',
      hintText: 'you@example.com',
      errorText: 'This is an error message.',
    );
  }
}

// =============================================================================
// CLASS: _TInputWithErrorWidget
// =============================================================================

@GenerateSource()
class _TInputWithErrorWidget extends StatelessWidget {
  const _TInputWithErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      initialValue: 'invalid-email',
      labelText: 'Email',
      hintText: 'you@example.com',
      error: TText('This is an error `widget`'),
    );
  }
}

// =============================================================================
// CLASS: _TInputWithDisabledState
// =============================================================================

@GenerateSource()
class _TInputWithDisabledState extends StatelessWidget {
  const _TInputWithDisabledState();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      enabled: false,
      labelText: 'Email',
      hintText: 'Enter your email',
    );
  }
}

// =============================================================================
// CLASS: _TInputWithReadOnlyState
// =============================================================================

@GenerateSource()
class _TInputWithReadOnlyState extends StatelessWidget {
  const _TInputWithReadOnlyState();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      readOnly: true,
      initialValue: 'me@example.com',
      labelText: 'Email',
    );
  }
}

// =============================================================================
// CLASS: _TInputWithIconPrefix
// =============================================================================

@GenerateSource()
class _TInputWithIconPrefix extends StatelessWidget {
  const _TInputWithIconPrefix();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      labelText: 'Email',
      hintText: 'you@example.com',
      prefix: Icon(Icons.mail_outline, size: 15),
    );
  }
}

// =============================================================================
// CLASS: _TInputWithIconSuffix
// =============================================================================

@GenerateSource()
class _TInputWithIconSuffix extends StatelessWidget {
  const _TInputWithIconSuffix();

  @override
  Widget build(BuildContext context) {
    return const TInput(
      obscure: true,
      labelText: 'Password',
      hintText: 'Enter your password',
      suffix: Icon(Icons.security, size: 15),
    );
  }
}

// =============================================================================
// CLASS: _TInputArea
// =============================================================================

@GenerateSource()
class _TInputArea extends StatelessWidget {
  const _TInputArea();

  @override
  Widget build(BuildContext context) {
    return const TInput.area(
      labelText: 'Bio',
      hintText: 'Tell us about yourself',
    );
  }
}

// =============================================================================
// CLASS: _TInputGallerySubscribe
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TInputGallerySubscribe extends StatefulWidget {
  const _TInputGallerySubscribe();

  @override
  State<_TInputGallerySubscribe> createState() =>
      _TInputGallerySubscribeState();
}

class _TInputGallerySubscribeState extends State<_TInputGallerySubscribe> {
  final buttonController = TWidgetStatesController();
  final textController = TextEditingController();

  String? selectedUser = 'User A';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: TScreen.max_w_xs,
          child: TInput(
            controller: textController,
            labelText: 'Email address',
            hintText: 'you@example.com',
            borderRadius:
                const WidgetStatePropertyAll(TBorderRadius.rounded_l_md),
            prefix: const Icon(Icons.mail_outline, size: 15),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        TButton.filled(
          size: TWidgetSize.lg,
          controller: buttonController,
          theme: TStyleTheme.all(
            borderRadius: TBorderRadius.rounded_r_md,
          ),
          child: const Text('Subscribe'),
          onPressed: () {},
        ),
      ],
    );
  }
}
