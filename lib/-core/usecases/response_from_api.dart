class ResponseFromApi {
  Map<String, dynamic> json;
  int code;
  ResponseFromApi({required this.json, required this.code});

  Map<String, dynamic> toJson() {
    return {"json": json, "code": code};
  }
}
