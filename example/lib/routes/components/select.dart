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
          title: 'Select with Label',
          children: [
            AppPreviewCard(
              title: 'Simple',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectLabelTextSource.code,
              child: _TSelectLabelText(),
            ),
            AppPreviewCard(
              title: 'Custom',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectLabelWidgetSource.code,
              child: _TSelectLabelWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Building Options',
          children: [
            AppPreviewCard(
              title: 'No options',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectNoOptionsSource.code,
              child: _TSelectNoOptions(),
            ),
            AppPreviewCard(
              title: 'Spacing between options',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectSpacingSource.code,
              child: _TSelectSpacing(),
            ),
            AppPreviewCard(
              title: 'Build many options',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectScrollableSource.code,
              child: _TSelectScrollable(),
            ),
            AppPreviewCard(
              title: 'Build options asynchronously',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectAsyncSource.code,
              child: _TSelectAsync(),
            ),
          ],
        ),
        AppSection(
          title: 'Select States',
          children: [
            AppPreviewCard(
              title: 'Enabled',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectEnabledSource.code,
              child: _TSelectEnabled(),
            ),
            AppPreviewCard(
              title: 'Disabled',
              maxWidth: TScreen.max_w_sm,
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
              maxWidth: TScreen.max_w_sm,
              code: _TSelectSelectedIconLeadingSource.code,
              child: _TSelectSelectedIconLeading(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectSelectedIconTrailingSource.code,
              child: _TSelectSelectedIconTrailing(),
            ),
          ],
        ),
        AppSection(
          title: 'Popover Interactions',
          children: [
            AppPreviewCard(
              title: 'Allow deselect',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectAllowDeselectSource.code,
              child: _TSelectAllowDeselect(),
            ),
            AppPreviewCard(
              title: 'Prevent close on select',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectPreventCloseSource.code,
              child: _TSelectPreventClose(),
            ),
            AppPreviewCard(
              title: 'Prevent close on tap outside',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectPreventCloseOutsideSource.code,
              child: _TSelectPreventCloseOutside(),
            ),
          ],
        ),
        AppSection(
          title: 'Search Options',
          children: [
            AppPreviewCard(
              title: 'Search options with text input',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectSearchSource.code,
              child: _TSelectSearch(),
            ),
          ],
        ),
        AppSection(
          title: 'Select Sizes',
          children: [
            AppPreviewCard(
              title: 'Predefined sizes',
              maxWidth: TScreen.max_w_sm,
              code: _TSelectSizeSource.code,
              child: _TSelectSize(),
            ),
          ],
        ),
        AppSection(
          title: 'Gallery',
          children: [
            AppPreviewCard(
              title: 'Add User Example',
              maxWidth: TScreen.max_w_sm,
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
      spacing: TSpace.v32,
      children: [
        for (final size in TInputSize.values)
          TSelect(
            label: Text('Select Number (${size.title})'),
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
      label: const Text('Size'),
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
// CLASS: _TSelectNoOptions
// =============================================================================

@GenerateSource()
class _TSelectNoOptions extends StatelessWidget {
  const _TSelectNoOptions();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      label: const Text('Select with no options'),
      items: const [],
      itemsEmpty: const SizedBox(
        height: TSpace.v64,
        child: Center(child: Text('Nothing to see here')),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSelectSpacing
// =============================================================================

@GenerateSource()
class _TSelectSpacing extends StatelessWidget {
  const _TSelectSpacing();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      label: const Text('Select with spacing'),
      items: TWidgetSize.values,
      spacing: TSpace.v8,
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
      label: const Text('Select a number (0-1,000)'),
      items: List.generate(1000, (ii) => ii),
      itemBuilder: (value) => Text(value.toString()),
      selectedItemBuilder: (value) => Text('Number: $value'),
    );
  }
}

// =============================================================================
// CLASS: _TSelectAsync
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSelectAsync extends StatefulWidget {
  const _TSelectAsync();

  @override
  State<_TSelectAsync> createState() => _TSelectAsyncState();
}

class _TSelectAsyncState extends State<_TSelectAsync> {
  int buildIncrement = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSpace.v16,
      children: [
        TSelect.async(
          key: ValueKey(buildIncrement), // Demo purposes only
          label: const Text('Select a number (async)'),
          placeholderLoading: const Text('Loading numbers...'),
          items: () async {
            await Future<void>.delayed(const Duration(seconds: 1));
            return List.generate(100, (ii) => ii);
          },
          itemBuilder: (value) => Text(value.toString()),
          selectedItemBuilder: (value) => Text('Number: $value'),
        ),
        TButton.filled(
          child: const Text('Reload'),
          onPressed: () {
            setState(() => buildIncrement++);
          },
        ),
      ],
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
      label: const Text('Select a number'),
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
      label: const Text('Select a number'),
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
      label: const Text('Add a user'),
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
      label: const Text('Add a user'),
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
      label: const Text('Add a user'),
      items: const ['User A', 'User B', 'User C'],
      itemBuilder: (value) => Text(value),
      selectedItemBuilder: (value) => Text(value),
    );
  }
}

// =============================================================================
// CLASS: _TSelectPreventClose
// =============================================================================

@GenerateSource()
class _TSelectPreventClose extends StatelessWidget {
  const _TSelectPreventClose();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      initialValue: 'User B',
      allowDeselect: true,
      closeOnSelect: false,
      label: const Text('Add a user'),
      items: const ['User A', 'User B', 'User C'],
      itemBuilder: (value) => Text(value),
      selectedItemBuilder: (value) => Text(value),
    );
  }
}

// =============================================================================
// CLASS: _TSelectPreventClose
// =============================================================================

@GenerateSource()
class _TSelectPreventCloseOutside extends StatelessWidget {
  const _TSelectPreventCloseOutside();

  @override
  Widget build(BuildContext context) {
    return TSelect(
      initialValue: 'User B',
      closeOnTapOutside: false,
      label: const Text('Add a user'),
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
      label: const Text('Fruit Selection'),
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
            label: const Text('Add a user'),
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
