
# 企画書

#### 制作者

5415031 癸生川裕紀



5415062 田中太樹



5415082 森田瑛仁



5416001 天本大陽



## 作品の目的

 高齢者向けに認知症予防を目的としたゲームを作成する。ゲーム自体は常日頃からやりつづけるというよりも暇な時にちょこっとやれる、手軽にやれることを目的に制作したい。また一人で黙々とやるよりも保育園児くらいのお孫さんや知人たちと競えるようにしてコミュニケーションの話題の一つになるようなものにしたい。


## 作品構想

- 一人で楽しめて、記録を他の人と共有

- 反射神経を必要としないカードゲームなど

- 脳トレ = 指を使ったりするが、タイピング技術をあまり必要としない

- ギャンブル要素 を記録にする

- 長時間はつらいので、1ゲームが短時間で終わる、または中断機能をつける ---> ミニゲームのオムニバス形式にする

- 高齢者の興味関心がありそうなコンテンツをキャラクターとして登場させる（和食、ボードゲーム、家族、・・・）

-

#### 具体例

- 買い物計算ゲーム

- 数字反転カードゲーム

- 対象をよける- 横スクロールゲーム

- スロットゲーム

- マウスでブロック崩しゲーム



## 作品の独創的な点

- 高齢者目線で設計されるUIでかんたん操作

- 数種類のミニゲームを用意




## システム設計



#### プロジェクト概要

Processingで作成したプログラムを processingjs.org よりダウンロードした変換用スクリプトとともに`assets`内に格納しておく。
`docs/index.html`内の`<script>`要素で変換用スクリプトを読み込み、`<canvas>`要素で`/assets/{sketch}/***.pde`を実行して描画する。




```
DIRECTORY TREE


.
├── images..................添付画像など
│   ├── xxx.png
│   ~
│   └── uml.svg.............UML図
├── docs
│   ├── index.html..........公開用Webページ
│   ├── readme.md...........説明用ドキュメント
│   ~
│   ├── tree.html...........ソースコード[RAW]公開用ぺージ
│   └── index.md............公開用Webページ草稿
└── assets
    ├── processing.js.......変換用スクリプト
    ├── processing.min.js...変換用スクリプト(縮小版)
    └── sketch_0xx..........ゲームプログラム
        ├── data............フォント格納用フォルダ
        ├── aaa.pde
        ~
        └── ccc.pde
        
        
 
        

```


#### ゲームプログラム詳細
状態を表す`State`クラスおよびその派生クラスを繰り返し実行してゲームの状態遷移を表現する。
ゲーム内の要素は`State`クラスで定義して、派生クラスで共通に使えるようにする。


![classDiagrams](../images/uml.svg)



## 制作計画

#### メモ共有 :

- Slack https://digicon1.slack.com/

- Poolsketch http://plsk.net/digicon2018



#### プロジェクト共有 :
- Github

#### UML描画ツール :
- yuml.me



#### 制作予定日時 :

- 毎週土曜12:00- など



<!--stackedit_data:

eyJoaXN0b3J5IjpbNTQxNTIxODY3LC0xMzUwMDAwOTA1LDEyNj

cxNTg2NjMsLTIyMDE3MDMzNSwtMTIzNzYxNjk2NiwtMTc4Mjc5

OTY5OF19

-->

<!--stackedit_data:

eyJoaXN0b3J5IjpbLTgxODY5MjUyNSwtODE4NjkyNTI1LDEzMz

k4ODM1MjksLTg4NzI3NDQ3MywtNDkwNTkyODU1LDE5MTA5MzMx

OSwtMTQ5OTk1ODU4MF19

-->
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyODQzNDU4MzUsMjEwMDE5NTk4Ml19
-->