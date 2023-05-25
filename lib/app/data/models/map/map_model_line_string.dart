class MapModelLineString {
  String? type;
  late List<List<double>> coordinate;

  MapModelLineString({this.type, this.coordinate = const []});

  MapModelLineString.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinate = json['geometry']['coordinates'] != null
        ? (json['geometry']['coordinates'] as List)
            .map((e) =>
                (e as List).map((e) => double.parse(e.toString())).toList())
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinate'] = coordinate;
    return data;
  }
}
