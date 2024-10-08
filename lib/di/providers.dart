import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../data/repositories/customer_repository.dart';

/// 顧客リポジトリのプロバイダー
///
/// このプロバイダーは、アプリケーション全体で使用される顧客リポジトリのインスタンスを提供します。
/// Riverpodを使用して依存性注入を実現しています。
final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  // Dioインスタンスを作成
  // Dioは、HTTPリクエストを行うためのパッケージです
  final dio = Dio();

  // CustomerRepositoryのインスタンスを作成し、返却
  // 作成したDioインスタンスを引数として渡します
  return CustomerRepository(dio);
});
