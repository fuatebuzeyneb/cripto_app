import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cripto_app/models/home_model.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<HomeModel> homeModelList = [];

  getHomeData() async {
    try {
      emit(HomeLoading());
      await FirebaseFirestore.instance.collection('homeData').get().then(
            (value) => value.docs.forEach(
              (element) {
                homeModelList.add(
                  HomeModel.fromJson(
                    element.data(),
                  ),
                );
              },
            ),
          );
      emit(HomeSuccess());
    } on Exception catch (e) {
      emit(HomeFailure(massError: e.toString()));
    }
  }
}
