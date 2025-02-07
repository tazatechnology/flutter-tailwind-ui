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
          title: 'Select Sizes',
          children: [
            AppPreviewCard(
              title: 'Predefined sizes',
              code: _TSelectSizeSource.code,
              child: _TSelectSize(),
            ),
          ],
        ),
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
          title: 'Search Options',
          children: [
            AppPreviewCard(
              title: 'Search options with text input',
              code: _TSelectSearchSource.code,
              child: _TSelectSearch(),
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
// CLASS: _TSelectSize
// =============================================================================

@GenerateSource()
class _TSelectSize extends StatelessWidget {
  const _TSelectSize();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSpace.v16,
      children: [
        for (final size in TInputSize.values)
          TSelect(
            labelText: 'Select Number (${size.title})',
            size: size,
            initialValue: 1,
            items: const [1, 2, 3],
            itemBuilder: (value) => Text(value.toString()),
            selectedItemBuilder: (value) => Text('Selected: $value'),
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
      itemBuilder: (value) => Text(value.name.toUpperCase()),
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
      itemBuilder: (value) => Text(value.name.toUpperCase()),
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
      itemBuilder: (value) => Text(value.toString()),
      selectedItemBuilder: (value) => Text('Number: $value'),
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
      itemBuilder: (value) => Text(value.toString()),
      selectedItemBuilder: (value) => Text('Number: $value'),
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
      itemBuilder: (value) => Text(value.toString()),
      selectedItemBuilder: (value) => Text('Number: $value'),
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
      itemBuilder: (value) => Text(value),
      selectedItemBuilder: (value) => Text(value),
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
      itemBuilder: (value) => Text(value),
      selectedItemBuilder: (value) => Text(value),
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
      itemBuilder: (value) => Text(value),
      selectedItemBuilder: (value) => Text(value),
    );
  }
}

// =============================================================================
// CLASS: _TSelectSearch
// =============================================================================

@GenerateSource()
class _TSelectSearch extends StatelessWidget {
  const _TSelectSearch();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      labelText: 'Fruit Selection',
      allowDeselect: true,
      closeOnSelect: false,
      items: const ['apple', 'banana', 'cherry', 'date', 'elderberry'],
      itemBuilder: (value) => Text(value),
      selectedItemBuilder: (value) => Text(value),
      onSearch: (options, term) {
        final optionsLower =
            options.map((option) => option.toLowerCase()).toList();
        return optionsLower
            .where((option) => option.contains(term.toLowerCase()))
            .toList();
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
      children: [
        Flexible(
          child: TSelect(
            initialValue: selectedUser,
            allowDeselect: true,
            closeOnSelect: false,
            labelText: 'Add a user',
            items: const ['User A', 'User B', 'User C'],
            placeholder: const Text('Select user'),
            borderRadius: const WidgetStatePropertyAll(
              TBorderRadius.rounded_l_md,
            ),
            itemBuilder: (value) => Text(value),
            selectedItemBuilder: (value) => Text(value),
            onChanged: (value) {
              selectedUser = value;
              buttonController.disabled = selectedUser == null;
            },
          ),
        ),
        TButton.filled(
          size: TWidgetSize.lg,
          controller: buttonController,
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
