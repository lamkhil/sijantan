class ResponseApi<T> {
  bool success;
  String? message;
  T? data;

  ResponseApi({required this.success, this.message, this.data});
}
