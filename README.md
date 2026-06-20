# typst-budoux

[BudouX](https://github.com/google/budoux) による日本語の改行位置調整を、Typstの[Wasmプラグイン](https://typst.app/docs/reference/foundations/plugin/)として提供します。

文中の意味的なまとまり（チャンク）の境界以外では改行が起きないように、チャンク内の文字間にWORD JOINER (U+2060)、チャンクの境界にZERO WIDTH SPACE (U+200B)を挿入します。

## 利用方法

### インストール

[最新のリリース](https://github.com/appare45/typst-budoux/releases/latest)をダウンロードし、ローカルパッケージとして配置します。

```sh
curl -fsSL https://raw.githubusercontent.com/appare45/typst-budoux/main/install.sh | sh
```

内容を確認しながら実行したい場合は、同じ処理を直接実行できます。

```sh
PACKAGE_PATH="$(typst info --format json | jq -r '.packages["package-path"]')"

curl -fsSL -o /tmp/typst-budoux.zip https://github.com/appare45/typst-budoux/releases/latest/download/typst-budoux.zip
rm -rf /tmp/typst-budoux
unzip -o /tmp/typst-budoux.zip -d /tmp/typst-budoux

VERSION="$(grep '^version' /tmp/typst-budoux/typst.toml | sed -E 's/version = "(.*)"/\1/')"
PKG_DIR="$PACKAGE_PATH/local/budoux/$VERSION"
mkdir -p "$PKG_DIR"
cp -r /tmp/typst-budoux/. "$PKG_DIR"

rm -rf /tmp/typst-budoux.zip /tmp/typst-budoux
```

### 使い方

`install.sh` を実行すると、インストールしたバージョンが標準出力に表示されます。

```typst
#import "@local/budoux:0.1.1": segment

#set text(lang: "ja")
#segment("これは日本語の文章をBudouXで分割するテストです。")
```

`test.typ` に動作確認用の例があります。

```sh
typst compile test.typ test.png
```

スライドのタイトルを想定した例です。BudouXによって意味的なまとまりの境界で改行されていることがわかります。

![BudouXによる改行位置の比較](test.png)

## ライセンス

[Apache License 2.0](LICENSE-APACHE) または [MIT License](LICENSE-MIT) のデュアルライセンス（依存する[BudouX](https://github.com/google/budoux)がApache-2.0のため）。
