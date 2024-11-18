import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';

part 'open_segment.g.dart';

@JsonSerializable(explicitToJson: true)
class OpenSegment extends AbstractSegment {
  Pace? pace;

  OpenSegment();

  @override
  String getDisplayValue() {
    return 'Open';
  }
  
    @override
  Function get fromJsonFunction => _$OpenSegmentFromJson;

  factory OpenSegment.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<OpenSegment>(json);

  @override
  Map<String, dynamic> toJson() => _$OpenSegmentToJson(this);
}