import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBase<T> extends Cubit<T> {
  CubitBase(super.state);

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
