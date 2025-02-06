part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTDialog
// =============================================================================

class ComponentRouteTDialog extends StatelessWidget {
  const ComponentRouteTDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TDialog',
      description: 'A modal dialog component.',
      children: [
        AppSection(
          title: 'Dialog Usage',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TDialogBasicSource.code,
              child: _TDialogBasic(),
            ),
            AppPreviewCard(
              title: 'With Icon',
              description:
                  'A dialog with an `icon` in the top center. When provided, the `title` will be displayed below the `icon` and all the `content` will be centered. The `actions` will be expanded to the full width. The layout of the dialog is dynamic as the screen size changes and will adjust based on the presence of the `icon`, `title`, `content`, and `actions`.',
              code: _TDialogIconSource.code,
              child: _TDialogIcon(),
            ),
            AppPreviewCard(
              title: 'With close button',
              code: _TDialogCloseSource.code,
              child: _TDialogClose(),
            ),
            AppPreviewCard(
              title: 'With custom cancel widget',
              code: _TDialogCustomCancelSource.code,
              child: _TDialogCustomCancel(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TDialogBasic
// =============================================================================

@GenerateSource()
class _TDialogBasic extends StatelessWidget {
  const _TDialogBasic();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Register account'),
            content: const Text(
              'Are you sure you want to register your account?',
            ),
            actions: [
              TButton.filled(
                child: const Text('Register'),
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogIcon
// =============================================================================

@GenerateSource()
class _TDialogIcon extends StatelessWidget {
  const _TDialogIcon();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog with Icon'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            icon: const Icon(Icons.account_circle, size: TSpace.v32),
            title: const Text('Register account'),
            content: const Text(
              'Are you sure you want to register your account?',
            ),
            actions: [
              TButton.filled(
                child: const Text('Register'),
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogClose
// =============================================================================

@GenerateSource()
class _TDialogClose extends StatelessWidget {
  const _TDialogClose();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog with Close'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            showClose: true,
            showCancel: false,
            title: const Text('Register account'),
            content: const Text(
              'Are you sure you want to register your account?',
            ),
            actions: [
              TButton.filled(
                child: const Text('Register'),
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogCustomCancel
// =============================================================================

@GenerateSource()
class _TDialogCustomCancel extends StatelessWidget {
  const _TDialogCustomCancel();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog with Cancel'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Register account'),
            content: const Text(
              'Are you sure you want to register your account?',
            ),
            cancel: const Row(
              spacing: TSpace.v6,
              children: [
                Icon(Icons.arrow_back, size: 15),
                Text('Back'),
              ],
            ),
            actions: [
              TButton.filled(
                child: const Text('Register'),
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
