import 'package:flutter/services.dart';

// =============================================================================
// EXTENSION: KeyEvent
// =============================================================================

/// Extension on [KeyEvent] to provide useful methods
extension XTailwindKeyEvent on KeyEvent {
  /// Is this a key down event
  bool get isKeyDown => this is KeyDownEvent;

  /// Is this a key up event
  bool get isKeyUp => this is KeyUpEvent;

  /// Is this a key repeat event
  bool get isKeyRepeat => this is KeyRepeatEvent;

  /// Is this a space key down event
  bool get isSpaceKeyDown => isKeyDown && logicalKey.isSpace;

  /// Is this a space key up event
  bool get isSpaceKeyUp => isKeyUp && logicalKey.isSpace;

  /// Is this a enter key down event
  bool get isEnterKeyDown => isKeyDown && logicalKey.isEnter;

  /// Is this a enter key up event
  bool get isEnterKeyUp => isKeyUp && logicalKey.isEnter;

  /// Is this a tab key down event
  bool get isTabKeyDown => isKeyDown && logicalKey.isTab;

  /// Is this a tab key up event
  bool get isTabKeyUp => isKeyUp && logicalKey.isTab;

  /// Is this a escape key down event
  bool get isEscapeKeyDown => isKeyDown && logicalKey.isEscape;

  /// Is this a escape key up event
  bool get isEscapeKeyUp => isKeyUp && logicalKey.isEscape;

  /// Is this a backspace key down event
  bool get isBackspaceKeyDown => isKeyDown && logicalKey.isBackspace;

  /// Is this a backspace key up event
  bool get isBackspaceKeyUp => isKeyUp && logicalKey.isBackspace;

  /// Is this a delete key down event
  bool get isDeleteKeyDown => isKeyDown && logicalKey.isDelete;

  /// Is this a delete key up event
  bool get isDeleteKeyUp => isKeyUp && logicalKey.isDelete;

  /// Is this an arrow-up key down event
  bool get isArrowUpKeyDown => isKeyDown && logicalKey.isArrowUp;

  /// Is this an arrow-up key up event
  bool get isArrowUpKeyUp => isKeyUp && logicalKey.isArrowUp;

  /// Is this an arrow-down key down event
  bool get isArrowDownKeyDown => isKeyDown && logicalKey.isArrowDown;

  /// Is this an arrow-down key up event
  bool get isArrowDownKeyUp => isKeyUp && logicalKey.isArrowDown;

  /// Is this an arrow-left key down event
  bool get isArrowLeftKeyDown => isKeyDown && logicalKey.isArrowLeft;

  /// Is this an arrow-left key up event
  bool get isArrowLeftKeyUp => isKeyUp && logicalKey.isArrowLeft;

  /// Is this an arrow-right key down event
  bool get isArrowRightKeyDown => isKeyDown && logicalKey.isArrowRight;

  /// Is this an arrow-right key up event
  bool get isArrowRightKeyUp => isKeyUp && logicalKey.isArrowRight;
}

// =============================================================================
// EXTENSION: LogicalKeyboardKey
// =============================================================================

/// Extension on [LogicalKeyboardKey] to provide useful methods
extension XTailwindLogicalKeyboardKey on LogicalKeyboardKey {
  /// Is this a space key
  bool get isSpace => this == LogicalKeyboardKey.space;

  /// Is this a enter key
  bool get isEnter =>
      this == LogicalKeyboardKey.enter ||
      this == LogicalKeyboardKey.numpadEnter;

  /// Is this a tab key
  bool get isTab => this == LogicalKeyboardKey.tab;

  /// Is this a escape key
  bool get isEscape => this == LogicalKeyboardKey.escape;

  /// Is this a backspace key
  bool get isBackspace => this == LogicalKeyboardKey.backspace;

  /// Is this a delete key
  bool get isDelete => this == LogicalKeyboardKey.delete;

  /// Is this an arrow-up key
  bool get isArrowUp => this == LogicalKeyboardKey.arrowUp;

  /// Is this an arrow-down key
  bool get isArrowDown => this == LogicalKeyboardKey.arrowDown;

  /// Is this an arrow-left key
  bool get isArrowLeft => this == LogicalKeyboardKey.arrowLeft;

  /// Is this an arrow-right key
  bool get isArrowRight => this == LogicalKeyboardKey.arrowRight;
}
