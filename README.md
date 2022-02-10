# Go-Makefile

A Go project general Makefile, encapsulated some common Target. Inspired by [hgfischer/gomk](https://github.com/hgfischer/gomk)

## Language

[English](https://github.com/elliotxx/go-makefile/blob/master/README.md) | [简体中文](https://github.com/elliotxx/go-makefile/blob/master/README-zh.md)

## Usage

* Download `go.makefile` to your project:
```
curl -O https://raw.githubusercontent.com/elliotxx/go-makefile/master/go.makefile
```
* `include go.makefile` in a new or existing Makefile;
* add `coverage.out` to `.gitignore`;
* In the `Makefile` of your Go project, mark the available targets through `##`, `##` followed by the introduction of the target, and the targets marked through `##` will be displayed in the help list:

In `Makefile`：
```
hello:  ## Echo hello message
	echo "hello world"
```

In `terminal`：
```bash
$ make
help        This help message :)
hello       Echo hello message
......
```

## Limitation
* Must be referenced in `Makefile`, you can't be other file names

## Predefined variables

* `APPROOT`: Name of the application, based on the repository name. Such as `kubernetes`.
* `GOPKG`: Package name of the current go project. Such as `github.com/elliotxx/go-makefile`.
* `GOPKGS`: all Go pkgs inside the project repository
* `GOSOURCES`: all `.go` files inside the project repository
* `GOSOURCE_PATHS`: Source code paths of the current go project. Such as `./pkg/... ./cmd/...`.
* `COVERAGEOUT`: Coverage of the current go project. Default to `coverage.out`.

*NOTE*: Please check if the preset variables of the `go.makefile` conflict with the variable names in your `Makefile`

If you want to give priority to the variable values in your `Makefile`, you can use the following usage:
```
GOSOURCE_PATHS ?= ./pkg/... ./cmd/...
include go.makefile
```

## Predefined targets

* `help`: Show your `Makefile` and `go.makefile`. All available Targets and it`s profile
* `test`: Run all Go tests
* `cover`: Run all Go tests and generate coverage report file `${COVERAGEOUT}`
* `cover-html`: Display the visual results of the coverage report in the browser
* `format`: Format all Go files
* `lint`: Check all Go files using the Lint tool
* `lint-fix`: Lint, will try to fix errors and modify code
* `doc`: Start the documentation server with godoc

## Adoption
* [elliotxx/go-web-prototype](https://github.com/elliotxx/go-web-prototype)
* [elliotxx/go-cli-prototype](https://github.com/elliotxx/go-cli-prototype)
