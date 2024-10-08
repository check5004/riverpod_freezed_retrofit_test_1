import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_freezed_retrofit_test_1/core/constants/config.dart';
import 'package:riverpod_freezed_retrofit_test_1/data/models/customer_send_model.dart';
import '../models/customer_model.dart';

part 'customer_repository.g.dart';

/// 顧客情報に関するAPIリクエストを行うリポジトリクラス
///
/// このクラスは顧客情報の取得、作成、更新などのAPI操作を提供します。
@RestApi(baseUrl: Config.baseUrl)
abstract class CustomerRepository {
  /// CustomerRepositoryのファクトリコンストラクタ
  ///
  /// [dio]: HTTP通信を行うためのDioインスタンス
  /// [baseUrl]: APIのベースURL（オプション）
  factory CustomerRepository(Dio dio, {String baseUrl}) = _CustomerRepository;

  /// 顧客一覧を取得するメソッド
  ///
  /// [skip]: スキップする件数
  /// [limit]: 取得する最大件数
  /// [name]: 名前での絞り込み
  /// [phoneNumber]: 電話番号での絞り込み
  /// [birthDate]: 生年月日での絞り込み
  @GET("/customers/")
  Future<CustomerModel> getCustomers({
    @Query("skip") int? skip,
    @Query("limit") int? limit,
    @Query("name") String? name,
    @Query("phone_number") String? phoneNumber,
    @Query("birth_date") String? birthDate,
  });

  /// 指定されたIDの顧客情報を取得するメソッド
  ///
  /// [customerId]: 取得する顧客のID
  @GET("/customers/{customer_id}")
  Future<CustomerModel> getCustomerById({
    @Path("customer_id") required int customerId,
  });

  /// 顧客情報を作成または更新するメソッド
  ///
  /// [contentType]: リクエストのContent-Type
  /// [customerSendModel]: 送信する顧客情報
  @POST("/customers/")
  Future<CustomerSendModel> createOrUpdateCustomer({
    @Header("Content-Type") String contentType = "application/json",
    @Body() required CustomerSendModel customerSendModel,
  });
}
