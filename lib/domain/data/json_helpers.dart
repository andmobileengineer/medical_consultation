abstract class JsonHelpers {
  Map<String, dynamic> toJson();
}

Map<String, dynamic>? convertToJson<T extends JsonHelpers>(T? instance) =>
    instance?.toJson();
