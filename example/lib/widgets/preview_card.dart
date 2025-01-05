import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/widgets/code_result_card.dart';

// =============================================================================
// CLASS: AppPreviewCard
// =============================================================================

class AppPreviewCard extends ConsumerStatefulWidget {
  const AppPreviewCard({
    required this.code,
    required this.child,
    this.title,
    this.alignment = Alignment.center,
    this.description,
    super.key,
  });
  final String? title;
  final String? description;
  final String code;
  final Widget child;
  final Alignment alignment;

  @override
  ConsumerState<AppPreviewCard> createState() => _AppPreviewCardState();
}

class _AppPreviewCardState extends ConsumerState<AppPreviewCard> {
  final controllerPreview = WidgetStatesController({WidgetState.selected});
  final controllerCode = WidgetStatesController();
  bool get showCode => controllerCode.value.selected;

  // ---------------------------------------------------------------------------
  // METHOD: toggleCodeView
  // ---------------------------------------------------------------------------

  void toggleCodeView({required bool value}) {
    if (controllerCode.value.selected == value) {
      return;
    }
    setState(() {
      controllerPreview.update(WidgetState.selected, !value);
      controllerCode.update(WidgetState.selected, value);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final codeFontSize = tw.screen.is_md ? 13.0 : 12.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.title != null)
              TText(
                widget.title!,
                style: tw.text.style_sm.semibold,
              ),
            if (widget.title == null) const Spacer(),
            Container(
              padding: TOffset.a2,
              decoration: BoxDecoration(
                color: TColors.slate[tw.light ? 100 : 800],
                borderRadius: TBorderRadius.rounded_md,
              ),
              child: Row(
                children: [
                  _ToggleButton(
                    label: 'Preview',
                    icon: Icons.visibility_outlined,
                    controller: controllerPreview,
                    onTap: () => toggleCodeView(value: false),
                  ),
                  TSizedBox.x4,
                  _ToggleButton(
                    label: 'Code',
                    icon: Icons.code,
                    controller: controllerCode,
                    onTap: () => toggleCodeView(value: true),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (widget.description != null && widget.description!.isNotEmpty)
          Padding(
            padding: TOffset.t12,
            child: TText(
              widget.description!,
              style: tw.text.style_sm.copyWith(
                height: TTextStyle.text_md.height,
              ),
            ),
          ),
        if (!showCode)
          AppCodeResultCard(
            margin: TOffset.y16,
            alignment: widget.alignment,
            child: widget.child,
          ),
        if (showCode)
          TCodeBlock(
            code: widget.code,
            scrollDirection: Axis.horizontal,
            theme: TCodeBlockTheme(
              backgroundColor: tw.dark ? tw.colors.card : null,
              margin: TOffset.y16,
              fontSize: codeFontSize,
              constraints: const BoxConstraints(
                minHeight: AppCodeResultCard.minHeight,
              ),
            ),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _ToggleButton
// =============================================================================

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.controller,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final WidgetStatesController controller;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final selectedColor = tw.light ? Colors.white : TColors.slate.shade700;
    final selected = controller.value.selected;
    final variant = selected ? TVariant.filled : TVariant.basic;
    final icon = Icon(this.icon, color: selected ? TColors.sky : null);
    final color = selected ? selectedColor : null;
    final width = tw.screen.is_md ? 100.0 : 50.0;

    if (tw.screen.is_md) {
      return SizedBox(
        width: width,
        child: TButton.raw(
          variant: variant,
          color: color,
          onPressed: onTap,
          size: TButtonSize.xs,
          leading: icon,
          child: Text(label),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        child: TIconButton.raw(
          variant: variant,
          color: color,
          onPressed: onTap,
          size: TButtonSize.xs,
          icon: icon,
        ),
      );
    }
  }
}
