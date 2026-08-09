.PHONY: generate build-ios build-watch test clean check

generate:
	./scripts/generate.sh

build-ios:
	./scripts/build-ios.sh

build-watch:
	./scripts/build-watch.sh

test:
	./scripts/test.sh

clean:
	./scripts/clean.sh

check:
	./scripts/check-before-commit.sh
