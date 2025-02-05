part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSelect
// =============================================================================

class ComponentRouteTSelect extends StatelessWidget {
  const ComponentRouteTSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSelect',
      description: 'A widget to display a list of options.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/select-menus',
      children: [
        AppSection(
          title: 'Select with label',
          children: [
            AppPreviewCard(
              title: 'Text',
              code: _TSelectLabelTextSource.code,
              child: _TSelectLabelText(),
            ),
            AppPreviewCard(
              title: 'Widget',
              code: _TSelectLabelWidgetSource.code,
              child: _TSelectLabelWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Scrollable options list',
          children: [
            AppPreviewCard(
              title: 'Build many options',
              code: _TSelectScrollableSource.code,
              child: _TSelectScrollable(),
            ),
          ],
        ),
        AppSection(
          title: 'Select States',
          children: [
            AppPreviewCard(
              title: 'Enabled',
              code: _TSelectEnabledSource.code,
              child: _TSelectEnabled(),
            ),
            AppPreviewCard(
              title: 'Disabled',
              code: _TSelectDisabledSource.code,
              child: _TSelectDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Select Icon',
          children: [
            AppPreviewCard(
              title: 'Leading',
              code: _TSelectSelectedIconLeadingSource.code,
              child: _TSelectSelectedIconLeading(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              code: _TSelectSelectedIconTrailingSource.code,
              child: _TSelectSelectedIconTrailing(),
            ),
          ],
        ),
        AppSection(
          title: 'Allow Deselect',
          children: [
            AppPreviewCard(
              title: 'Allow deselect of selected option',
              code: _TSelectAllowDeselectSource.code,
              child: _TSelectAllowDeselect(),
            ),
          ],
        ),
        AppSection(
          title: 'Gallery',
          children: [
            AppPreviewCard(
              title: 'Add User Example',
              code: _TSelectGalleryAddUserSource.code,
              child: _TSelectGalleryAddUser(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSelectLabelText
// =============================================================================

@GenerateSource()
class _TSelectLabelText extends StatelessWidget {
  const _TSelectLabelText();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      labelText: 'Size',
      items: TWidgetSize.values,
      itemBuilder: (value) {
        return Text(value.name.toUpperCase());
      },
      selectedItemBuilder: (value) {
        return Text('Selected: ${value.name.toUpperCase()}');
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectLabelWidget
// =============================================================================

@GenerateSource()
class _TSelectLabelWidget extends StatelessWidget {
  const _TSelectLabelWidget();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      label: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Size'),
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
      items: TWidgetSize.values,
      itemBuilder: (value) {
        return Text(value.name.toUpperCase());
      },
      selectedItemBuilder: (value) {
        return Text('Selected: ${value.name.toUpperCase()}');
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectScrollable
// =============================================================================

@GenerateSource()
class _TSelectScrollable extends StatelessWidget {
  const _TSelectScrollable();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      labelText: 'Select a number (0-1,000)',
      items: List.generate(1000, (ii) => ii),
      itemBuilder: (value) {
        return Text(value.toString());
      },
      selectedItemBuilder: (value) {
        return Text('Number: $value');
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectEnabled
// =============================================================================

@GenerateSource()
class _TSelectEnabled extends StatelessWidget {
  const _TSelectEnabled();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      labelText: 'Select a number',
      initialValue: 50,
      items: List.generate(100, (ii) => ii),
      itemBuilder: (value) {
        return Text(value.toString());
      },
      selectedItemBuilder: (value) {
        return Text('Number: $value');
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectDisabled
// =============================================================================

@GenerateSource()
class _TSelectDisabled extends StatelessWidget {
  const _TSelectDisabled();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      enabled: false,
      initialValue: 50,
      labelText: 'Select a number',
      items: List.generate(100, (ii) => ii),
      itemBuilder: (value) {
        return Text(value.toString());
      },
      selectedItemBuilder: (value) {
        return Text('Number: $value');
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectSelectedIconLeading
// =============================================================================

@GenerateSource()
class _TSelectSelectedIconLeading extends StatelessWidget {
  const _TSelectSelectedIconLeading();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      initialValue: 'User B',
      labelText: 'Add a user',
      items: const ['User A', 'User B', 'User C'],
      selectedIcon: const Icon(Icons.circle, size: 10),
      selectedIconAffinity: TControlAffinity.leading,
      itemBuilder: (value) {
        return Text(value);
      },
      selectedItemBuilder: (value) {
        return Text(value);
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectSelectedIconTrailing
// =============================================================================

@GenerateSource()
class _TSelectSelectedIconTrailing extends StatelessWidget {
  const _TSelectSelectedIconTrailing();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      initialValue: 'User B',
      labelText: 'Add a user',
      items: const ['User A', 'User B', 'User C'],
      selectedIcon: const Icon(Icons.circle, size: 10),
      itemBuilder: (value) {
        return Text(value);
      },
      selectedItemBuilder: (value) {
        return Text(value);
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectAllowDeselect
// =============================================================================

@GenerateSource()
class _TSelectAllowDeselect extends StatelessWidget {
  const _TSelectAllowDeselect();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      initialValue: 'User B',
      allowDeselect: true,
      labelText: 'Add a user',
      items: const ['User A', 'User B', 'User C'],
      itemBuilder: (value) {
        return Text(value);
      },
      selectedItemBuilder: (value) {
        return Text(value);
      },
    );
  }
}

// =============================================================================
// CLASS: _TSelectGalleryAddUser
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSelectGalleryAddUser extends StatefulWidget {
  const _TSelectGalleryAddUser();

  @override
  State<_TSelectGalleryAddUser> createState() => _TSelectGalleryAddUserState();
}

class _TSelectGalleryAddUserState extends State<_TSelectGalleryAddUser> {
  final buttonController = TWidgetStatesController();
  String? selectedUser = 'User A';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        TSelect(
          initialValue: selectedUser,
          allowDeselect: true,
          labelText: 'Add a user',
          items: const ['User A', 'User B', 'User C'],
          placeholder: const Text('Select user'),
          maxWidth: TScreen.max_w_224,
          borderRadius:
              const WidgetStatePropertyAll(TBorderRadius.rounded_l_md),
          itemBuilder: (value) {
            return Text(value);
          },
          selectedItemBuilder: (value) {
            return Text(value);
          },
          onChanged: (value) {
            selectedUser = value;
            buttonController.disabled = selectedUser == null;
          },
        ),
        TButton.filled(
          controller: buttonController,
          size: TWidgetSize.lg,
          theme: TStyleTheme.all(
            borderRadius: TBorderRadius.rounded_r_md,
          ),
          child: const Text('Add'),
          onPressed: () {},
        ),
      ],
    );
  }
}
