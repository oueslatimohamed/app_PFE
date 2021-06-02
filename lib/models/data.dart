class Data {
  final List<dynamic> datas;
  Data({this.datas});
  factory Data.fromJson(Map<String, dynamic> jsonData) {
    return Data(
      datas: jsonData['data'],
    );
  }
}