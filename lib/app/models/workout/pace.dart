import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/units/distance_unit.dart';

part 'pace.g.dart';

@JsonSerializable(explicitToJson: true)
class Pace extends Serializable {
  double distance = 1.0;
  Duration time = const Duration();
  DistanceUnit unit = DistanceUnit.mi;

  Pace();
  
  @override
  Function get fromJsonFunction => _$PaceFromJson;

  factory Pace.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Pace>(json);

  @override
  Map<String, dynamic> toJson() => _$PaceToJson(this);

  // Map<String, dynamic> toJson() {
  //   return {
  //       'distance': distance,
  //       'duration': time.inMilliseconds,
  //       'units': unit.name
  //     };
  // }
}