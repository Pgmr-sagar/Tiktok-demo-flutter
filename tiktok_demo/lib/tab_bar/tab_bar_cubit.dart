import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarCubit extends Cubit<int> {
  TabBarCubit(super.initialState);

  void onItemTapped(int index) {
    emit(index);
  }
}
