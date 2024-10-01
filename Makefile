.DEFAULT_TARGET: help

init:
	@find . -name pubspec.yaml -execdir bash -c "pwd && flutter pub get" \;

code:
	@code .vscode/flutter_tailwind_ui.code-workspace