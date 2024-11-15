extension MapExtention on Map {
  Map addAllIf(bool condition, Map<String, dynamic> json) {
    if (!condition) return this;
    Map data = this;
    data.addAll(json);
    return data;
  }
}
