import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed_retrofit_test_1/data/models/customer_model.dart';
import 'package:riverpod_freezed_retrofit_test_1/data/models/customer_send_model.dart';
import 'package:riverpod_freezed_retrofit_test_1/di/providers.dart';

/// 顧客編集画面のViewModel用プロバイダー
final customerEditViewModelProvider =
    StateNotifierProvider.autoDispose.family<CustomerEditViewModel, AsyncValue<Customer>, int>((ref, customerId) {
  return CustomerEditViewModel(ref, customerId);
});

/// 顧客編集画面の送信データ用プロバイダー
final customerEditViewSendDataProvider =
    StateNotifierProvider<CustomerEditViewModelSendData, AsyncValue<CustomerSendModel>>((ref) {
  return CustomerEditViewModelSendData();
});

/// 顧客編集画面のViewModel
class CustomerEditViewModel extends StateNotifier<AsyncValue<Customer>> {
  final Ref _ref;
  final int _customerId;

  CustomerEditViewModel(this._ref, this._customerId) : super(const AsyncValue.loading()) {
    _fetchCustomer();
  }

  /// 顧客情報を取得する
  Future<void> _fetchCustomer() async {
    try {
      // ローディング状態にする
      state = const AsyncValue.loading();
      // リポジトリから顧客情報を取得
      final customerModel = await _ref.read(customerRepositoryProvider).getCustomerById(customerId: _customerId);
      // 送信データを初期化
      _ref.read(customerEditViewSendDataProvider.notifier).setDataFromCustomer(customerModel.customers!.first);
      // 取得した顧客情報をstateにセット
      state = AsyncValue.data(customerModel.customers!.first);
    } catch (e) {
      // エラー時の処理
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// 顧客情報を更新する
  Future<bool> updateCustomer() async {
    final customer = state.value;
    if (customer != null) {
      try {
        // 送信データを取得
        final customerSendModel = _ref.read(customerEditViewSendDataProvider.notifier).state.value;
        // リポジトリを通じて顧客情報を更新
        await _ref.read(customerRepositoryProvider).createOrUpdateCustomer(customerSendModel: customerSendModel!);
        return true;
      } catch (e) {
        // エラー時の処理
        state = AsyncValue.error(e, StackTrace.current);
      }
    }
    return false;
  }

  /// 更新ボタン押下時の処理
  Future<void> handleUpdateButtonPress(BuildContext context, CustomerSendModel firstViewModel) async {
    // 現在の送信データを取得
    final currentSendModel = _ref.read(customerEditViewSendDataProvider.notifier).state.value;
    // 変更がない場合はメッセージを表示して処理を終了
    if (firstViewModel == currentSendModel) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('変更がありません。')));
      return;
    }
    // 顧客情報を更新
    final result = await updateCustomer();
    if (result) {
      if (!mounted) return;
      // 更新成功時のメッセージを表示
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('更新成功')));
      Navigator.pop(context);
    } else {
      if (!mounted) return;
      // 更新失敗時のメッセージを表示
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('更新失敗')));
      // ViewModelを再初期化
      _ref.invalidate(customerEditViewModelProvider(_customerId));
    }
  }
}

/// 顧客編集画面の送信データ管理クラス
class CustomerEditViewModelSendData extends StateNotifier<AsyncValue<CustomerSendModel>> {
  CustomerEditViewModelSendData() : super(const AsyncValue.loading());

  /// 名前を設定
  void setName(String? name) {
    state = state.whenData((customer) => customer.copyWith(name: name));
  }

  /// 電話番号を設定
  void setPhoneNumber(String? phoneNumber) {
    state = state.whenData((customer) => customer.copyWith(phoneNumber: phoneNumber));
  }

  /// 生年月日を設定
  void setBirthDate(String? birthDate) {
    state = state.whenData((customer) => customer.copyWith(birthDate: DateTime.tryParse(birthDate ?? '')));
  }

  /// 顧客情報から送信データを初期化
  void setDataFromCustomer(Customer? customer) {
    state = AsyncValue.data(CustomerSendModel(
      id: customer!.id,
      name: customer.name,
      phoneNumber: customer.phoneNumber,
      birthDate: customer.birthDate,
      deleteFlag: false,
    ));
  }
}
