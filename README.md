# ドキュメント

## 進め方

### ログイン方法

`ssh ishocon@${もらったIPアドレス}` or `ssh {自分の GitHub ログイン名}@${もらったIPアドレス}` でログイン可能

(`ssh ishocon@192.0.2.1` みたいな)

### サーバー立ち上げ方

https://github.com/showwin/ISHOCON1/blob/master/doc/manual.md#web-%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC%E3%82%92%E7%AB%8B%E3%81%A1%E4%B8%8A%E3%81%92%E3%82%8B

立ち上げたあと、webブラウザに、もらったIPアドレスを打ち込むと、お題のサイトが見れる

### ベンチマークの回し方

```basj
sh benchmark_wrap.sh
```

(中身を見てもらえればわかるが、人の点数を下げたり、任意の点数を送信できる。悪用しないでね)

`benchmark_wrap.sh` は使いやすいように好きに改変して良い
ちなみに↓こんな感じです

```bash
./benchmark 2>&1 | grep "Score:" | sed -e 's/.*Score: \(\d*\)/\1/g' | xargs -I{} curl -X POST -d "{\"score\":{}, \"timestamp\":{ \".sv\":\"timestamp\" } }" "https://kstmisucon2021gw-default-rtdb.firebaseio.com/teams/${username}.json
```

## リンク集

### スコアボード

https://kstmisucon2021gw-scoreboard.s3-ap-northeast-1.amazonaws.com/index.html

### マニュアル

https://github.com/showwin/ISHOCON1/blob/master/doc/manual.md

## 注意事項

ISHOCON1っていう @showwin さん作成の問題を使っています。
ISHOCONってワードでググると、こうやったなどの記事が出てきてしまうので、ググるときには検索ワードに `-ISHOCON` , `-ISHOCON1` を入れることをお勧めします。
(強制ではありません、考えて考えて、本当に何も思いつかなかったら記事を見る、とかがお勧めです。)
また、終わったら、 @showwin さんには感謝しましょう。
(ちなみに @showwin さん、めっちゃいい人ですよ)

質問などがあれば、discordに書いてください
質問は簡単なものでも歓迎です、あなたのわからないことはみんなのわからないことです。
この形の運営をするのは初めてで、不慣れなので、多分不備もいっぱいあると思うので、少しでも疑問に思ったらすぐに聞いてください。


## クレジット(敬称略)

TODO: あとで参加者とか入れる

### 主催者

@Goryudyuma

### 運営

@Goryudyuma, @bgpat

### 作問

@showwin

### スポンサー

@Goryudyuma
