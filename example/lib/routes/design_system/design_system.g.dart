// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

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

/// Source code for [_TFontSizeExamples]
class _TFontSizeExamplesSource {
  static const String code = r"""
final tw = context.tw;
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final fontSize in TFontSize.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TFontSize.getName(fontSize),
            style: tw.text.style_xs.copyWith(
              color: TColors.sky,
              fontFamily: tw.text.fontFamilyMono,
            ),
          ),
          Text(
            'The quick brown fox jumps over the lazy dog.',
            style: TextStyle(fontSize: fontSize),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
  ],
);
""";
}

/// Source code for [_TFontWeightExamples]
class _TFontWeightExamplesSource {
  static const String code = r"""
final tw = context.tw;
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final fontWeight in TFontWeight.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TFontWeight.getName(fontWeight),
            style: tw.text.style_xs.copyWith(
              color: TColors.sky,
              fontFamily: tw.text.fontFamilyMono,
            ),
          ),
          Text(
            'The quick brown fox jumps over the lazy dog.',
            style: TextStyle(fontWeight: fontWeight),
          ),
        ],
      ),
  ],
);
""";
}

/// Source code for [_TLetterSpacingExamples]
class _TLetterSpacingExamplesSource {
  static const String code = r"""
final tw = context.tw;
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final letterSpacing in TLetterSpacing.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TLetterSpacing.getName(letterSpacing),
            style: tw.text.style_xs.copyWith(
              color: TColors.sky,
              fontFamily: tw.text.fontFamilyMono,
            ),
          ),
          Text(
            'The quick brown fox jumps over the lazy dog.',
            style: TextStyle(letterSpacing: letterSpacing),
          ),
        ],
      ),
  ],
);
""";
}

/// Source code for [_TLineHeightExamples]
class _TLineHeightExamplesSource {
  static const String code = r"""
final tw = context.tw;
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final lineHeight in TLineHeight.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: TOffset.b4,
            child: Text(
              TLineHeight.getName(lineHeight),
              style: tw.text.style_xs.copyWith(
                color: TColors.sky,
                fontFamily: tw.text.fontFamilyMono,
              ),
            ),
          ),
          Text(
            "So I started to walk into the water. I won't lie to you boys, I was terrified. But I pressed on, and as I made my way past the breakers a strange calm came over me. I don't know if it was divine intervention or the kinship of all living things but I tell you Jerry at that moment, I was a marine biologist.",
            style: TextStyle(height: lineHeight),
          ),
        ],
      ),
  ],
);
""";
}
