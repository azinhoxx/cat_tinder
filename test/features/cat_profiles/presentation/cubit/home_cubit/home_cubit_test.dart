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

  group('Home cubit', () {
    group('fetchSlides', () {
      blocTest<HomeCubit, HomeState>(
        'emits correct state on success',
        build: () {
          final List<CatEntity> mockCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
          ];

          when(() => mockGetAllCats()).thenAnswer(
            (_) async =>
                ApiResultModel<List<CatEntity>>.success(data: mockCats),
          );

          return homeCubit;
        },
        act: (cubit) => cubit.fetchSlides(),
        expect:
            () => [
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                ],
                error: null,
              ),
            ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits correct state on double success',
        build: () {
          final List<CatEntity> firstBatchCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
          ];

          final List<CatEntity> secondBatchCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
            CatEntity(id: '3', url: 'url_3', breeds: []),
            CatEntity(id: '4', url: 'url_4', breeds: []),
          ];

          int callCount = 0;
          when(() => mockGetAllCats()).thenAnswer((_) async {
            callCount++;
            if (callCount == 1) {
              return ApiResultModel.success(data: firstBatchCats);
            }
            return ApiResultModel.success(data: secondBatchCats);
          });

          return homeCubit;
        },
        act: (cubit) async {
          await homeCubit.fetchSlides();
          await homeCubit.fetchSlides();
        },
        expect:
            () => [
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: true,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                ],
                error: null,
              ),
            ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits correct state on success with null fields, duplicates',
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
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                ],
                error: null,
              ),
            ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits correct state on failure',
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
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [],
                error: ErrorResultModel(message: 'Error', statusCode: 404),
              ),
            ],
      );
    });
    group('updateSlides', () {
      blocTest<HomeCubit, HomeState>(
        'emits correct state if there are no need in update slides',
        build: () {
          final List<CatEntity> firstBatchCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
            CatEntity(id: '3', url: 'url_3', breeds: []),
            CatEntity(id: '4', url: 'url_4', breeds: []),
            CatEntity(id: '5', url: 'url_5', breeds: []),
            CatEntity(id: '6', url: 'url_6', breeds: []),
            CatEntity(id: '7', url: 'url_7', breeds: []),
          ];

          final List<CatEntity> secondBatchCats = [
            CatEntity(id: '8', url: 'url_8', breeds: []),
            CatEntity(id: '9', url: 'url_9', breeds: []),
            CatEntity(id: '10', url: 'url_9', breeds: []),
            CatEntity(id: '11', url: 'url_10', breeds: []),
          ];

          int callCount = 0;
          when(() => mockGetAllCats()).thenAnswer((_) async {
            callCount++;
            if (callCount == 1) {
              return ApiResultModel.success(data: firstBatchCats);
            }
            return ApiResultModel.success(data: secondBatchCats);
          });

          return homeCubit;
        },
        act: (cubit) async {
          await cubit.fetchSlides();
          await cubit.updateSlides();
        },
        expect:
            () => [
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                  CatEntity(id: '5', url: 'url_5', breeds: []),
                  CatEntity(id: '6', url: 'url_6', breeds: []),
                  CatEntity(id: '7', url: 'url_7', breeds: []),
                ],
                error: null,
              ),
            ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits correct state if there are need in update slides with non-empty slides',
        build: () {
          final List<CatEntity> firstBatchCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
            CatEntity(id: '3', url: 'url_3', breeds: []),
            CatEntity(id: '4', url: 'url_4', breeds: []),
            CatEntity(id: '5', url: 'url_5', breeds: []),
            CatEntity(id: '6', url: 'url_6', breeds: []),
            CatEntity(id: '7', url: 'url_7', breeds: []),
          ];

          final List<CatEntity> secondBatchCats = [
            CatEntity(id: '8', url: 'url_8', breeds: []),
            CatEntity(id: '9', url: 'url_9', breeds: []),
            CatEntity(id: '10', url: 'url_9', breeds: []),
            CatEntity(id: '11', url: 'url_10', breeds: []),
          ];

          int callCount = 0;
          when(() => mockGetAllCats()).thenAnswer((_) async {
            callCount++;
            if (callCount == 1) {
              return ApiResultModel.success(data: firstBatchCats);
            }
            return ApiResultModel.success(data: secondBatchCats);
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
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                currentIndex: 0,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                currentIndex: 0,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                  CatEntity(id: '5', url: 'url_5', breeds: []),
                  CatEntity(id: '6', url: 'url_6', breeds: []),
                  CatEntity(id: '7', url: 'url_7', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                currentIndex: 5,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                  CatEntity(id: '5', url: 'url_5', breeds: []),
                  CatEntity(id: '6', url: 'url_6', breeds: []),
                  CatEntity(id: '7', url: 'url_7', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: true,
                isFirstLoading: false,
                currentIndex: 5,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                  CatEntity(id: '5', url: 'url_5', breeds: []),
                  CatEntity(id: '6', url: 'url_6', breeds: []),
                  CatEntity(id: '7', url: 'url_7', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                currentIndex: 5,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                  CatEntity(id: '5', url: 'url_5', breeds: []),
                  CatEntity(id: '6', url: 'url_6', breeds: []),
                  CatEntity(id: '7', url: 'url_7', breeds: []),
                  CatEntity(id: '8', url: 'url_8', breeds: []),
                  CatEntity(id: '9', url: 'url_9', breeds: []),
                  CatEntity(id: '10', url: 'url_9', breeds: []),
                  CatEntity(id: '11', url: 'url_10', breeds: []),
                ],
                error: null,
              ),
            ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits correct state if there are need in update slides',
        build: () {
          final List<CatEntity> firstBatchCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
          ];

          final List<CatEntity> secondBatchCats = [
            CatEntity(id: '1', url: 'url_1', breeds: []),
            CatEntity(id: '2', url: 'url_2', breeds: []),
            CatEntity(id: '3', url: 'url_3', breeds: []),
            CatEntity(id: '4', url: 'url_4', breeds: []),
          ];

          int callCount = 0;
          when(() => mockGetAllCats()).thenAnswer((_) async {
            callCount++;
            if (callCount == 1) {
              return ApiResultModel.success(data: firstBatchCats);
            }
            return ApiResultModel.success(data: secondBatchCats);
          });

          return homeCubit;
        },
        act: (cubit) async {
          await cubit.updateSlides();
          await cubit.updateSlides();
        },
        expect:
            () => [
              HomeState(
                isFetching: true,
                isFirstLoading: true,
                slides: [],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: true,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                ],
                error: null,
              ),
              HomeState(
                isFetching: false,
                isFirstLoading: false,
                slides: [
                  CatEntity(id: '1', url: 'url_1', breeds: []),
                  CatEntity(id: '2', url: 'url_2', breeds: []),
                  CatEntity(id: '3', url: 'url_3', breeds: []),
                  CatEntity(id: '4', url: 'url_4', breeds: []),
                ],
                error: null,
              ),
            ],
      );
    });

    group('updateIndex', () {
      blocTest<HomeCubit, HomeState>(
        'updateIndex updates currentIndex only',
        build: () => homeCubit,
        act: (cubit) => cubit.updateIndex(3),
        expect:
            () => [
              HomeState(
                currentIndex: 3,
                slides: [],
                isFetching: false,
                isFirstLoading: true,
                error: null,
              ),
            ],
      );
    });
  });
}
