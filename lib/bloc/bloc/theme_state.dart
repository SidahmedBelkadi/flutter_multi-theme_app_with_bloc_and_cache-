part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class LoadedThemeState extends ThemeState {
  final ThemeData themeData;

  const LoadedThemeState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
