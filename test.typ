// 実際の利用時は `#import "@local/budoux:VERSION": segment` を使う（VERSIONはinstall.shの出力を参照）
#import "lib.typ": segment

#set page(width: 24cm, height: 13.5cm, margin: 1.5cm)
#set text(lang: "ja", size: 28pt, weight: "bold")

#let title = "持続可能な開発目標について考える"

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,
  align: (center, center),
  [
    #text(size: 16pt, weight: "regular")[BudouXなし]
    #v(0.5cm)
    #box(width: 8cm, fill: yellow, inset: 12pt)[#title]
  ],
  [
    #text(size: 16pt, weight: "regular")[BudouXあり]
    #v(0.5cm)
    #box(width: 8cm, fill: yellow, inset: 12pt)[#segment(title)]
  ],
)
