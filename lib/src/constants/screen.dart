// ignore_for_file: constant_identifier_names

/// Tailwind screen breakpoints for responsive design.
///
/// https://tailwindcss.com/docs/screens
abstract final class TScreen {
  /// Screen size for small devices, starting at 640px (sm)
  static const breakpoint_sm = 640.0;

  /// Screen size for medium devices, starting at 768px (md)
  static const breakpoint_md = 768.0;

  /// Screen size for large devices, starting at 1024px (lg)
  static const breakpoint_lg = 1024.0;

  /// Screen size for extra-large devices, starting at 1280px (xl)
  static const breakpoint_xl = 1280.0;

  /// Screen size for extra-extra-large devices, starting at 1536px (2xl)
  static const breakpoint_2xl = 1536.0;

  /// Get the screen size based on the name.
  ///
  /// The name can be one of the following:
  /// - `sm` or `breakpoint_sm` (640px)
  /// - `md` or `breakpoint_md` (768px)
  /// - `lg` or `breakpoint_lg` (1024px)
  /// - `xl` or `breakpoint_xl` (1280px)
  /// - `2xl` or `breakpoint_2xl` (1536px)
  static double get(String name) {
    final screenName = name.trim().toLowerCase();
    switch (screenName) {
      case 'sm':
      case 'breakpoint_sm':
        return breakpoint_sm;
      case 'md':
      case 'breakpoint_md':
        return breakpoint_md;
      case 'lg':
      case 'breakpoint_lg':
        return breakpoint_lg;
      case 'xl':
      case 'breakpoint_xl':
        return breakpoint_xl;
      case '2xl':
      case 'breakpoint_2xl':
        return breakpoint_2xl;
      default:
        throw Exception('Invalid screen name: $name');
    }
  }
}
