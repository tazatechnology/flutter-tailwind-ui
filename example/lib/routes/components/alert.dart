part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTAlert
// =============================================================================

class ComponentRouteTAlert extends StatelessWidget {
  const ComponentRouteTAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TAlert',
      description: 'A widget',
      reference:
          'https://tailwindui.com/components/application-ui/feedback/alerts',
      children: [
        AppSection(
          title: 'Pre-Styled Alerts',
          children: [
            AppPreviewCard(
              title: 'Neutral',
              maxWidth: TScreen.max_lg,
              code: _TAlertNeutralSource.code,
              child: _TAlertNeutral(),
            ),
            AppPreviewCard(
              title: 'Info',
              maxWidth: TScreen.max_lg,
              code: _TAlertInfoSource.code,
              child: _TAlertInfo(),
            ),
            AppPreviewCard(
              title: 'Success',
              maxWidth: TScreen.max_lg,
              code: _TAlertSuccessSource.code,
              child: _TAlertSuccess(),
            ),
            AppPreviewCard(
              title: 'Warning',
              maxWidth: TScreen.max_lg,
              code: _TAlertWarningSource.code,
              child: _TAlertWarning(),
            ),
            AppPreviewCard(
              title: 'Danger',
              maxWidth: TScreen.max_lg,
              code: _TAlertDangerSource.code,
              child: _TAlertDanger(),
            ),
          ],
        ),
        AppSection(
          title: 'Customization',
          children: [
            AppPreviewCard(
              title: 'Color and icon',
              maxWidth: TScreen.max_lg,
              code: _TAlertCustomSource.code,
              child: _TAlertCustom(),
            ),
            AppPreviewCard(
              title: 'With trailing widget',
              maxWidth: TScreen.max_lg,
              code: _TAlertTrailingSource.code,
              child: _TAlertTrailing(),
            ),
            AppPreviewCard(
              title: 'With content',
              maxWidth: TScreen.max_lg,
              code: _TAlertContentSource.code,
              child: _TAlertContent(),
            ),
          ],
        ),
      ],
    );
  }
}
// =============================================================================
// CLASS: _TAlertNeutral
// =============================================================================

@GenerateSource()
class _TAlertNeutral extends StatelessWidget {
  const _TAlertNeutral();

  @override
  Widget build(BuildContext context) {
    return const TAlert.neutral(
      title: Text('This is a neutral alert'),
    );
  }
}

// =============================================================================
// CLASS: _TAlertInfo
// =============================================================================

@GenerateSource()
class _TAlertInfo extends StatelessWidget {
  const _TAlertInfo();

  @override
  Widget build(BuildContext context) {
    return const TAlert.info(
      title: Text('This is an info alert'),
    );
  }
}

// =============================================================================
// CLASS: _TAlertSuccess
// =============================================================================

@GenerateSource()
class _TAlertSuccess extends StatelessWidget {
  const _TAlertSuccess();

  @override
  Widget build(BuildContext context) {
    return const TAlert.success(
      title: Text('This is a success alert'),
    );
  }
}

// =============================================================================
// CLASS: _TAlertSuccess
// =============================================================================

@GenerateSource()
class _TAlertWarning extends StatelessWidget {
  const _TAlertWarning();

  @override
  Widget build(BuildContext context) {
    return const TAlert.warning(
      title: Text('This is a warning alert'),
    );
  }
}

// =============================================================================
// CLASS: _TAlertDanger
// =============================================================================

@GenerateSource()
class _TAlertDanger extends StatelessWidget {
  const _TAlertDanger();

  @override
  Widget build(BuildContext context) {
    return const TAlert.danger(
      title: Text('This is a danger alert'),
    );
  }
}

// =============================================================================
// CLASS: _TAlertCustom
// =============================================================================

@GenerateSource()
class _TAlertCustom extends StatelessWidget {
  const _TAlertCustom();

  @override
  Widget build(BuildContext context) {
    return const TAlert(
      color: TColors.indigo,
      title: Text('This is an awesome alert'),
      icon: Icon(Icons.auto_awesome),
    );
  }
}

// =============================================================================
// CLASS: _TAlertTrailing
// =============================================================================

@GenerateSource()
class _TAlertTrailing extends StatelessWidget {
  const _TAlertTrailing();

  @override
  Widget build(BuildContext context) {
    return TAlert(
      color: TColors.indigo,
      title: const Text('A new software update is available'),
      icon: const Icon(Icons.cloud_download),
      trailing: TButton(
        size: TWidgetSize.sm,
        color: TColors.indigo,
        trailing: const Icon(Icons.arrow_forward),
        child: const Text('Details'),
        onPressed: () {},
      ),
    );
  }
}

// =============================================================================
// CLASS: _TAlertContent
// =============================================================================

@GenerateSource()
class _TAlertContent extends StatelessWidget {
  const _TAlertContent();

  @override
  Widget build(BuildContext context) {
    return TAlert(
      color: TColors.indigo,
      title: const Text('A new software update is available'),
      icon: const Icon(Icons.cloud_download),
      content: Column(
        spacing: TSpace.v8,
        children: [
          const Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid pariatur, ipsum similique veniam quo totam eius aperiam dolorum.',
          ),
          Row(
            spacing: TSpace.v8,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TButton(
                size: TWidgetSize.sm,
                color: TColors.blue,
                child: const Text('Dismiss'),
                onPressed: () {},
              ),
              TButton(
                size: TWidgetSize.sm,
                color: TColors.blue,
                trailing: const Icon(Icons.arrow_forward),
                child: const Text('Details'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
