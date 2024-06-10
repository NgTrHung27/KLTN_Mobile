import 'package:bloc/bloc.dart';
import 'package:kltn_mobile/blocs/repository/repository.dart';
import 'package:kltn_mobile/models/schools.dart';

part 'schools_state.dart';

class SchoolsCubit extends Cubit<SchoolsState> {
  SchoolsCubit() : super(SchoolsInitial());
  APIRepository apiRepository = APIRepository();

  void getSchoolList() async {
    emit(SchoolsLoading());
    try {
      List<Schools> schoolList = await apiRepository.fetchSchools();
      emit(SchoolsLoaded(schoolList: schoolList));
      print('SchoolsLoaded $schoolList');
    } catch (e) {
      emit(SchoolsError(message: e.toString()));
      print('SchoolsError $e');
    }
  }

  void getCountryList() async {
    emit(SchoolsLoading());
    try {
      List<String> countryList = await apiRepository.fetchUniqueCountries();
      emit(CountryLoaded(countryList: countryList));
      print('CountryLoaded $countryList');
    } catch (e) {
      emit(SchoolsError(message: e.toString()));
      print('SchoolsError $e');
    }
  }
}
