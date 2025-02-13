// Prefer to use underscore to match filenames
// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_app/routes/routes.dart';

import 'package:go_router/go_router.dart';

/// App router provider
final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref: ref));

// =============================================================================
// CLASS: AppRouter
// =============================================================================

class AppRouter {
  AppRouter({
    required this.ref,
  }) {
    final routeMap = <String, Widget>{
      // Design System
      AppRouter.colors: const ColorsRoute(),
      AppRouter.spacing: const SpacingRoute(),
      AppRouter.border_radius: const BorderRadiusRoute(),
      AppRouter.font_family: const TypographyRouteFontFamily(),
      AppRouter.font_size: const TypographyRouteFontSize(),
      AppRouter.font_weight: const TypographyRouteFontWeight(),
      AppRouter.letter_spacing: const TypographyRouteLetterSpacing(),
      // Components
      AppRouter.alert: const ComponentRouteTAlert(),
      AppRouter.backdrop_filter: const ComponentRouteTBackdropFilter(),
      AppRouter.badge: const ComponentRouteTBadge(),
      AppRouter.button: const ComponentRouteTButton(),
      AppRouter.card: const ComponentRouteTCard(),
      AppRouter.checkbox: const ComponentRouteTCheckbox(),
      AppRouter.checkbox_group: const ComponentRouteTCheckboxGroup(),
      AppRouter.checkbox_tile: const ComponentRouteTCheckboxTile(),
      AppRouter.code_block: const ComponentRouteTCodeBlock(),
      AppRouter.dialog: const ComponentRouteTDialog(),
      AppRouter.expand: const ComponentRouteTExpand(),
      AppRouter.popover: const ComponentRouteTPopover(),
      AppRouter.filter: const ComponentRouteTFilter(),
      AppRouter.form: const ComponentRouteTForm(),
      AppRouter.form_field: const ComponentRouteTFormField(),
      AppRouter.icon_button: const ComponentRouteTIconButton(),
      AppRouter.input: const ComponentRouteTInput(),
      AppRouter.link: const ComponentRouteTLink(),
      AppRouter.split_button: const ComponentRouteTSplitButton(),
      AppRouter.radio: const ComponentRouteTRadio(),
      AppRouter.radio_group: const ComponentRouteTRadioGroup(),
      AppRouter.row_column: const ComponentRouteTRowColumn(),
      AppRouter.scrollbar: const ComponentRouteTScrollbar(),
      AppRouter.select: const ComponentRouteTSelect(),
      AppRouter.sized_box: const ComponentRouteTSizedBox(),
      AppRouter.slider: const ComponentRouteTSlider(),
      AppRouter.switch_control: const ComponentRouteTSwitch(),
      AppRouter.switch_group: const ComponentRouteTSwitchGroup(),
      AppRouter.switch_tile: const ComponentRouteTSwitchTile(),
      AppRouter.text: const ComponentRouteTText(),
    };

    final routes = [
      /// Getting Started
      GoRoute(
        name: about,
        path: '/',
        builder: (context, state) => const AboutRoute(),
      ),
      GoRoute(
        name: usage,
        path: '/$usage',
        builder: (context, state) => const UsageRoute(),
      ),
      for (final r in routeMap.entries)
        GoRoute(
          name: r.key,
          path: '/${r.key}',
          builder: (context, state) => r.value,
        ),
    ];

    /// Build the outer instance
    router = GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return AppScaffold(child: child);
          },
          routes: routes,
        ),
      ],
      redirect: (context, state) {
        // Redirect to the default route on page not found
        if (state.topRoute == null) {
          return '/';
        }
        return null;
      },
    );
  }
  final Ref<AppRouter> ref;
  late final GoRouter router;

  /// Getting Started
  static const String about = 'about';
  static const String usage = 'usage';

  /// Design System
  static const String colors = 'colors';
  static const String spacing = 'spacing';
  static const String border_radius = 'border-radius';
  static const String font_family = 'font-family';
  static const String font_size = 'font-size';
  static const String font_weight = 'font-weight';
  static const String letter_spacing = 'letter-spacing';

  /// Components
  static const String alert = 'alert';
  static const String backdrop_filter = 'backdrop-filter';
  static const String badge = 'badge';
  static const String button = 'button';
  static const String card = 'card';
  static const String checkbox = 'checkbox';
  static const String checkbox_group = 'checkbox-group';
  static const String checkbox_tile = 'checkbox-tile';
  static const String code_block = 'code-block';
  static const String dialog = 'dialog';
  static const String expand = 'expand';
  static const String popover = 'popover';
  static const String filter = 'filter';
  static const String form = 'form';
  static const String form_field = 'form-field';
  static const String icon_button = 'icon-button';
  static const String input = 'input';
  static const String link = 'link';
  static const String radio = 'radio';
  static const String radio_group = 'radio-group';
  static const String row_column = 'row-column';
  static const String scrollbar = 'scrollbar';
  static const String select = 'select';
  static const String sized_box = 'sized-box';
  static const String slider = 'slider';
  static const String split_button = 'split-button';
  static const String switch_control = 'switch';
  static const String switch_group = 'switch-group';
  static const String switch_tile = 'switch-tile';
  static const String text = 'text';
}
