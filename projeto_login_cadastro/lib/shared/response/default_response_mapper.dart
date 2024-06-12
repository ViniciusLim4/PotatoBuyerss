import 'package:projeto_login_cadastro/shared/response/default_response.dart';

class DefaultResponseMapper {
  static DefaultResponseModel fromJson(Map json) {
    var data = json['data'];
    if (data is! List) {
      data = [data];
    }
    return DefaultResponseModel(
      isSucceed: json['isSucceed'],
      data: data,
      messages: json['messages'] ?? json['data']?['mensagens'] ?? [],
    );
  }
}
