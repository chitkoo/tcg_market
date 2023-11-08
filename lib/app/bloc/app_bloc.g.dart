// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AppState',
      json,
      ($checkedConvert) {
        final val = AppState(
          index: $checkedConvert('index', (v) => v as int? ?? 0),
        );
        return val;
      },
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'index': instance.index,
    };
