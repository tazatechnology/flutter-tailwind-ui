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
          title: 'Input with Label',
          children: [
            AppPreviewCard(
              title: 'Simple',
              maxWidth: TScreen.max_sm,
              code: _TInputWithLabelSource.code,
              child: _TInputWithLabel(),
            ),
            AppPreviewCard(
              title: 'Custom',
              maxWidth: TScreen.max_sm,
              code: _TInputWithLabelWidgetSource.code,
              child: _TInputWithLabelWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Input with Messages',
          children: [
            AppPreviewCard(
              title: 'Help',
              maxWidth: TScreen.max_sm,
              code: _TInputWithHelpSource.code,
              child: _TInputWithHelp(),
            ),
            AppPreviewCard(
              title: 'Error',
              maxWidth: TScreen.max_sm,
              code: _TInputWithErrorSource.code,
              child: _TInputWithError(),
            ),
          ],
        ),
        AppSection(
          title: 'Input States',
          children: [
            AppPreviewCard(
              title: 'Disabled',
              maxWidth: TScreen.max_sm,
              code: _TInputWithDisabledStateSource.code,
              child: _TInputWithDisabledState(),
            ),
            AppPreviewCard(
              title: 'Read-Only',
              maxWidth: TScreen.max_sm,
              code: _TInputWithReadOnlyStateSource.code,
              child: _TInputWithReadOnlyState(),
            ),
          ],
        ),
        AppSection(
          title: 'Input with Icon',
          children: [
            AppPreviewCard(
              title: 'Leading',
              maxWidth: TScreen.max_sm,
              code: _TInputWithIconPrefixSource.code,
              child: _TInputWithIconPrefix(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              maxWidth: TScreen.max_sm,
              code: _TInputWithIconSuffixSource.code,
              child: _TInputWithIconSuffix(),
            ),
          ],
        ),
        AppSection(
          title: 'Input Sizes',
          children: [
            AppPreviewCard(
              title: 'Predefined Sizes',
              maxWidth: TScreen.max_sm,
              code: _TInputSizeSource.code,
              child: _TInputSize(),
            ),
          ],
        ),
        AppSection(
          title: 'Input Area',
          children: [
            AppPreviewCard(
              title: 'Default',
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
      spacing: TSpace.v32,
      children: [
        for (final size in TInputSize.values)
          TInput(
            size: size,
            label: Text('Email (${size.title})'),
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
      label: Text('Email'),
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
      label: Text('Email'),
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
      label: Text('Email'),
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
      label: Text('Email'),
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
      label: Text('Email'),
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
      label: Text('Email'),
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
      label: Text('Password'),
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
      label: Text('Bio'),
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
          width: TScreen.max_xs,
          child: TInput(
            controller: textController,
            label: const Text('Email Address'),
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
