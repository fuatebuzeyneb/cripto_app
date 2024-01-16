import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cripto_app/models/articles_model.dart';

import 'package:meta/meta.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitial());
  List<ArticlesModel> articlesModelList = [];

  getArticlesData() async {
    try {
      emit(ArticlesLoading());
      await FirebaseFirestore.instance.collection('articles').get().then(
            (value) => value.docs.forEach(
              (element) {
                articlesModelList.add(
                  ArticlesModel.fromJson(
                    element.data(),
                  ),
                );
              },
            ),
          );
      emit(ArticlesSuccess());
    } on Exception catch (e) {
      emit(ArticlesFailure(massError: e.toString()));
    }
  }
}
