import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TDialog
// =============================================================================

/// A modal dialog component.
class TDialog extends StatelessWidget {
  /// Constructor a [TDialog] widget.
  const TDialog({
    super.key,
    this.icon,
    this.title,
    this.content,
    this.actions,
    this.actionsSpacing = TSpace.v12,
    this.actionsAlignment = MainAxisAlignment.end,
    this.maxWidth = TScreen.max_lg,
    this.showCancel = true,
    this.cancel = const Text('Cancel'),
    this.showClose = false,
    this.close = const Icon(Icons.close),
    this.titleTextStyle,
    this.contentTextStyle,
  });

  /// The icon to display in the top center of the dialog.
  ///
  /// When provided, the [title] will be displayed below the icon and all the
  /// content will be centered. Actions will be expanded to the full width.
  final Widget? icon;

  /// The title widget to display in the dialog.
  final Widget? title;

  /// The child widget to display in the dialog.
  final Widget? content;

  /// The actions to display in the dialog.
  final List<Widget>? actions;

  /// The spacing between the actions.
  final double actionsSpacing;

  /// The alignment of the actions.
  final MainAxisAlignment actionsAlignment;

  /// The maximum width of the dialog.
  final double maxWidth;

  /// Automatically adds a cancel button to the dialog.
  final bool showCancel;

  /// The widget to display in the default cancel button.
  ///
  /// This widget is automatically wrapped in a [TButton.outlined] widget with a
  /// callback to close the dialog.
  final Widget cancel;

  /// Add a close button to the dialog (upper right corner).
  final bool showClose;

  /// The widget to display in the default close button.
  ///
  /// This widget is automatically wrapped in a [TIconButton] widget with a
  /// callback to close the dialog.
  final Widget close;

  /// The text style of the dialog title.
  final TextStyle? titleTextStyle;

  /// The text style of the dialog content.
  final TextStyle? contentTextStyle;

  // ---------------------------------------------------------------------------
  // METHOD: show
  // ---------------------------------------------------------------------------

  /// A Tailwind inspired dialog enter/exit animation.
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Duration transitionDuration = const Duration(milliseconds: 250),
    String? barrierLabel,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
  }) async {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel ?? 'TDialog',
      barrierColor:
          context.theme.dialogTheme.barrierColor ?? context.tw.color.barrier,
      transitionDuration: transitionDuration,
      useRootNavigator: useRootNavigator,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        if (animation.status == AnimationStatus.completed) {
          return child;
        }
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final width = tw.screen.width;
    final dialogTheme = context.theme.dialogTheme;

    final effectiveIcon = icon != null ? Center(child: icon) : null;

    final bool centered = effectiveIcon != null;

    /// Resolve the effective title.
    Widget? effectiveTitle =
        title != null ? SelectionArea(child: title!) : null;

    final actionsAxis =
        tw.screen.is_xs || !centered ? Axis.horizontal : Axis.vertical;

    /// Resolve the effective content.
    Widget? effectiveContent;
    if (content != null) {
      effectiveContent = SelectionArea(
        child: SizedBox(
          width: tw.screen.width,
          child: DefaultTextStyle.merge(
            child: content!,
            textAlign: centered ? TextAlign.center : TextAlign.start,
          ),
        ),
      );
    }

    /// Resolve the effective actions.
    List<Widget> effectiveActions = List.from(actions ?? <Widget>[]);
    if (showCancel) {
      final effectiveCancel = TButton.outlined(
        child: cancel,
        onPressed: () => Navigator.of(context).pop(),
      );
      if (actionsAlignment == MainAxisAlignment.start) {
        effectiveActions.add(effectiveCancel);
      } else {
        effectiveActions.insert(0, effectiveCancel);
      }
    }

    if (centered) {
      for (var i = 0; i < effectiveActions.length; i++) {
        if (actionsAxis == Axis.horizontal) {
          effectiveActions[i] = Expanded(child: effectiveActions[i]);
        } else {
          effectiveActions[i] = TExpand.width(child: effectiveActions[i]);
        }
      }
      // On mobile, the actions should be reversed
      if (actionsAxis == Axis.vertical &&
          actionsAlignment == MainAxisAlignment.end) {
        effectiveActions = effectiveActions.reversed.toList();
      }
    }

    /// Resolve all the padding values.
    EdgeInsets titlePadding = TOffset.x24.copyWith(
      top: icon != null ? TSpace.v8 : TSpace.v24,
      bottom: 0,
    );
    EdgeInsets contentPadding = TOffset.a24.copyWith(
      top: title != null ? TSpace.v8 : TSpace.v24,
    );
    final actionsPadding = TOffset.a24.copyWith(
      top: content != null ? TSpace.v0 : TSpace.v24,
    );

    /// Resolve the effective close button.
    final effectiveClose = TIconButton(
      size: TWidgetSize.xs,
      icon: close,
      onPressed: () => Navigator.of(context).pop(),
    );

    /// Stack the close button on top of the title or content.
    if (showClose) {
      if (effectiveTitle != null) {
        effectiveTitle = Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.centerEnd,
          children: [
            TExpand.width(
              child: Padding(padding: titlePadding, child: effectiveTitle),
            ),
            Positioned(
              top: titlePadding.top / 2,
              right: titlePadding.right / 2,
              child: effectiveClose,
            ),
          ],
        );
        titlePadding = EdgeInsets.zero;
      } else if (effectiveContent != null) {
        effectiveContent = Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Padding(padding: contentPadding, child: effectiveContent),
            Positioned(
              top: contentPadding.top / 2,
              right: contentPadding.right / 2,
              child: effectiveClose,
            ),
          ],
        );
        contentPadding = EdgeInsets.zero;
      }
    }

    final effectiveTitleTextStyle =
        (dialogTheme.titleTextStyle ?? const TextStyle()).merge(titleTextStyle);

    final effectiveContentTextStyle =
        (dialogTheme.contentTextStyle ?? const TextStyle())
            .merge(contentTextStyle);

    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: ((width - maxWidth) / 2).clamp(TSpace.v16, width),
      ),
      iconColor: tw.color.primary,
      iconPadding: TOffset.t24 + TOffset.x24,
      titlePadding: titlePadding,
      contentPadding: contentPadding,
      actionsPadding: actionsPadding,
      titleTextStyle: effectiveTitleTextStyle,
      contentTextStyle: effectiveContentTextStyle,
      icon: effectiveIcon,
      title: effectiveTitle,
      content: effectiveContent,
      actions: effectiveActions.isNotEmpty
          ? [
              TRowColumn(
                axis: actionsAxis,
                spacing: actionsSpacing,
                mainAxisAlignment: actionsAlignment,
                mainAxisSize: MainAxisSize.max,
                children: effectiveActions,
              ),
            ]
          : null,
    );
  }
}
