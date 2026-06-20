#let _budoux = plugin("typst-budoux.wasm")

/// BudouXで分割した日本語テキストを、適切な位置でのみ改行できるようにして返す。
#let segment(text) = str(_budoux.segment(bytes(text)))
