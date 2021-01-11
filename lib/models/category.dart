import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category implements Comparable {
  final String name;

  Category(this.name);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  int compareTo(other) {
    return this
        .name
        .toLowerCase()
        .compareTo(other.name.toString().toLowerCase());
  }

  @override
  bool operator ==(other) {
    return this.compareTo(other) == 0;
  }

  @override
  int get hashCode {
    return this.name.hashCode;
  }
}
