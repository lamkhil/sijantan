class MapModel {
  String? type;
  Properties? properties;
  late List<List<List<double>>> coordinate;

  MapModel({this.type, this.properties, this.coordinate = const []});

  MapModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    coordinate = json['geometry']['coordinates'] != null
        ? (json['geometry']['coordinates'] as List)
            .map((e) => (e as List)
                .map((e) => (e as List).map((e) => e as double).toList())
                .toList())
            .toList()
        : [];
  }

  List<List<double>> get singleListCoordinate {
    List<List<double>> data = [];
    for (var element in coordinate) {
      for (var element2 in element) {
        data.add(element2);
      }
    }
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }

    data['coordinate'] = coordinate;
    return data;
  }
}

class Properties {
  String? noRuas;
  String? nmRuas;

  Properties({this.noRuas, this.nmRuas});

  Properties.fromJson(Map<String, dynamic> json) {
    noRuas = double.parse(json['no_ruas'].toString()).toInt().toString();
    nmRuas = json['nm_ruas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_ruas'] = noRuas;
    data['nm_ruas'] = nmRuas;
    return data;
  }
}
