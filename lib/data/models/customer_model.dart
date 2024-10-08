// freezed_annotationパッケージをインポートします。
// このパッケージは、イミュータブルなデータクラスを生成するために使用されます。
import 'package:freezed_annotation/freezed_annotation.dart';

// freezedとjsonのコード生成のためのパートファイルを指定します。
part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

/// 顧客モデルを表すクラス
///
/// このクラスは、APIからの顧客データのレスポンスを表現します。
/// freezedアノテーションを使用して、イミュータブルなデータクラスとして定義されています。
@freezed
class CustomerModel with _$CustomerModel {
  // CustomerModelのファクトリコンストラクタ
  const factory CustomerModel({
    // APIレスポンスのステータス
    @JsonKey(name: "status") String? status,
    // APIレスポンスのメッセージ
    @JsonKey(name: "message") String? message,
    // 顧客の総数
    @JsonKey(name: "count") int? count,
    // ページネーションのスキップ数
    @JsonKey(name: "skip") int? skip,
    // ページネーションの制限数
    @JsonKey(name: "limit") int? limit,
    // 顧客リスト
    @JsonKey(name: "customers") List<Customer>? customers,
  }) = _CustomerModel;

  // JSONからCustomerModelオブジェクトを生成するファクトリメソッド
  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
}

/// 個々の顧客を表すクラス
///
/// このクラスは、個々の顧客の詳細情報を表現します。
/// freezedアノテーションを使用して、イミュータブルなデータクラスとして定義されています。
@freezed
class Customer with _$Customer {
  // Customerのファクトリコンストラクタ
  const factory Customer({
    // 顧客のID
    @JsonKey(name: "id") int? id,
    // 顧客の名前
    @JsonKey(name: "name") String? name,
    // 顧客の電話番号
    @JsonKey(name: "phoneNumber") String? phoneNumber,
    // 顧客の生年月日
    @JsonKey(name: "birthDate") DateTime? birthDate,
  }) = _Customer;

  // JSONからCustomerオブジェクトを生成するファクトリメソッド
  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}
