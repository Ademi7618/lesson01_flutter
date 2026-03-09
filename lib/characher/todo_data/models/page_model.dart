import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PageModel {
  final int? next;
  final int? prev;
  const PageModel(this.next, this.prev);

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageModelToJson(this);
}

class   PageModelConverter implements JsonConverter<PageModel, Map<String, dynamic>> {
  const PageModelConverter();

  @override
  PageModel fromJson(Map<String, dynamic> json) => PageModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(PageModel object) => object.toJson();
}
PageModel _$PageModelFromJson(Map<String, dynamic> json) =>
    PageModel((json['next'] as num?)?.toInt(), (json['prev'] as num?)?.toInt());

Map<String, dynamic> _$PageModelToJson(PageModel instance) => <String, dynamic>{
  'next': instance.next,
  'prev': instance.prev,
};