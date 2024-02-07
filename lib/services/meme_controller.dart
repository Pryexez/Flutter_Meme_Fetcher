import 'package:tutorial/locator.dart';
import 'package:tutorial/services/dio_service_meme.dart';

class MemeDomainController {
  getMemePictureUrl() async {
    return locator.get<MemesApiServices>().fetchMeme('deutschememes');
  }

  getAnimalPictureUrl() async {
    return locator.get<MemesApiServices>().fetchMeme('aww');
  }
}
