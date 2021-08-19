import 'package:flutter/cupertino.dart';
import 'package:furnito_chart/Models/asset_model.dart';
import 'package:furnito_chart/services/asset_services.dart';

class AssetProvider with ChangeNotifier {
  List<AssetModel> _assets = [];

  List<AssetModel> get assets => _assets;

  set asset(AssetModel) {
    _assets = assets;
    notifyListeners();
  }

  Future<void> getAssets() async {
    try {
      List<AssetModel> assets = await AssetService().getAsset();
      _assets = assets;
    } catch (error) {
      print('error ${error}');
    }
  }
}
