import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';

part 'abstract_segment.g.dart';

@JsonSerializable(explicitToJson: true)
class AbstractSegment extends Serializable {
  void accept(Visitor v) => v.visit(this);
  String getDisplayValue() => '';

  AbstractSegment();

  @override
  Function get fromJsonFunction => _$AbstractSegmentFromJson;
  
  factory AbstractSegment.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<AbstractSegment>(json);

  @override
  Map<String, dynamic> toJson() => _$AbstractSegmentToJson(this);

}