import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/custom_form_fields/cadence_form_field.dart';
import 'package:tri/app/view/forms/custom_form_fields/distance_form_field.dart';
import 'package:tri/app/view/view_picker/abstract_result_widget.dart';
import 'package:tri/app/view/view_picker/abstract_view_tile.dart';

enum FieldOptions implements AbstractViewTile {
  distance,
  cadence;
  
  @override
  Icon? get icon => this == FieldOptions.distance ? const Icon(Icons.add_road) :
    this == FieldOptions.cadence ? const Icon(Icons.repeat) :
    const Icon(Icons.data_array);
  

  @override
  String get title => this == FieldOptions.distance ? 'Distance' :
    this == FieldOptions.cadence ? 'Cadence' :
    'Unimplemented';
  
  @override
  Icon? get trailing => const Icon(Icons.list);

  @override
  Widget onTap(Function(Object val) callback) {
    return this == FieldOptions.distance ? DistanceFormField(onChanged: (value) => callback(value), currentValue: null, validator: null) : 
    this == FieldOptions.cadence ? CadenceFormField(onChanged: (value) => callback(value), currentValue: null, validator: null) : 
    DistanceFormField(onChanged: (value) => callback(value), currentValue: null, validator: null);
  }

}
