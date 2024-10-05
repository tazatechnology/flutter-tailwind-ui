/// Tailwind screen breakpoints for responsive design.
///
/// https://tailwindcss.com/docs/screens
abstract final class TScreen {
  /// Screen size for small devices, starting at 640px (sm)
  static const bp1 = 640.0;

  /// Screen size for medium devices, starting at 768px (md)
  static const bp2 = 768.0;

  /// Screen size for large devices, starting at 1024px (lg)
  static const bp3 = 1024.0;

  /// Screen size for extra-large devices, starting at 1280px (xl)
  static const bp4 = 1280.0;

  /// Screen size for extra-extra-large devices, starting at 1536px (2xl)
  static const bp5 = 1536.0;

  /// Get the screen size based on the name.
  ///
  /// The name can be one of the following:
  /// - `sm` or `bp1` (640px)
  /// - `md` or `bp2` (768px)
  /// - `lg` or `bp3` (1024px)
  /// - `xl` or `bp4` (1280px)
  /// - `2xl` or `bp5` (1536px)
  static double get(String name) {
    final screenName = name.trim().toLowerCase();
    switch (screenName) {
      case 'sm':
      case 'bp1':
        return bp1;
      case 'md':
      case 'bp2':
        return bp2;
      case 'lg':
      case 'bp3':
        return bp3;
      case 'xl':
      case 'bp4':
        return bp4;
      case '2xl':
      case 'bp5':
        return bp5;
      default:
        throw Exception('Invalid screen name: $name');
    }
  }
}
