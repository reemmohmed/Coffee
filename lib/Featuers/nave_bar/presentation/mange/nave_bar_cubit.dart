import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nave_bar_cubit_state.dart';

class NaveBarCubit extends Cubit<int> {
  NaveBarCubit() : super(0);

  void changcurrentPage(int index) {
    emit(index);
  }
}
