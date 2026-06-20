use budoux_phf_rs::Parser;
use wasm_minimal_protocol::*;

initiate_protocol!();

/// 入力テキストをBudouXで分割し、チャンク内の文字間にはWORD JOINER(U+2060、改行禁止)を、
/// チャンクの境界にはゼロ幅スペース(U+200B、改行許可)を挿入したUTF-8文字列を返す。
#[wasm_func]
pub fn segment(text: &[u8]) -> Vec<u8> {
    let text = core::str::from_utf8(text).unwrap();
    let parser = Parser::japanese_parser();
    let chunks = parser.parse(text);
    let mut out = String::new();
    for (i, chunk) in chunks.iter().enumerate() {
        if i > 0 {
            out.push('\u{200B}');
        }
        let mut chars = chunk.chars();
        if let Some(first) = chars.next() {
            out.push(first);
        }
        for c in chars {
            out.push('\u{2060}');
            out.push(c);
        }
    }
    out.into_bytes()
}
