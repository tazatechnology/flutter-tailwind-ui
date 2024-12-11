// ignore_for_file: unnecessary_raw_strings
// Generated code - do not modify by hand

part of 'design_system.dart';

/// Source code for [_TFontFamily]
class _TFontFamilySource {
  static const String code = r"""
final tw = context.tw;
return Column(
  children: [
    Text(
      'This is the default serif font family.',
      style: TextStyle(fontFamily: tw.text.fontFamily),
    ),
    TSizedBox.y10,
    Text(
      'This is the default monospaced font family.',
      style: TextStyle(fontFamily: tw.text.fontFamilyMono),
    ),
  ],
);
""";
}

/// Source code for [_TFontSizes]
class _TFontSizesSource {
  static const String code = r"""
final tw = context.tw;

final styles = [
  tw.text.style_xs,
  tw.text.style_sm,
  tw.text.style_md,
  tw.text.style_lg,
  tw.text.style_xl,
  tw.text.style_2xl,
];

final styleNames = [
  'tw.text.style_xs',
  'tw.text.style_sm',
  'tw.text.style_md',
  'tw.text.style_lg',
  'tw.text.style_xl',
  'tw.text.style_2xl',
];

return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    for (var ii = 0; ii < styles.length; ii++) ...[
      Padding(
        padding: TOffset.b4,
        child: Text(
          styleNames[ii],
          style: tw.text.style_sm.copyWith(
            color: tw.colors.label,
            fontFamily: tw.text.fontFamilyMono,
          ),
        ),
      ),
      Padding(
        padding: TOffset.b4,
        child: Text(
          'The quick brown fox jumps over the lazy dog.',
          style: styles[ii],
        ),
      ),
      Padding(
        padding: TOffset.b12,
        child: Text(
          'The quick brown fox jumps over the lazy dog.',
          style: styles[ii].mono(context),
        ),
      ),
    ],
  ],
);
""";
}
