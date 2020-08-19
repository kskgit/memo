## book_memoについて
本の栞代わりになるミニWebサービスです。

https://hatehate-nazenaze.hatenablog.com/entry/2020/08/19/123406?_ga=2.135628147.390248624.1597808049-246252316.1578668264

## 開発環境構築
### コンテナをビルドする
```
docker-compose build
```
### データベースを作成する
```
docker-compose run web rake db:create
```

### テーブルを作成する
```
docker-compose run web rake db:migrate
```

### 開発環境を立ち上げる
```
docker-compose up
```
