// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenSegment _$OpenSegmentFromJson(Map<String, dynamic> json) => OpenSegment()
  ..$type = json['__type'] as String?
  ..pace = json['pace'] == null
      ? null
      : Pace.fromJson(json['pace'] as Map<String, dynamic>);

Map<String, dynamic> _$OpenSegmentToJson(OpenSegment instance) =>
    <String, dynamic>{
      '__type': instance.$type,
      'pace': instance.pace?.toJson(),
    };
