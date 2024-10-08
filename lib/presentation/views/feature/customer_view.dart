import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_freezed_retrofit_test_1/core/utils/date_custom_utils.dart';
import 'package:riverpod_freezed_retrofit_test_1/presentation/view_models/customer_view_model.dart';
import 'package:riverpod_freezed_retrofit_test_1/presentation/views/feature/customer_edit_view.dart';

/// 顧客検索画面を表示するウィジェット
///
/// このウィジェットは顧客の検索フォームと検索結果のリストを表示します。
/// Riverpodを使用して状態管理を行っています。
class CustomerView extends ConsumerStatefulWidget {
  const CustomerView({super.key});

  @override
  ConsumerState<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends ConsumerState<CustomerView> {
  @override
  void initState() {
    super.initState();

    // ウィジェットツリーがビルドされた後にfetchCustomersを呼び出す
    Future.microtask(() {
      ref.read(customerViewModelProvider.notifier).fetchCustomers();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModelのインスタンスを取得
    final viewModel = ref.watch(customerViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        // アプリバーのタイトルを設定
        title: const Text('Customer Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                // 名前入力フィールド
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (value) => viewModel.setName(value),
                  ),
                ),
                // 電話番号入力フィールド
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    onChanged: (value) => viewModel.setPhoneNumber(value),
                  ),
                ),
                // 生年月日入力フィールド
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Birth Date'),
                    onChanged: (value) => viewModel.setBirthDate(value),
                  ),
                ),
                // スキップ数入力フィールド
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Skip'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => viewModel.setSkip(int.tryParse(value)),
                  ),
                ),
                // 制限数入力フィールド
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Limit'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => viewModel.setLimit(int.tryParse(value)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 検索ボタン
            FilledButton.icon(
              onPressed: () => viewModel.fetchCustomers(),
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),
            // 検索結果表示エリア
            Expanded(
              child: viewModel.customers.when(
                // データが取得できた場合のウィジェット
                data: (customers) => ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    final customer = customers[index];
                    return ListTile(
                      title: Text(customer.name ?? 'No Name'),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(customer.phoneNumber ?? 'No Phone Number'),
                          Text(customer.birthDate != null
                              ? '${DateCustomUtils.calculateAge(customer.birthDate!)}歳'
                              : '年齢不明'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerEditView(customerId: customer.id!),
                          ),
                        );
                      },
                    );
                  },
                ),
                // データ取得中の場合のウィジェット
                loading: () => const Center(child: CircularProgressIndicator()),
                // エラーが発生した場合のウィジェット
                error: (error, stack) => Text('Error: $error'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
