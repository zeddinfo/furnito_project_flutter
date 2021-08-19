import 'package:furnito_chart/Models/asset_model.dart';
import 'package:furnito_chart/helpers/api_helpers.dart';

class AssetService {
  ApiHelpers api = new ApiHelpers();
  AssetModel asset = new AssetModel();
  List<AssetModel> assets = [];

  Future<List<AssetModel>> getAsset() async {
    var result;
    try {
      result = await api.post('api/assets', null);
      // asset = AssetModel.fromJson(result);

      for (var item in result) {
        assets.add(AssetModel.fromJson(item));
      }
    } catch (error) {
      throw Exception('Gagal Get Products!');
    }
    return assets;
  }
}
