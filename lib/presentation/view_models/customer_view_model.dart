import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed_retrofit_test_1/di/providers.dart';
import '../../data/models/customer_model.dart';

/// 顧客ビューモデルのプロバイダー
///
/// このプロバイダーは、CustomerViewModelのインスタンスを提供します。
/// Riverpodのプロバイダーシステムを使用して、アプリケーション全体で
/// CustomerViewModelを共有できるようにします。
final customerViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => CustomerViewModel(ref));

/// 顧客ビューモデル
///
/// このクラスは顧客データの管理と操作を担当します。
/// 検索条件の設定、顧客データの取得、状態の更新などの機能を提供します。
class CustomerViewModel extends ChangeNotifier {
  final Ref _ref;
  String? _name;
  String? _phoneNumber;
  String? _birthDate;
  int? _skip;
  int? _limit;

  /// コンストラクタ
  ///
  /// @param _ref Riverpodの参照オブジェクト
  CustomerViewModel(this._ref);

  /// 名前を設定する
  ///
  /// @param name 設定する名前
  void setName(String? name) {
    _name = name;
    notifyListeners(); // リスナーに変更を通知
  }

  /// 電話番号を設定する
  ///
  /// @param phoneNumber 設定する電話番号
  void setPhoneNumber(String? phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners(); // リスナーに変更を通知
  }

  /// 生年月日を設定する
  ///
  /// @param birthDate 設定する生年月日
  void setBirthDate(String? birthDate) {
    _birthDate = birthDate;
    notifyListeners(); // リスナーに変更を通知
  }

  /// スキップ数を設定する
  ///
  /// @param skip 設定するスキップ数
  void setSkip(int? skip) {
    _skip = skip;
    notifyListeners(); // リスナーに変更を通知
  }

  /// 制限数を設定する
  ///
  /// @param limit 設定する制限数
  void setLimit(int? limit) {
    _limit = limit;
    notifyListeners(); // リスナーに変更を通知
  }

  /// 顧客データを取得する
  Future<void> fetchCustomers() async {
    _customers = const AsyncValue.loading();
    notifyListeners(); // リスナーに変更を通知

    try {
      // リポジトリを取得
      final repository = _ref.read(customerRepositoryProvider);
      // リポジトリから顧客データを取得
      final response = await repository.getCustomers(
        name: _name,
        phoneNumber: _phoneNumber,
        birthDate: _birthDate,
        skip: _skip,
        limit: _limit,
      );

      // 取得したデータを設定
      _customers = AsyncValue.data(response.customers ?? []);
    } catch (e) {
      // エラーが発生した場合、エラー状態を設定
      _customers = AsyncValue.error(e, StackTrace.current);
    }
    notifyListeners(); // リスナーに変更を通知
  }

  /// 顧客データの非同期値
  AsyncValue<List<Customer>> _customers = const AsyncValue.loading();

  /// 顧客データの非同期値を取得するゲッター
  AsyncValue<List<Customer>> get customers => _customers;
}
