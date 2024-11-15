import 'dart:convert';

class Pagination {
  int? currentPage;
  dynamic from;
  int? lastPage;
  String? path;
  int? perPage;
  dynamic to;
  int? total;

  Pagination({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Pagination copyWith({
    int? currentPage,
    String? firstPageUrl,
    dynamic from,
    int? lastPage,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    dynamic to,
    int? total,
  }) =>
      Pagination(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };

  bool get isLastPage => currentPage == lastPage;
}
