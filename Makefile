.DEFAULT_TARGET: help
.PHONY: help init code outdated upgrade test format

ARGS ?=

init:
	@find . -name pubspec.yaml -execdir bash -c "pwd && flutter pub get" \;

code:
	@code .vscode/flutter_tailwind_ui.code-workspace

outdated:
	@flutter pub outdated $(ARGS)

upgrade:
	@flutter pub upgrade $(ARGS)

analyze:
	flutter analyze $(ARGS)

format:
	@dart format lib $(ARGS)
	@dart run import_sorter:main $(ARGS)

format-ci:
	@dart format lib --set-exit-if-changed $(ARGS)
	@dart run import_sorter:main --exit-if-changed $(ARGS)

test:
	@flutter test -r expanded $(ARGS)
