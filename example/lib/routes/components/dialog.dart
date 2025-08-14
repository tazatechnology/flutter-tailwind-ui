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
              description:
                  'Use `TDialog.show()` as a versatile alternative to traditional Flutter dialog methods.',
              code: _TDialogBasicSource.code,
              child: _TDialogBasic(),
            ),
            AppPreviewCard(
              title: 'Barrier Dismissible',
              description:
                  'All the familiar dialog options are available in `TDialog.show()`',
              code: _TDialogBarrierDismissibleSource.code,
              child: _TDialogBarrierDismissible(),
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
              description: 'Hide cancel button and show close icon instead.',
              code: _TDialogCloseSource.code,
              child: _TDialogClose(),
            ),
            AppPreviewCard(
              title: 'With custom cancel widget',
              description: 'Customize the default cancel button',
              code: _TDialogCustomCancelSource.code,
              child: _TDialogCustomCancel(),
            ),
          ],
        ),
        AppSection(
          title: 'Dialog Content',
          children: [
            AppPreviewCard(
              title: 'Scrollable Content',
              code: _TDialogScrollableContentSource.code,
              child: _TDialogScrollableContent(),
            ),
            AppPreviewCard(
              title: 'Fixed Height Content',

              code: _TDialogFixedHeightContentSource.code,
              child: _TDialogFixedHeightContent(),
            ),
          ],
        ),
        AppSection(
          title: 'Dialog Actions',
          children: [
            AppPreviewCard(
              title: 'Custom Actions',
              description: 'Add any actions you want to the dialog.',
              code: _TDialogCustomActionsSource.code,
              child: _TDialogCustomActions(),
            ),
            AppPreviewCard(
              title: 'Custom Actions Layout',
              description:
                  'Customize the layout (alignment adn spacing) of the actions in the dialog.',
              code: _TDialogActionsLayoutSource.code,
              child: _TDialogActionsLayout(),
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
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogBarrierDismissible
// =============================================================================

@GenerateSource()
class _TDialogBarrierDismissible extends StatelessWidget {
  const _TDialogBarrierDismissible();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog'),
      onPressed: () => TDialog.show<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Dismissible TDialog'),
            showCancel: false,
            content: const Text(
              'You can dismiss this dialog by tapping outside of it.',
            ),
            actions: [
              TButton.filled(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
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
                onPressed: () => Navigator.of(context).pop(),
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
                onPressed: () => Navigator.of(context).pop(),
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
      child: const Text('Show Dialog (Custom Cancel)'),
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
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogScrollableContent
// =============================================================================

@GenerateSource()
class _TDialogScrollableContent extends StatelessWidget {
  const _TDialogScrollableContent();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog (Scrollable Content)'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Scrollable Content'),
            content: ListView.separated(
              shrinkWrap: true,
              itemCount: 50,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: TOffset.zero,
                  title: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(fontWeight: TFontWeight.bold),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogFixedHeightContent
// =============================================================================

@GenerateSource()
class _TDialogFixedHeightContent extends StatelessWidget {
  const _TDialogFixedHeightContent();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog (Fixed Height Content)'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Fixed Height Content'),
            content: SizedBox(
              height: 500,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 50,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: TOffset.zero,
                    title: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(fontWeight: TFontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogCustomActions
// =============================================================================

@GenerateSource()
class _TDialogCustomActions extends StatelessWidget {
  const _TDialogCustomActions();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog (Custom Actions)'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Register account'),
            content: const Text(
              'Are you sure you want to register your account?',
            ),
            showCancel: false,
            actions: [
              TButton.filled(
                color: TColors.red,
                child: const Text('Unregister'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TButton.filled(
                child: const Text('Register'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// CLASS: _TDialogActionsLayout
// =============================================================================

@GenerateSource()
class _TDialogActionsLayout extends StatelessWidget {
  const _TDialogActionsLayout();

  @override
  Widget build(BuildContext context) {
    return TButton.outlined(
      child: const Text('Show Dialog (Custom Actions Layout)'),
      onPressed: () => TDialog.show<void>(
        context: context,
        builder: (context) {
          return TDialog(
            title: const Text('Register account'),
            content: const Text(
              'Are you sure you want to register your account?',
            ),
            showCancel: false,
            actionsSpacing: TSpace.v16,
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              TButton.filled(
                color: TColors.red,
                child: const Text('Unregister'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TButton.filled(
                child: const Text('Register'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      ),
    );
  }
}
