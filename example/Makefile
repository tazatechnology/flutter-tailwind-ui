.DEFAULT_TARGET: init
.PHONY: init code outdated upgrade analyze format test

MAKEFLAGS = --no-print-directory
ROOT = $(shell git rev-parse --show-toplevel)
ARGS ?=

init:
	@find $(ROOT) -name pubspec.yaml -execdir bash -c "pwd && flutter pub get" \;

code:
	@code $(ROOT)/.vscode/flutter_tailwind_ui.code-workspace

outdated:
	@flutter pub outdated $(ARGS)

upgrade:
	@flutter pub upgrade $(ARGS)

analyze:
	@flutter analyze $(ARGS)

format:
	@dart format lib
	@dart fix --apply

format-ci:
	@dart format lib --set-exit-if-changed

test:
	@flutter test -r expanded $(ARGS)

clean:
	@flutter clean
	@make init

build-linux: clean
	@flutter build linux

build-macos: clean
	@flutter build macos

build-web: clean
	@flutter build web --tree-shake-icons

build-windows: clean
	@flutter build windows

run: clean
	@flutter run --release

run-linux: clean
	@flutter run --release -d linux

run-macos: clean
	@flutter run --release -d macos

run-web: clean
	@flutter run --release -d chrome

run-windows: clean
	@flutter run --release -d windows

pods-macos: clean
	rm -rf ~/Library/Developer/Xcode/DerivedData
	cd macos && rm -rf Podfile.lock
	cd macos && rm -rf Pods
	cd macos && pod repo update
	cd macos && pod cache clean --all
	cd macos && pod deintegrate
	cd macos && pod setup
	cd macos && pod install --repo-update
