import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/widgets/code_result_card.dart';

// =============================================================================
// CLASS: AppPreviewCard
// =============================================================================

class AppPreviewCard extends StatefulWidget {
  const AppPreviewCard({
    required this.code,
    required this.child,
    this.title,
    this.alignment = Alignment.center,
    this.description,
    this.reference,
    this.initialShowCode = false,
    this.maxWidth = TScreen.max_md,
    super.key,
  });
  final String? title;
  final String? description;
  final String? reference;
  final String code;
  final Widget child;
  final Alignment alignment;
  final bool initialShowCode;
  final double? maxWidth;

  @override
  State<AppPreviewCard> createState() => _AppPreviewCardState();
}

class _AppPreviewCardState extends State<AppPreviewCard> {
  late final WidgetStatesController controllerPreview;
  late final WidgetStatesController controllerCode;
  bool get showCode => controllerCode.value.selected;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    if (widget.initialShowCode) {
      controllerPreview = WidgetStatesController();
      controllerCode = WidgetStatesController({WidgetState.selected});
    } else {
      controllerPreview = WidgetStatesController({WidgetState.selected});
      controllerCode = WidgetStatesController();
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    controllerPreview.dispose();
    controllerCode.dispose();
    super.dispose();
  }

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
    final codeFontSize = tw.screen.is_md ? 11.0 : 10.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.title != null)
              Flexible(
                child: TText(
                  widget.title!,
                  style: TTextStyle.text_sm.copyWith(
                    fontWeight: TFontWeight.semibold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (widget.reference != null && widget.reference!.isNotEmpty)
              ReferenceBadge(
                reference: widget.reference!,
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
              style: TTextStyle.text_sm,
            ),
          ),
        ExcludeFocus(
          excluding: showCode,
          child: ExcludeFocusTraversal(
            excluding: showCode,
            child: Offstage(
              offstage: showCode,
              child: AppCodeResultCard(
                margin: TOffset.y16,
                alignment: widget.alignment,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: widget.maxWidth ?? double.infinity,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
        ExcludeFocus(
          excluding: !showCode,
          child: ExcludeFocusTraversal(
            excluding: !showCode,
            child: Offstage(
              offstage: !showCode,
              child: TCodeBlock(
                code: widget.code,
                scrollDirection: Axis.horizontal,
                theme: TCodeBlockTheme(
                  backgroundColor: tw.dark ? tw.color.card : null,
                  margin: TOffset.y16,
                  fontSize: codeFontSize,
                  constraints: const BoxConstraints(
                    minHeight: AppCodeResultCard.minHeight,
                  ),
                ),
              ),
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
    final variant = selected ? TStyleVariant.filled : TStyleVariant.basic;
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
          size: TWidgetSize.xs,
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
          size: TWidgetSize.xs,
          icon: icon,
        ),
      );
    }
  }
}
