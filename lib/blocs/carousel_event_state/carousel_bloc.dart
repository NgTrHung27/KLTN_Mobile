import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kltn_mobile/blocs/repository/repository.dart';
import 'package:kltn_mobile/models/schools.dart';
part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final APIRepository repository;

  CarouselBloc(this.repository) : super(CarouselInitial()) {
    on<FetchCarousel>(_onFetchCarousel);
  }

  void _onFetchCarousel(FetchCarousel event, Emitter<CarouselState> emit) async {
    emit(CarouselLoading());
    try {
      final List<Schools> carousels = await repository.fetchSchools();
      emit(CarouselLoaded(carousels));
    } catch (_) {
      emit(const CarouselError("Failed to fetch carousel data"));
    }
  }
}
