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
          title: 'Input with label',
          children: [
            AppPreviewCard(
              title: 'String',
              maxWidth: TScreen.max_w_xs,
              code: _TInputWithLabelSource.code,
              child: _TInputWithLabel(),
            ),
            AppPreviewCard(
              title: 'Widget',
              maxWidth: TScreen.max_w_xs,
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
              maxWidth: TScreen.max_w_xs,
              code: _TInputWithHelpSource.code,
              child: _TInputWithHelp(),
            ),
            AppPreviewCard(
              title: 'Widget',
              maxWidth: TScreen.max_w_xs,
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
              maxWidth: TScreen.max_w_xs,
              code: _TInputWithErrorSource.code,
              child: _TInputWithError(),
            ),
            AppPreviewCard(
              title: 'Widget',
              maxWidth: TScreen.max_w_xs,
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
              maxWidth: TScreen.max_w_xs,
              code: _TInputWithDisabledStateSource.code,
              child: _TInputWithDisabledState(),
            ),
            AppPreviewCard(
              title: 'Read-Only',
              maxWidth: TScreen.max_w_xs,
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
              maxWidth: TScreen.max_w_xs,
              code: _TInputWithIconPrefixSource.code,
              child: _TInputWithIconPrefix(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              maxWidth: TScreen.max_w_xs,
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
    return TInput(
      label: Row(
        children: [
          const Icon(Icons.mail_outline, size: 15),
          TSizedBox.x4,
          const Text('Email'),
          const Spacer(),
          TText(
            '* Required',
            style: TextStyle(
              fontWeight: TFontWeight.normal,
              color: context.tw.colors.label,
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
