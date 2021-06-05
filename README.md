# 📖BOOK SHARE📖（作成途中）

# アプリの概要
読書シェアアプリ「BOOK　SHARE」
<br>
 読んだ本の内容をアウトプットできるアプリです。
<br>
```
- どんな本なのか（一言で要約）
- その本から得られたことは何なのか
- 読んで面白かったのか
```
を記録することが出来ます。

【URL】
<br>
https://bookshareing.herokuapp.com/books/new


## サンプルログイン
```
メールアドレス：sample@gmail.com
パスワード：password
```


# 制作背景
本を読んでも１週間後には内容を忘れてしまうことに問題意識を感じていました。
<br>
「どんな本」を読み、そこから「何を学んだか」をアウトプットしてこそ、読書の意味があると感じたので、
<br>
これを機に作ることにしました。

# 工夫したところ
- GoogleBooksAPIを入れて本登録を簡単にしたこと<br>
→本の画像をクリックすると、自動的にフォームに「本のタイトル」と「著者」が代入される


# 使用技術
## ❏ フロントエンド
- HTML/CSS
- Javascript
## ❏ バックエンド
- Ruby 2.7.2
- Ruby on Rails 6.1.3

# これから実装すること
- GoogleBooksAPIを導入する　✅ 実装済み
- マイページ機能をつける　✅ 実装済み
- フロントエンド部分をVue.js / Nuxt.jsで整える
- Rspecでテストを書く


# デモ（現時点）
[![Image from Gyazo](https://i.gyazo.com/011e3328e20a830ddab730b895e2de37.gif)](https://gyazo.com/011e3328e20a830ddab730b895e2de37)

