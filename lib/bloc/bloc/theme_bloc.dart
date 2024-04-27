import 'package:bloc/bloc.dart';
import 'package:bloc_app_theme/core/theme/app_theme.dart';
import 'package:bloc_app_theme/core/theme/theme_cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<GetCurrentThemeEvent>((event, emit) async {
      final int themeIndex = await ThemeCacheHelper.getCachedThemeIndex();

      final theme = AppTheme.values.firstWhere((appTheme) => appTheme.index == themeIndex);

      emit(LoadedThemeState(themeData: appThemeData[theme]!));
    });

    on<ThemeChangedEvent>((event, emit) async {
      final int themeIndex = event.theme.index;
      await ThemeCacheHelper.cacheThemeIndex(themeIndex);
      emit(LoadedThemeState(themeData: appThemeData[event.theme]!));
    });
  }
}
