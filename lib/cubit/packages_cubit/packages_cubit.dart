import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cripto_app/models/packages_model.dart';
import 'package:meta/meta.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit() : super(PackagesInitial());

  List<PackagesModel> packagesModelList = [];

  getPackagesData() async {
    try {
      emit(PackagesLoading());
      await FirebaseFirestore.instance.collection('packages').get().then(
            (value) => value.docs.forEach(
              (element) {
                packagesModelList.add(
                  PackagesModel.fromJson(
                    element.data(),
                  ),
                );
              },
            ),
          );
      emit(PackagesSuccess());
    } on Exception catch (e) {
      emit(PackagesFailure(massError: e.toString()));
    }
  }
}
