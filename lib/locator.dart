import 'package:get_it/get_it.dart';
import 'package:tutorial/services/dio_service_meme.dart';
import 'package:tutorial/services/meme_controller.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<MemesApiServices>(() => MemesApiServices());

  locator.registerLazySingleton<MemeDomainController>(
      () => MemeDomainController());
}
