import 'package:bloc_test/bloc_test.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_breed_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/save_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllLikedCats extends Mock implements GetAllLikedCats {}

class MockSaveAllLikedCats extends Mock implements SaveAllLikedCats {}

void main() {
  late LikedCatsCubit cubit;
  late MockGetAllLikedCats getAllLikedCats;
  late MockSaveAllLikedCats saveAllLikedCats;

  final testCat = CatEntity(
    id: '1',
    url: 'url_1',
    breeds: [CatBreedEntity(name: 'siam')],
  );

  final likedCat = CatLikedEntity(cat: testCat, likedAt: DateTime(2020));

  setUp(() {
    getAllLikedCats = MockGetAllLikedCats();
    saveAllLikedCats = MockSaveAllLikedCats();

    when(
      () => saveAllLikedCats(any()),
    ).thenAnswer((_) async => const ApiResultModel.success(data: null));

    cubit = LikedCatsCubit(getAllLikedCats, saveAllLikedCats);
  });

  tearDown(() => cubit.close());

  group('addCat', () {
    blocTest<LikedCatsCubit, LikedCatsState>(
      'addCat adds cat to likedCats if not exists',
      build: () => cubit,
      act: (cubit) => cubit.addCat(testCat),
      verify: (_) {
        expect(cubit.state.likedCats.length, 1);
        expect(cubit.state.likedCats.first.cat.id, testCat.id);
      },
    );

    blocTest<LikedCatsCubit, LikedCatsState>(
      'addCat does not add duplicate cat',
      build: () => cubit,
      seed: () => LikedCatsState(likedCats: [likedCat]),
      act: (cubit) => cubit.addCat(testCat),
      expect: () => <dynamic>[],
    );
  });

  blocTest<LikedCatsCubit, LikedCatsState>(
    'removeCat removes cat from likedCats and filteredCats',
    build: () => cubit,
    seed: () => LikedCatsState(likedCats: [likedCat], filteredCats: [likedCat]),
    act: (cubit) => cubit.removeCat(testCat),
    expect: () => [LikedCatsState(likedCats: [], filteredCats: [])],
  );

  blocTest<LikedCatsCubit, LikedCatsState>(
    'loadCats fetches liked cats and sets state',
    build: () {
      when(
        () => getAllLikedCats(),
      ).thenAnswer((_) async => ApiResultModel.success(data: [likedCat]));
      return cubit;
    },
    act: (cubit) => cubit.loadCats(),
    expect:
        () => [
          LikedCatsState(likedCats: [likedCat], isFirstLoading: false),
        ],
  );

  group('filterCatsByBreedName', () {
    blocTest<LikedCatsCubit, LikedCatsState>(
      'filters cats by breed name',
      build: () => cubit,
      seed: () => LikedCatsState(likedCats: [likedCat]),
      act: (cubit) => cubit.filterCatsByBreedName('sIa'),
      expect:
          () => [
            LikedCatsState(likedCats: [likedCat], filteredCats: [likedCat]),
          ],
    );

    blocTest<LikedCatsCubit, LikedCatsState>(
      'filters cats by breed name',
      build: () => cubit,
      seed: () => LikedCatsState(likedCats: [likedCat]),
      act: (cubit) => cubit.filterCatsByBreedName('фыф'),
      expect: () => <dynamic>[],
    );
  });

  blocTest<LikedCatsCubit, LikedCatsState>(
    'initFilterList sets filteredCats to likedCats',
    build: () => cubit,
    seed: () => LikedCatsState(likedCats: [likedCat]),
    act: (cubit) => cubit.initFilterList(),
    expect:
        () => [
          LikedCatsState(likedCats: [likedCat], filteredCats: [likedCat]),
        ],
  );

  test('saveCats calls SaveAllLikedCats with likedCats', () async {
    cubit.emit(cubit.state.copyWith(likedCats: [likedCat]));

    await cubit.saveCats();

    verify(() => saveAllLikedCats([likedCat])).called(1);
  });
}
