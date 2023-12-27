import 'package:image_search/data/dto/pix_dto.dart';
import 'package:image_search/data/model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toImageModel() {
    return ImageModel(
      imageUrl: previewURL ??
          'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90',
      tags: tags ?? '',
    );
  }
}
