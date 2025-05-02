import 'dart:convert';

import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/data/datasources/local_datasource/liked_cats_local_datasource.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_liked_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LikedCatsLocalDatasource)
class LikedCatsLocalDatasourceImpl implements LikedCatsLocalDatasource {
  static const _likedCatsKey = 'liked_cats';

  @override
  Future<ApiResultModel<List<CatLikedModel>>> getCats() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_likedCatsKey);

      if (jsonString == null) {
        return ApiResultModel<List<CatLikedModel>>.success(data: []);
      }

      final List<dynamic> decoded = jsonDecode(jsonString) as List;
      final List<CatLikedModel> likedCats =
          decoded
              .map((e) => CatLikedModel.fromJson(e as Map<String, dynamic>))
              .toList();

      return ApiResultModel<List<CatLikedModel>>.success(data: likedCats);
    } catch (e) {
      return ApiResultModel<List<CatLikedModel>>.failure(
        errorResultEntity: ErrorResultModel(
          message: 'Failed to load liked cats: $e',
        ),
      );
    }
  }

  @override
  Future<ApiResultModel<void>> saveCats(List<CatLikedModel> cats) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final jsonString = jsonEncode(
        cats.map((CatLikedModel e) => e.toJson()).toList(),
      );

      await prefs.setString(_likedCatsKey, jsonString);

      return ApiResultModel<void>.success(data: null);
    } catch (e) {
      return ApiResultModel<void>.failure(
        errorResultEntity: ErrorResultModel(
          message: 'Failed to save liked cats: $e',
        ),
      );
    }
  }
}
