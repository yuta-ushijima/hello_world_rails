# hello_world_rails for docker

## 開発環境の構築

### Dockerを設定
マシンの環境に応じてDockerの実行環境をダウンロード

#### Desktop
- [Install Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)
- [Install Docker Desktop for Windows](https://docs.docker.com/docker-for-windows/install/)

#### Server
- [Server](https://docs.docker.com/install/): 遷移ページのServer項目を参照


- Dockerの実行環境がインストール出来ているか確認するには、以下を実行してみてください。
```bash
$ docker --version
$ docker run hello-workd
```

問題なければ、`docker image ls`でイメージがダウンロードされているか確認できます。

#### 【参考】
- `~/.bashrc` などに下記のようなaliasを追加すると幸せになります

```.bashrc
[ -s "/usr/local/bin/docker-machine" ] && docker-machine ip default > /dev/null 2>&1 && eval "$(docker-machine env default)"
alias do="docker"
alias docm="docker-compose"
alias dom="docker-machine"
alias dom-start="docker-machine start default && eval \"\$(docker-machine env default)\""
alias dom-restart="docker-machine restart default && eval \"\$(docker-machine env default)\""
alias dom-env="eval \"\$(docker-machine env default)\""
```

### 環境変数を設定
- 以下sampleファイル郡をコピーして環境変数用ファイルを作成

```bash
$ cp .config/database.yml.docker.sample database.yml
```

## 初期設定

### 開発用・テスト用DB作成

```bash
cd hello_world_rails
$ sh docker/init_docler.sh
```

## 開発時のコマンド

### 開発用サーバを起動
```bash
docker-compose up
```

### 開発用サーバをブラウザで開く
```bash
open http://0.0.0.0:3000
```

### Gemfileの更新
```bash
docker-compose run --rm app bundle install
```

### Gemfileでrubyのバージョンを変更したとき
```bash
docker-compose build
docker-compose run --rm app /bin/bash
gem pristine --all
```

### 開発環境のコンテナを削除
```bash
docker-compose rm -v
```

- 現在のバージョンを含め、これでデータが全部消えます
- Dockerのバージョン上げた時は一度消すのがオススメです

### オールテスト
```bash
docker-compose run --rm app bundle exec rspec
```

### テスト用データ投入
```bash
docker-compose run --rm app bundle exec rake db:seed
```

### Containerの中に入る
```bash
docker-compose run --rm app /bin/bash
```
