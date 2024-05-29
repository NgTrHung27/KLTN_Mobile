import 'package:bloc/bloc.dart';
import 'package:kltn_mobile/Model/news.dart';

import 'package:kltn_mobile/bloC/repository/repository.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  APIRepository apiRepository = APIRepository();

  void getNewsList() async {
    emit(NewsLoading());
    try {
      List<NewsList> newsList = await apiRepository.fetchNews();
      emit(NewsLoaded(newsList: newsList));
      print('NewLoaded $newsList');
    } catch (e) {
      emit(NewsError(message: e.toString()));
      print('NewsError $e');
    }
  }
}