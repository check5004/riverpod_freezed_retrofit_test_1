import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed_retrofit_test_1/data/models/customer_send_model.dart';
import 'package:riverpod_freezed_retrofit_test_1/presentation/view_models/customer_edit_view_model.dart';

/// 顧客編集画面のウィジェット
///
/// 指定された顧客IDに基づいて顧客情報を表示し、編集を可能にする
class CustomerEditView extends ConsumerStatefulWidget {
  final int customerId;

  const CustomerEditView({super.key, required this.customerId});

  @override
  CustomerEditViewState createState() => CustomerEditViewState();
}

/// CustomerEditViewの状態を管理するクラス
class CustomerEditViewState extends ConsumerState<CustomerEditView> {
  // 各フィールドのテキスト編集コントローラー
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _birthDateController;

  // 初期の顧客データを保持する変数
  late CustomerSendModel _firstViewModel;

  @override
  void initState() {
    super.initState();
    // テキスト編集コントローラーの初期化
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    // テキスト編集コントローラーの破棄
    _nameController.dispose();
    _phoneNumberController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModelの取得
    final viewModel = ref.watch(customerEditViewModelProvider(widget.customerId).notifier);

    // 顧客データが更新されたらテキストフィールドを更新
    viewModel.state.whenData((customer) {
      _nameController.text = customer.name ?? '';
      _phoneNumberController.text = customer.phoneNumber ?? '';
      _birthDateController.text = customer.birthDate?.toIso8601String() ?? '';
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Customer'),
      ),
      body: SingleChildScrollView(
        child: ref.watch(customerEditViewModelProvider(widget.customerId)).when(
              data: (customer) {
                // 初期の顧客データを設定
                _firstViewModel = CustomerSendModel(
                  id: customer.id,
                  name: customer.name,
                  phoneNumber: customer.phoneNumber,
                  birthDate: customer.birthDate,
                  deleteFlag: false,
                );
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // 名前入力フィールド
                      Consumer(builder: (context, ref, child) {
                        return TextField(
                          decoration: const InputDecoration(labelText: 'Name'),
                          controller: _nameController,
                          onChanged: (value) {
                            // 名前が変更されたらViewModelを更新
                            ref.read(customerEditViewSendDataProvider.notifier).setName(value);
                          },
                        );
                      }),
                      // 電話番号入力フィールド
                      Consumer(
                        builder: (context, ref, child) {
                          return TextField(
                            decoration: const InputDecoration(labelText: 'Phone Number'),
                            controller: _phoneNumberController,
                            onChanged: (value) {
                              // 電話番号が変更されたらViewModelを更新
                              ref.read(customerEditViewSendDataProvider.notifier).setPhoneNumber(value);
                            },
                          );
                        },
                      ),
                      // 生年月日入力フィールド
                      Consumer(
                        builder: (context, ref, child) {
                          return TextField(
                            decoration: const InputDecoration(labelText: 'Birth Date'),
                            controller: _birthDateController,
                            onChanged: (value) {
                              // 生年月日が変更されたらViewModelを更新
                              ref.read(customerEditViewSendDataProvider.notifier).setBirthDate(value);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      // 更新ボタン
                      ElevatedButton(
                        onPressed: () => viewModel.handleUpdateButtonPress(context, _firstViewModel),
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                );
              },
              // データ読み込み中の表示
              loading: () => const Center(child: CircularProgressIndicator()),
              // エラー時の表示
              error: (error, stack) => Text('Error: $error'),
            ),
      ),
    );
  }
}
