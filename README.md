# riverpod_freezed_retrofit_test_1

このプロジェクトは、クリーンアーキテクチャとMVVMパターンを用いた構築実験を目的としたFlutterアプリケーションです。<br>
Riverpod、Freezed、Retrofitプラグインを使用して、最小限の構成で実装されています。

## 概要

- **クリーンアーキテクチャ**: アプリケーションの構造を整理し、保守性を高めるための設計手法です。
- **MVVM (Model-View-ViewModel)**: UIとビジネスロジックを分離するためのデザインパターンです。
- **Riverpod**: Flutterの状態管理ライブラリで、依存性注入をサポートします。
- **Freezed**: イミュータブルなデータクラスを生成するためのコード生成ライブラリです。
- **Retrofit**: HTTPクライアントで、API通信を簡素化します。

## 使用APIサーバー

このプロジェクトで使用しているAPIサーバーは、以下のリポジトリにあります。

- [APIリポジトリ](https://github.com/check5004/api)

このAPIリポジトリはDockerを使用して、コマンド一つで簡単に構築することができます。
