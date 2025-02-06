import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TFormController
// =============================================================================

/// Controller for [TForm]
class TFormController {
  /// The key used by the [Form] widget.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// The state of the form.
  FormState? get state => _formKey.currentState;

  /// Validates every [FormField] that is a descendant of this [Form]
  bool validate() {
    return state?.validate() ?? false;
  }

  /// Saves every [FormField] that is a descendant of this [Form].
  void save() {
    state?.save();
  }

  /// Resets the form fields and clears the stored values.
  void reset() {
    state?.reset();
  }

  /// Returns a list of all [FormFieldState] objects.
  ///
  /// This is used to access any/all generic [FormField] widgets in the form.
  List<FormFieldState<dynamic>> getFormFieldStates() {
    final List<FormFieldState<dynamic>> fields = [];
    final context = state?.context;
    if (context == null) {
      return fields;
    }

    void recursive(Element element) {
      element.visitChildElements((child) {
        if (child is StatefulElement) {
          final state = child.state;
          if (state is FormFieldState) {
            fields.add(state);
          }
        }
        recursive(child);
      });
    }

    recursive(context as Element);
    return fields;
  }

  /// Returns a map of [TFormField.id] keys to [FormFieldState.value]
  Map<Object, dynamic> getTFormFieldValues() {
    final fields = getTFormFieldStates();
    final result = <Object, dynamic>{};
    fields.forEach((key, value) {
      result[key] = value.value;
    });
    return result;
  }

  /// Returns a map of [TFormField.id] keys to [FormFieldState]
  Map<Object, FormFieldState<dynamic>> getTFormFieldStates() {
    final result = <Object, FormFieldState<dynamic>>{};
    final context = state?.context;
    if (context == null) {
      return result;
    }

    void visitElement(Element element) {
      if (element.widget is TFormField<dynamic>) {
        final tFormField = element.widget as TFormField<dynamic>;
        element.visitChildElements((childElement) {
          childElement.visitChildElements((grandChildElement) {
            if (grandChildElement is StatefulElement &&
                grandChildElement.state is FormFieldState<dynamic>) {
              result[tFormField.id] =
                  grandChildElement.state as FormFieldState<dynamic>;
            }
          });
        });
      }

      // Continue visiting deeper elements in the tree
      element.visitChildElements(visitElement);
    }

    visitElement(context as Element);
    return result;
  }
}

// =============================================================================
// CLASS: TFormField
// =============================================================================

/// A wrapper to manage form fields using [TFormController]
class TFormField<T> extends StatelessWidget {
  /// Constructor for a [TFormField]
  const TFormField({
    required this.id,
    required this.child,
    super.key,
  });

  /// The unique identifier for the form field.
  final Object id;

  /// The field to element to manage.
  final FormField<T> child;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey(id),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: TForm
// =============================================================================

/// A form widget with an external controller
class TForm extends StatefulWidget {
  /// Constructor a [TForm] widget.
  const TForm({
    required this.controller,
    required this.child,
    super.key,
  });

  /// The controller for the form.
  final TFormController controller;

  /// The form content
  final Widget child;

  @override
  State<TForm> createState() => _TFormState();
}

class _TFormState extends State<TForm> {
  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller._formKey,
      child: widget.child,
    );
  }
}
