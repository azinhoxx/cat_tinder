// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cat_tinder/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i287;
import 'package:cat_tinder/core/utils/helpers/http_strategy_helper/http_request_context.dart'
    as _i5;
import 'package:cat_tinder/features/cat_profiles/data/datasources/remote_datasource/cat_remote_datasource.dart'
    as _i759;
import 'package:cat_tinder/features/cat_profiles/data/datasources/remote_datasource/cat_remote_datasource_impl.dart'
    as _i1007;
import 'package:cat_tinder/features/cat_profiles/data/repositories/cat_repository_impl.dart'
    as _i823;
import 'package:cat_tinder/features/cat_profiles/data/repositories/liked_cats_repository_impl.dart'
    as _i205;
import 'package:cat_tinder/features/cat_profiles/domain/repositories/cat_repository.dart'
    as _i156;
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart'
    as _i424;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/add_liked_cat.dart'
    as _i452;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/filter_liked_cats.dart'
    as _i719;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_cats.dart'
    as _i816;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_liked_cats.dart'
    as _i872;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_likes_count.dart'
    as _i619;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/remove_liked_cat.dart'
    as _i711;
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart'
    as _i165;
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart'
    as _i172;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i287.ConnectivityCheckerHelper>(
      () => _i287.ConnectivityCheckerHelper(),
    );
    gh.lazySingleton<_i424.LikedCatsRepository>(
      () => _i205.LikedCatsRepositoryImpl(),
    );
    gh.factory<_i5.HttpRequestContext>(
      () => _i5.HttpRequestContext(gh<_i287.ConnectivityCheckerHelper>()),
    );
    gh.factory<_i759.CatRemoteDataSource>(
      () => _i1007.CatRemoteDatasourceImpl(gh<_i5.HttpRequestContext>()),
    );
    gh.factory<_i452.AddLikedCat>(
      () => _i452.AddLikedCat(gh<_i424.LikedCatsRepository>()),
    );
    gh.factory<_i719.FilterLikedCats>(
      () => _i719.FilterLikedCats(gh<_i424.LikedCatsRepository>()),
    );
    gh.factory<_i872.GetAllLikedCats>(
      () => _i872.GetAllLikedCats(gh<_i424.LikedCatsRepository>()),
    );
    gh.factory<_i619.GetLikesCount>(
      () => _i619.GetLikesCount(gh<_i424.LikedCatsRepository>()),
    );
    gh.factory<_i711.RemoveLikedCat>(
      () => _i711.RemoveLikedCat(gh<_i424.LikedCatsRepository>()),
    );
    gh.factory<_i156.CatRepository>(
      () => _i823.CatRepositoryImpl(
        remoteDataSource: gh<_i759.CatRemoteDataSource>(),
      ),
    );
    gh.factory<_i172.LikedCatsCubit>(
      () => _i172.LikedCatsCubit(
        gh<_i872.GetAllLikedCats>(),
        gh<_i452.AddLikedCat>(),
        gh<_i711.RemoveLikedCat>(),
        gh<_i619.GetLikesCount>(),
        gh<_i719.FilterLikedCats>(),
      ),
    );
    gh.factory<_i816.GetAllCats>(
      () => _i816.GetAllCats(gh<_i156.CatRepository>()),
    );
    gh.factory<_i165.HomeCubit>(() => _i165.HomeCubit(gh<_i816.GetAllCats>()));
    return this;
  }
}
