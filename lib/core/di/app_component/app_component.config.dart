// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cat_tinder/core/di/swiper_module.dart' as _i190;
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
import 'package:cat_tinder/features/cat_profiles/domain/repositories/cat_repository.dart'
    as _i156;
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_cats.dart'
    as _i816;
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart'
    as _i61;
import 'package:cat_tinder/features/cat_profiles/presentation/services/swiper_controller_service.dart'
    as _i871;
import 'package:flutter_card_swiper/flutter_card_swiper.dart' as _i489;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final swiperModule = _$SwiperModule();
    gh.factory<_i287.ConnectivityCheckerHelper>(
      () => _i287.ConnectivityCheckerHelper(),
    );
    gh.lazySingleton<_i489.CardSwiperController>(
      () => swiperModule.swiperController,
    );
    gh.factory<_i871.SwiperControllerService>(
      () => _i871.SwiperControllerService(gh<_i489.CardSwiperController>()),
    );
    gh.factory<_i5.HttpRequestContext>(
      () => _i5.HttpRequestContext(gh<_i287.ConnectivityCheckerHelper>()),
    );
    gh.factory<_i759.CatRemoteDataSource>(
      () => _i1007.CatRemoteDatasourceImpl(gh<_i5.HttpRequestContext>()),
    );
    gh.factory<_i156.CatRepository>(
      () => _i823.CatRepositoryImpl(
        remoteDataSource: gh<_i759.CatRemoteDataSource>(),
      ),
    );
    gh.factory<_i816.GetAllCats>(
      () => _i816.GetAllCats(gh<_i156.CatRepository>()),
    );
    gh.factory<_i61.HomeCubit>(
      () => _i61.HomeCubit(
        gh<_i816.GetAllCats>(),
        gh<_i871.SwiperControllerService>(),
      ),
    );
    return this;
  }
}

class _$SwiperModule extends _i190.SwiperModule {}
