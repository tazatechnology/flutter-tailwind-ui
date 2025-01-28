// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

part of 'typography.dart';

/// Source code for [_TFontFamily]
class _TFontFamilySource {
  static const String code = r"""
const Text(
  'This is the default serif font family.',
  style: TextStyle(fontFamily: TTextStyle.fontFamily),
)
""";
}

/// Source code for [_TFontFamilyMono]
class _TFontFamilyMonoSource {
  static const String code = r"""
const Text(
  'This is the default monospaced font family.',
  style: TextStyle(fontFamily: TTextStyle.fontFamilyMono),
)
""";
}

/// Source code for [_TFontSizeExamples]
class _TFontSizeExamplesSource {
  static const String code = r"""
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final fontSize in TFontSize.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TFontSize.getName(fontSize),
            style: TTextStyle.text_xs.copyWith(
              color: TColors.sky,
              fontFamily: TTextStyle.fontFamilyMono,
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
)
""";
}

/// Source code for [_TFontWeightExamples]
class _TFontWeightExamplesSource {
  static const String code = r"""
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final fontWeight in TFontWeight.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TFontWeight.getName(fontWeight),
            style: TTextStyle.text_xs.copyWith(
              color: TColors.sky,
              fontFamily: TTextStyle.fontFamilyMono,
            ),
          ),
          Text(
            'The quick brown fox jumps over the lazy dog.',
            style: TextStyle(fontWeight: fontWeight),
          ),
        ],
      ),
  ],
)
""";
}

/// Source code for [_TLetterSpacingExamples]
class _TLetterSpacingExamplesSource {
  static const String code = r"""
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: TSpace.v32,
  children: [
    for (final letterSpacing in TLetterSpacing.values)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TLetterSpacing.getName(letterSpacing),
            style: TTextStyle.text_xs.copyWith(
              color: TColors.sky,
              fontFamily: TTextStyle.fontFamilyMono,
            ),
          ),
          Text(
            'The quick brown fox jumps over the lazy dog.',
            style: TextStyle(letterSpacing: letterSpacing),
          ),
        ],
      ),
  ],
)
""";
}
