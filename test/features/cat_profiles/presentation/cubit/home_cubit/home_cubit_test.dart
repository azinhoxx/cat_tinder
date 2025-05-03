import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_cats.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllCats extends Mock implements GetAllCats {}

void main() {
  late HomeCubit homeCubit;
  late MockGetAllCats mockGetAllCats;

  setUp(() {
    mockGetAllCats = MockGetAllCats();
    homeCubit = HomeCubit(mockGetAllCats);
  });

  tearDown(() {
    homeCubit.close();
  });

  final catsBatch1 = [
    CatEntity(id: '1', url: 'url_1', breeds: []),
    CatEntity(id: '2', url: 'url_2', breeds: []),
    CatEntity(id: '3', url: 'url_3', breeds: []),
    CatEntity(id: '4', url: 'url_4', breeds: []),
    CatEntity(id: '5', url: 'url_5', breeds: []),
    CatEntity(id: '6', url: 'url_6', breeds: []),
    CatEntity(id: '7', url: 'url_7', breeds: []),
  ];

  final catsBatch2 = [
    CatEntity(id: '8', url: 'url_8', breeds: []),
    CatEntity(id: '9', url: 'url_9', breeds: []),
    CatEntity(id: '10', url: 'url_10', breeds: []),
    CatEntity(id: '11', url: 'url_11', breeds: []),
  ];

  group('fetchSlides', () {
    blocTest<HomeCubit, HomeState>(
      'success fetch cats',
      build: () {
        when(() => mockGetAllCats()).thenAnswer(
          (_) async =>
              ApiResultModel<List<CatEntity>>.success(data: catsBatch1),
        );

        return homeCubit;
      },
      act: (cubit) => cubit.fetchSlides(),
      expect:
          () => [
            const HomeState(isFetching: true, isFirstLoading: true, slides: []),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
          ],
      verify: (_) => verify(() => mockGetAllCats()).called(1),
    );

    blocTest<HomeCubit, HomeState>(
      'success fetch cats twice',
      build: () {
        int callCount = 0;
        when(() => mockGetAllCats()).thenAnswer((_) async {
          callCount++;
          return ApiResultModel.success(
            data: callCount == 1 ? catsBatch1 : catsBatch2,
          );
        });

        return homeCubit;
      },
      act: (cubit) async {
        await homeCubit.fetchSlides();
        await homeCubit.fetchSlides();
      },
      expect:
          () => [
            const HomeState(isFetching: true, isFirstLoading: true, slides: []),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: true,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: [...catsBatch1, ...catsBatch2],
            ),
          ],
      verify: (_) => verify(() => mockGetAllCats()).called(2),
    );

    blocTest<HomeCubit, HomeState>(
      'success fetch cats with null-fields',
      build: () {
        final List<CatEntity> mockCats = [
          CatEntity(id: '1', url: 'url_1', breeds: []),
          CatEntity(id: '1', url: 'url_1', breeds: []),
          CatEntity(id: '2', url: 'url_2', breeds: []),
          CatEntity(id: '2', url: 'url_2', breeds: null),
          CatEntity(id: null, url: 'url_1', breeds: []),
          CatEntity(id: '1', url: null, breeds: []),
        ];

        when(
          () => mockGetAllCats(),
        ).thenAnswer((_) async => ApiResultModel.success(data: mockCats));

        return homeCubit;
      },
      act: (cubit) => cubit.fetchSlides(),
      expect:
          () => [
            const HomeState(isFetching: true, isFirstLoading: true, slides: []),
            const HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: [
                CatEntity(id: '1', url: 'url_1', breeds: []),
                CatEntity(id: '2', url: 'url_2', breeds: []),
              ],
            ),
          ],
      verify: (_) => verify(() => mockGetAllCats()).called(1),
    );

    blocTest<HomeCubit, HomeState>(
      'success fetch cats with doublicates',
      build: () {
        when(
          () => mockGetAllCats(),
        ).thenAnswer((_) async => ApiResultModel.success(data: catsBatch1));

        return homeCubit;
      },
      act: (cubit) async {
        await cubit.fetchSlides();
        await cubit.fetchSlides();
      },
      expect:
          () => [
            const HomeState(isFetching: true, isFirstLoading: true, slides: []),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: true,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
          ],
      verify: (_) => verify(() => mockGetAllCats()).called(2),
    );

    blocTest<HomeCubit, HomeState>(
      'failed fetch cats',
      build: () {
        final ErrorResultModel error = ErrorResultModel(
          message: 'Error',
          statusCode: 404,
        );

        when(() => mockGetAllCats()).thenAnswer(
          (_) async => ApiResultModel.failure(errorResultEntity: error),
        );

        return homeCubit;
      },
      act: (cubit) => cubit.fetchSlides(),
      expect:
          () => [
            const HomeState(
              isFetching: true,
              isFirstLoading: true,
              error: null,
            ),
            const HomeState(
              isFetching: false,
              isFirstLoading: false,
              error: ErrorResultModel(message: 'Error', statusCode: 404),
            ),
          ],
      verify: (_) => verify(() => mockGetAllCats()).called(1),
    );
  });

  group('updateSlides', () {
    blocTest<HomeCubit, HomeState>(
      'enough slides, should do nothing',
      build: () {
        when(
          () => mockGetAllCats(),
        ).thenAnswer((_) async => ApiResultModel.success(data: catsBatch1));
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.fetchSlides();
        await cubit.updateSlides();
      },
      expect:
          () => [
            const HomeState(isFetching: true, isFirstLoading: true, slides: []),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
          ],
    );

    blocTest<HomeCubit, HomeState>(
      'low slide count, should fetch more and add',
      build: () {
        int callCount = 0;
        when(() => mockGetAllCats()).thenAnswer((_) async {
          callCount++;
          return ApiResultModel.success(
            data: callCount == 1 ? catsBatch1 : catsBatch2,
          );
        });
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.fetchSlides();
        cubit.updateIndex(5);
        await cubit.updateSlides();
      },
      expect:
          () => [
            const HomeState(isFetching: true, isFirstLoading: true, slides: []),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              currentIndex: 5,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: true,
              isFirstLoading: false,
              currentIndex: 5,
              slides: catsBatch1,
            ),
            HomeState(
              isFetching: false,
              isFirstLoading: false,
              currentIndex: 5,
              slides: [...catsBatch1, ...catsBatch2],
            ),
          ],
    );
  });

  blocTest<HomeCubit, HomeState>(
    'updateIndex updates currentIndex only',
    build: () => homeCubit,
    seed: () => HomeState(currentIndex: 0),
    act: (cubit) => cubit.updateIndex(3),
    expect: () => [HomeState(currentIndex: 3)],
  );
}
