**Exec**
```
ruby index.rb {operation}
```

**Operation**
- create 
- read
- delete
- average
- read_as_html

**概要**
- テストは任意
- 個人GitにPUSH

**BackLog**
- 1st
1. スコアをファイルに登録する
2. スコアをファイルに追記する
3. スコアを全て読み込む
4. 指定したファイル行のスコアを削除する
5. スコア登録に数値チェック、100以内チェックを入れる
6. スコアの平均を求める
- 2nd
7. スコア登録成功、validationエラーの出力に色をつける
8. スコアをhtmlフォーマットで読み込む
9. スコア情報に名前を追加(create, readに反映)

**Point**
- Primitive Obsession(最初に伝える)
- 委譲(delegate)
- ユーティリティ
- ダックタイピング/ポリモフィズム
- ストラテジ/State
- ファサード
- ビルダー
- オープンクラス
- Proc/block
- 遅延評価/eacy cache