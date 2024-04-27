part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class GetCurrentThemeEvent extends ThemeEvent {}

final class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;

  const ThemeChangedEvent({required this.theme});

  @override
  List<Object> get props => [theme];
}
