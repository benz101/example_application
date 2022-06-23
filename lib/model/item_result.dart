import 'dart:convert';

List<ItemResult> itemResultFromJson(String str) => List<ItemResult>.from(json.decode(str).map((x) => ItemResult.fromJson(x)));

String itemResultToJson(List<ItemResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemResult {
    ItemResult({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory ItemResult.fromJson(Map<String, dynamic> json) => ItemResult(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
