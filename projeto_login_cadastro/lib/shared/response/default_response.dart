class DefaultResponseModel {
  final bool isSucceed;
  final List data;
  final List messages;

  DefaultResponseModel({
    required this.isSucceed,
    required this.data,
    required this.messages,
  });
}