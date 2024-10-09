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
  factory CustomerModel({
    @JsonKey(name: "status") String? status, // APIレスポンスのステータス
    @JsonKey(name: "message") String? message, // APIレスポンスのメッセージ
    @JsonKey(name: "count") int? count, // 顧客の総数
    @JsonKey(name: "skip") int? skip, // ページネーションのスキップ数
    @JsonKey(name: "limit") int? limit, // ページネーションの制限数
    @JsonKey(name: "customers") List<Customer>? customers, // 顧客リスト
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
    @JsonKey(name: "id") int? id, // 顧客のID
    @JsonKey(name: "name") String? name, // 顧客の名前
    @JsonKey(name: "phoneNumber") String? phoneNumber, // 顧客の電話番号
    @JsonKey(name: "birthDate") DateTime? birthDate, // 顧客の生年月日
  }) = _Customer;

  // JSONからCustomerオブジェクトを生成するファクトリメソッド
  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}
