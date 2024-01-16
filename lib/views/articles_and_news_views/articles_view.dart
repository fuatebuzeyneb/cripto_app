import 'package:cripto_app/cubit/articles_cubit/articles_cubit.dart';
import 'package:cripto_app/widgets/card_articles_widget.dart';
import 'package:cripto_app/widgets/helper/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocConsumer<ArticlesCubit, ArticlesState>(
        listener: (context, state) {
          if (state is ArticlesFailure) {
            toastMsg(errorMsg: state.massError);
          }
        },
        builder: (context, state) {
          return state is ArticlesLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: BlocProvider.of<ArticlesCubit>(context)
                      .articlesModelList
                      .length,
                  itemBuilder: ((context, index) {
                    return CardArticlesWidget(
                      articlesModel: BlocProvider.of<ArticlesCubit>(context)
                          .articlesModelList[index],
                    );
                  }),
                );
        },
      ),
    );
  }
}
