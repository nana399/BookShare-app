# 📖BOOK SHARE📖（作成途中）

# アプリの概要
読書した本について感想を残すことができ、SHAREすることが出来る
<br>
```
- どんな本なのか（一言で要約）
- その本から得られたことは何なのか
```
を記録する

# なぜこのアプリを作成しようとしたのか
読んでも１週間後には内容を忘れてしまうことに問題意識を
感じていた。


# 使用技術
## フロントエンド
- HTML/CSS
- Javascript
## バックエンド
- Ruby 2.7.2
- Ruby on Rails 6.0.3 

# これから改善してく点
- GoogleBooksAPIを導入する
- フロントエンド：Vue.js / Nuxt.jsで整える
- Rspecでテストを書く


# 作業の流れ
githubでissue管理を行い開発をしていく

```
1. Rails new + 環境構築(主にgem関係)
2. ルーティングの設定
3. booksモデルの作成
4. booksに共通のnavバーを作成
5. booksのindexビューを作成する
6. booksのshowビューを作成する
7. booksのeditビューを作成する
8. booksのnewビューを作成する
9. パーシャル化する（show・edit・new）
10. booksのコントローラに処理を記述する + 各ビューをform_withでつなげる
11. RSpecにテストを書く（create, update, destroyが機能するか）
12. Usersモデルの追加
13. bcryptを使用する（パスワードのダイジェスト）
14. Admin/billsのindexビューを作成する
15. Adminに共通のnavバーを作る
16. Admin/billsのshowビューを作成する
17. Admin/billsのeditビューを作成する
18. Admin/billsのnewビューを作成する
19. パーシャル化する（show・edit・new）
20. Adminのコントローラに処理を記述する + 各ビューをform_withでつなげる
21. RSpecにテストを書く（create, update, destroy, change が機能するか）
22. RSpecにテストを書く（Billsのビューにて、Admin が create, update, changeしたものが反映されるか）
23. ログインのビューを作る
24. ログイン・ログアウトの機能を作る
25. RSpecにテストを書く（ログイン・ログアウト機能）
```

<br>

### ❏ 参考
[未経験がWeb系転職成功したいならgithubでissue管理して開発しよう - Qiita](https://qiita.com/fukubaka0825/items/c7710b4e87d478c8ba3b)
# デモ（現時点）
[![Image from Gyazo](https://i.gyazo.com/a8f797de59cd0c80b775d0bc20836963.gif)](https://gyazo.com/a8f797de59cd0c80b775d0bc20836963)

