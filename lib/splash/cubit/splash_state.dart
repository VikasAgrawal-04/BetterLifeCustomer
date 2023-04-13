part of 'splash_cubit.dart';

/// {@template splash}
/// SplashState description
/// {@endtemplate}
class SplashState extends Equatable {
  /// {@macro splash}
  const SplashState({
    this.customProperty = 'Default Value',
    this.isLoggedIn = false,
  });

  /// A description for customProperty
  final String customProperty;
  final bool isLoggedIn;

  @override
  List<Object> get props => [customProperty, isLoggedIn];

  /// Creates a copy of the current SplashState with property changes
  SplashState copyWith({
    String? customProperty,
    bool? isLoggedIn,
  }) {
    return SplashState(
      customProperty: customProperty ?? this.customProperty,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

/// {@template splash_initial}
/// The initial state of SplashState
/// {@endtemplate}
class SplashInitial extends SplashState {
  /// {@macro splash_initial}
  const SplashInitial() : super();
}
