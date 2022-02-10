# Go-Makefile

一个 Go 项目的通用 Makefile，封装了一些 Go 项目的常用 Target，启发于 [hgfischer/gomk](https://github.com/hgfischer/gomk)。

## 使用
* 将 `go.makefile` 下载到你的 Go 项目根目录
```
curl -O https://raw.githubusercontent.com/elliotxx/go-makefile/master/go.makefile
```
* 在你的 Go 项目的 `Makefile` 中引用 `go.makefile`，比如 `include go.makefile`
* 在你的 Go 项目的 `.gitignore` 中添加 `coverage.out`
* 在你的 Go 项目的 `Makefile` 中通过 `##` 标注可用的 target，`##` 后面跟着 target 的简介，通过 `##` 标注的 target 会显示在 help 列表中，比如：

`Makefile` 中添加：
```
hello:  ## Echo hello message
	echo "hello world"
```
`terminal` 中使用：
```bash
$ make
help        This help message :)
hello       Echo hello message
......
```

## 限制
* 必须在 `Makefile` 中引用 `go.makefile`，不能是其它文件名

## 预置变量
* `APPROOT`: 你的应用名称，是你的项目根目录名称，比如：`kubernetes`
* `GOPKG`: 当前 Go 项目的包名，比如 `github.com/elliotxx/go-makefile`
* `GOPKGS`: 当前 Go 项目的所有包名
* `GOSOURCES`: 当前 Go 项目的所有 `.go` 文件
* `GOSOURCE_PATHS`: 当前 Go 项目的源代码目录，比如：`./pkg/... ./cmd/...`
* `COVERAGEOUT`: 当前 Go 项目的覆盖率报告文件，默认为：`coverage.out`

*NOTE*: 请自行检查 `go.makefile` 的预置变量是否和你的 `Makefile` 中的变量名冲突
如果希望优先使用你的 `Makefile` 中的变量值，可以使用如下定义：
```
GOSOURCE_PATHS ?= ./pkg/... ./cmd/...
include go.makefile
```

## 预置 Target
* `help`: 显示你的 `Makefile` 和 `go.makefile` 中所有可用的 target 及其简介
* `test`: 运行所有 Go 单元测试
* `cover`: 运行所有 Go 单元测试并生成覆盖率报告文件 `${COVERAGEOUT}`
* `cover-html`: 在浏览器中显示覆盖率报告的可视化结果
* `format`: 格式化所有 Go 源代码
* `lint`: 使用 lint 工具检查所有 Go 源代码
* `lint-fix`: 尝试自动修复 lint 工具检查出的问题
* `doc`: 使用 godoc 启动文档服务器

## 用户
* [elliotxx/go-web-prototype](https://github.com/elliotxx/go-web-prototype)
* [elliotxx/go-cli-prototype](https://github.com/elliotxx/go-cli-prototype)