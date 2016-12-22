# jekyll-docker

Jekyllを使用できるDockerイメージを作成します。

[![GitHub release](https://img.shields.io/github/release/u6k/jekyll-docker.svg)](https://github.com/u6k/jekyll-docker)
[![license](https://img.shields.io/github/license/u6k/jekyll-docker.svg)](https://github.com/u6k/jekyll-docker/blob/master/LICENSE)
TODO: ImageLayersでDockerHubをバッヂ表示

## Usage

Jekyllサイトを管理するフォルダで、以下のようにjekyll-dockerコンテナを起動します。新規にサイトを作成する場合は、空のフォルダで起動します。

```
$ docker run --rm -it -v $(pwd):/var/myblog -p 4000:4000 u6k/jekyll-docker bash
```

### 新規のJekyllサイトを作成する場合

```
# jekyll new .
```

カレント・フォルダにファイルが生成されます。

### Jekyllサイトをプレビューする場合

```
# bundle update
# jekyll server --host 0.0.0.0
```

[http://localhost:4000](http://localhost:4000)にアクセスすると、プレビューが表示されます。

### JekyllサイトをAmazon S3にアップロードする場合

TODO: S3アップロード

## Author

- Blog
    - [u6k.log()](http://blog.u6k.me/)
- GitHub
    - [u6k/jekyll-docker](https://github.com/u6k/jekyll-docker)
- DockerHub
    - TODO: DockerHubリンク

## License

[![license](https://img.shields.io/github/license/u6k/jekyll-docker.svg)](https://github.com/u6k/jekyll-docker/blob/master/LICENSE)
