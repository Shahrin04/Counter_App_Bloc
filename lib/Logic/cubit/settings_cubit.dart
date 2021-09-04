import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit()
      : super(SettingsState(appNotification: false, emailNotification: false));

  void toggleAppNotification(bool newValue) =>
      emit(state.copyWith(appNotification: newValue));

  void toggleMessageNotification(bool newValue) =>
      emit(state.copyWith(emailNotification: newValue));

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(SettingsState state) {
    return state.toMap();
  }
}
