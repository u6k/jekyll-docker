# jekyll-docker

Jekyllを使用できるDockerイメージを作成します。

[![GitHub release](https://img.shields.io/github/release/u6k/jekyll-docker.svg)](https://github.com/u6k/jekyll-docker) [![license](https://img.shields.io/github/license/u6k/jekyll-docker.svg)](https://github.com/u6k/jekyll-docker/blob/master/LICENSE) [![Docker Automated build](https://img.shields.io/docker/automated/u6kapps/jekyll-docker.svg)](https://hub.docker.com/r/u6kapps/jekyll-docker/) [![u6k.blog()](https://img.shields.io/badge/u6k-.blog-orange.svg)](http://blog.u6k.me/)

## Requirement

- Docker

```
$ docker version
Client:
 Version:      1.12.0
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   8eab29e
 Built:        Thu Jul 28 23:54:00 2016
 OS/Arch:      windows/amd64

Server:
 Version:      1.12.3
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   6b644ec
 Built:        Wed Oct 26 23:26:11 2016
 OS/Arch:      linux/amd64
```

- Amazon Web ServicesのIAMユーザー、およびアクセスキー
    - Amazon S3にWebサイトをアップロードする場合

## Usage

Jekyllサイトを管理するフォルダで、以下のようにjekyll-dockerコンテナを起動します。新規にサイトを作成する場合は、空のフォルダで起動します。

```
$ docker run --rm -it -v $(pwd):/var/myblog -p 4000:4000 u6kapps/jekyll-docker bash
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

`s3_website.yml`を作成して、設定を行います。

```
# s3_website cfg create
```

`s3_website.yml`の、以下の項目を設定します。

```
s3_id: <%= ENV['AWS_ACCESS_KEY'] %>
s3_secret: <%= ENV['AWS_SECRET_KEY'] %>
s3_bucket: [バケット名]
s3_endpoint: ap-northeast-1
```

> _NOTE:_ `s3_id`と`s3_secret`は機密情報なので、`s3_website.yml`に直接書くのではなく、環境変数から読み取るようにしています。なので、この`s3_website.yml`はgitリポジトリに格納してしまっても良いです。

Bucketが未作成の場合、Bucketを作成します。

```
# s3_website cfg apply
```

Webサイトをビルドして、Amazon S3にアップロードします。

```
# bundle update
# jekyll build
# s3_website push

(中略)

[info] Successfully pushed the website to http://blog.u6k.me.s3-website-ap-northeast-1.amazonaws.com
```

最後に表示されたURLにアクセスすると、アップロードしたWebサイトが表示されます。

## Author

- Blog
    - [u6k.log()](http://blog.u6k.me/)
- GitHub
    - [u6k/jekyll-docker](https://github.com/u6k/jekyll-docker)
- DockerHub
    - [u6kapps/jekyll-docker](https://hub.docker.com/r/u6kapps/jekyll-docker/)

## License

[MIT License](https://github.com/u6k/jekyll-docker/blob/master/LICENSE)
