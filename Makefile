.DEFAULT_TARGET: help
.PHONY: help init code outdated upgrade test format

init:
	@find . -name pubspec.yaml -execdir bash -c "pwd && flutter pub get" \;

code:
	@code .vscode/flutter_tailwind_ui.code-workspace

outdated:
	@flutter pub outdated

upgrade:
	@flutter pub upgrade

analyze:
	flutter analyze

format:
	@dart format lib
	@dart run import_sorter:main

format-ci:
	@dart format lib --set-exit-if-changed
	@dart run import_sorter:main --exit-if-changed

test:
	@flutter test
