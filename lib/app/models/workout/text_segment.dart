import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';

part 'text_segment.g.dart';

@JsonSerializable(explicitToJson: true)
class TextSegment extends AbstractSegment {
  String description = '';

  TextSegment();

  @override
  String getDisplayValue() {
    return description;
  }

  @override
  Function get fromJsonFunction => _$TextSegmentFromJson;

  factory TextSegment.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<TextSegment>(json);

  @override
  Map<String, dynamic> toJson() => _$TextSegmentToJson(this);

}