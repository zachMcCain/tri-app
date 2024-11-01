import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/custom_form_fields/cadence_form_field.dart';
import 'package:tri/app/view/forms/custom_form_fields/distance_form_field.dart';
import 'package:tri/app/view/forms/custom_form_fields/duration_form_field.dart';
import 'package:tri/app/view/view_picker/abstract_view_tile.dart';

enum FieldOptions implements AbstractViewTile {
  distance,
  duration,
  cadence;
    // Add calories, pace, power, etc (and maybe just a general purpose 'segment'?)
  
  @override
  Icon? get icon => this == FieldOptions.distance ? const Icon(Icons.add_road) :
    this == FieldOptions.cadence ? const Icon(Icons.repeat) :
    this == FieldOptions.duration ? const Icon(Icons.timer) :
    const Icon(Icons.data_array);
  

  @override
  String get title => this == FieldOptions.distance ? 'Distance' :
    this == FieldOptions.cadence ? 'Cadence' :
    this == FieldOptions.duration ? 'Time' :
    'Unimplemented';
  
  @override
  Icon? get trailing => const Icon(Icons.list);

  // The way this works, the view_picker is fed these FieldOptions, and ontap of the field option
  // it calls this onTap which builds a popup of the formfield with a callback function that simply
  // passes whatever we give it in the formfield out to the encapsulating widgets onChanged that was passed 
  // in to the ViewPicker - so ultimately we are saying give callback our value and viewpicker is handing it out
  // to whatever onchanged was given it.
  @override
  Widget onTap(Function(Object val) callback) {
    return this == FieldOptions.distance ? DistanceFormField(onChanged: (value) => callback(value), currentValue: null, validator: null) : 
    this == FieldOptions.cadence ? CadenceFormField(onChanged: (value) => callback(value), currentValue: null, validator: null) : 
    this == FieldOptions.duration ? DurationFormField(onChanged: (value) => callback(value), currentValue: null, validator: null) : 
    DistanceFormField(onChanged: (value) => callback(value), currentValue: null, validator: null);
  }

}
