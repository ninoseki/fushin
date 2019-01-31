# Fushin

[![Build Status](https://travis-ci.org/ninoseki/fushin.svg?branch=master)](https://travis-ci.org/ninoseki/fushin)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/fushin/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/fushin?branch=master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/91a8eb8d1fcf428294661e9d12b03283)](https://www.codacy.com/app/ninoseki/fushin)

A malicious blog posts monitoring tool.

## Features & ToDo

- [x] Subscribe [a malicious blog posts feed](https://www.inoreader.com/stream/user/1006141524/tag/%E4%B8%8D%E5%AF%A9%E3%83%A1%E3%83%BC%E3%83%AB) (by [@catnap707](https://twitter.com/catnap707))
- [x] Extract IoCs(BTC, URL) from a blog post
- [x] Post extracted IoCs to Slack (or STDOUT) with enrichment
- [ ] Attachment handling

## Supported blog types

- jugem.jp
- kikey.net
- seesaa.net
- shinobi.jp
- teacup.com

## Install

```shell
gem install fushin
```

## Usage

```shell
fushin
```
