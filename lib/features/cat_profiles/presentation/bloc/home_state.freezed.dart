// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  bool get isFirstLoading => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  List<CatEntity> get slides => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    bool isFirstLoading,
    bool isFetching,
    List<CatEntity> slides,
    int currentIndex,
    int likesCount,
    String? errorMessage,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstLoading = null,
    Object? isFetching = null,
    Object? slides = null,
    Object? currentIndex = null,
    Object? likesCount = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isFirstLoading:
                null == isFirstLoading
                    ? _value.isFirstLoading
                    : isFirstLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isFetching:
                null == isFetching
                    ? _value.isFetching
                    : isFetching // ignore: cast_nullable_to_non_nullable
                        as bool,
            slides:
                null == slides
                    ? _value.slides
                    : slides // ignore: cast_nullable_to_non_nullable
                        as List<CatEntity>,
            currentIndex:
                null == currentIndex
                    ? _value.currentIndex
                    : currentIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            likesCount:
                null == likesCount
                    ? _value.likesCount
                    : likesCount // ignore: cast_nullable_to_non_nullable
                        as int,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isFirstLoading,
    bool isFetching,
    List<CatEntity> slides,
    int currentIndex,
    int likesCount,
    String? errorMessage,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstLoading = null,
    Object? isFetching = null,
    Object? slides = null,
    Object? currentIndex = null,
    Object? likesCount = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        isFirstLoading:
            null == isFirstLoading
                ? _value.isFirstLoading
                : isFirstLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isFetching:
            null == isFetching
                ? _value.isFetching
                : isFetching // ignore: cast_nullable_to_non_nullable
                    as bool,
        slides:
            null == slides
                ? _value._slides
                : slides // ignore: cast_nullable_to_non_nullable
                    as List<CatEntity>,
        currentIndex:
            null == currentIndex
                ? _value.currentIndex
                : currentIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        likesCount:
            null == likesCount
                ? _value.likesCount
                : likesCount // ignore: cast_nullable_to_non_nullable
                    as int,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    required this.isFirstLoading,
    required this.isFetching,
    required final List<CatEntity> slides,
    required this.currentIndex,
    required this.likesCount,
    this.errorMessage,
  }) : _slides = slides;

  @override
  final bool isFirstLoading;
  @override
  final bool isFetching;
  final List<CatEntity> _slides;
  @override
  List<CatEntity> get slides {
    if (_slides is EqualUnmodifiableListView) return _slides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slides);
  }

  @override
  final int currentIndex;
  @override
  final int likesCount;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(isFirstLoading: $isFirstLoading, isFetching: $isFetching, slides: $slides, currentIndex: $currentIndex, likesCount: $likesCount, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isFirstLoading, isFirstLoading) ||
                other.isFirstLoading == isFirstLoading) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            const DeepCollectionEquality().equals(other._slides, _slides) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isFirstLoading,
    isFetching,
    const DeepCollectionEquality().hash(_slides),
    currentIndex,
    likesCount,
    errorMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    required final bool isFirstLoading,
    required final bool isFetching,
    required final List<CatEntity> slides,
    required final int currentIndex,
    required final int likesCount,
    final String? errorMessage,
  }) = _$HomeStateImpl;

  @override
  bool get isFirstLoading;
  @override
  bool get isFetching;
  @override
  List<CatEntity> get slides;
  @override
  int get currentIndex;
  @override
  int get likesCount;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
