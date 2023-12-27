import 'package:image_search/data/data_source/pix_api.dart';
import 'package:image_search/data/mapper/image_mapper.dart';
import 'package:image_search/data/model/image_model.dart';

abstract interface class ImageModelRepository {
  Future<List<ImageModel>> getImageItems(String query);
}

class PixabayImageModelRepository implements ImageModelRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageModel>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toImageModel()).toList();
  }
}

class MockImageItemRepository implements ImageModelRepository {
  @override
  Future<List<ImageModel>> getImageItems(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == 'apple') {
      return [
        ImageModel(imageUrl: "https://pixabay.com/vectors/baseball-ball-sport-round-25761/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/vectors/baseball-ball-sport-round-game-157928/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/photos/softball-baseball-ball-sport-game-372979/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/vectors/baseball-ball-sports-seam-stitches-146883/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/photos/baseball-little-league-youth-kids-7985433/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/photos/stadium-baseball-dodgers-field-5460564/", tags: ''),
      ];
    } else {
      return [
        ImageModel(imageUrl: "https://pixabay.com/illustrations/moon-moonlight-night-full-moon-4919501/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/vectors/basketball-ball-sport-orange-ball-147794/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/vectors/basketball-ball-sport-orange-ball-155997/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/photos/basketball-playing-silhouette-108622/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/photos/basketball-sport-ball-game-2258650/", tags: ''),
        ImageModel(imageUrl: "https://pixabay.com/photos/basketball-man-model-young-male-784097/", tags: ''),
      ];
    }
  }
}
