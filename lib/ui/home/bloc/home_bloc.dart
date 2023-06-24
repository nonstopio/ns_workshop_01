import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/post.dart';
import '../../../data/repo/index.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoad>((event, emit) async {
      emit(HomeLoading());
      final posts = await postRepo.getPosts();
      emit(HomeLoaded(posts));
    });
  }
}
