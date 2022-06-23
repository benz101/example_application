import 'dart:convert';

SendItemResult sendItemResultFromJson(String str) => SendItemResult.fromJson(json.decode(str));

String sendItemResultToJson(SendItemResult data) => json.encode(data.toJson());

class SendItemResult {
    SendItemResult({
        this.message,
    });

    String? message;

    factory SendItemResult.fromJson(Map<String, dynamic> json) => SendItemResult(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
