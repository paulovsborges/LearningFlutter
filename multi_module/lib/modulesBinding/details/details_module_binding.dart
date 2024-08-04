import 'package:get_it/get_it.dart';
import 'package:presentation/features/details/details_presenter.dart';

class DetailsModuleBinding {
  static void init() {
    GetIt.I.registerLazySingleton(() => DetailsPresenter());
  }
}
