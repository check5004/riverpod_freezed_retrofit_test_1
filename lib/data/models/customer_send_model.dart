// freezed_annotationパッケージをインポートします。
// このパッケージは、イミュータブルなデータクラスを生成するために使用されます。
import 'package:freezed_annotation/freezed_annotation.dart';

// freezedとjsonのコード生成のためのパートファイルを指定します。
part 'customer_send_model.freezed.dart';
part 'customer_send_model.g.dart';

/// 顧客情報の送信モデルを表すクラス
///
/// このクラスは、顧客情報をAPIに送信する際に使用されるデータモデルです。
/// freezedアノテーションを使用して、イミュータブルなデータクラスとして定義されています。
@freezed
class CustomerSendModel with _$CustomerSendModel {
  // CustomerSendModelのファクトリコンストラクタ
  factory CustomerSendModel({
    @JsonKey(name: "name") String? name, // 顧客の名前
    @JsonKey(name: "phone_number") String? phoneNumber, // 顧客の電話番号
    @JsonKey(name: "birth_date") DateTime? birthDate, // 顧客の生年月日
    @JsonKey(name: "id") int? id, // 顧客のID
    @JsonKey(name: "delete_flag") bool? deleteFlag, // 削除フラグ
  }) = _CustomerSendModel;

  // JSONからCustomerSendModelオブジェクトを生成するファクトリメソッド
  factory CustomerSendModel.fromJson(Map<String, dynamic> json) => _$CustomerSendModelFromJson(json);
}
