// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_cats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LikedCatsState {
  List<CatLikedEntity> get likedCats => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;

  /// Create a copy of LikedCatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikedCatsStateCopyWith<LikedCatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedCatsStateCopyWith<$Res> {
  factory $LikedCatsStateCopyWith(
    LikedCatsState value,
    $Res Function(LikedCatsState) then,
  ) = _$LikedCatsStateCopyWithImpl<$Res, LikedCatsState>;
  @useResult
  $Res call({List<CatLikedEntity> likedCats, int likesCount});
}

/// @nodoc
class _$LikedCatsStateCopyWithImpl<$Res, $Val extends LikedCatsState>
    implements $LikedCatsStateCopyWith<$Res> {
  _$LikedCatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikedCatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? likedCats = null, Object? likesCount = null}) {
    return _then(
      _value.copyWith(
            likedCats:
                null == likedCats
                    ? _value.likedCats
                    : likedCats // ignore: cast_nullable_to_non_nullable
                        as List<CatLikedEntity>,
            likesCount:
                null == likesCount
                    ? _value.likesCount
                    : likesCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LikedCatsStateImplCopyWith<$Res>
    implements $LikedCatsStateCopyWith<$Res> {
  factory _$$LikedCatsStateImplCopyWith(
    _$LikedCatsStateImpl value,
    $Res Function(_$LikedCatsStateImpl) then,
  ) = __$$LikedCatsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatLikedEntity> likedCats, int likesCount});
}

/// @nodoc
class __$$LikedCatsStateImplCopyWithImpl<$Res>
    extends _$LikedCatsStateCopyWithImpl<$Res, _$LikedCatsStateImpl>
    implements _$$LikedCatsStateImplCopyWith<$Res> {
  __$$LikedCatsStateImplCopyWithImpl(
    _$LikedCatsStateImpl _value,
    $Res Function(_$LikedCatsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LikedCatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? likedCats = null, Object? likesCount = null}) {
    return _then(
      _$LikedCatsStateImpl(
        likedCats:
            null == likedCats
                ? _value._likedCats
                : likedCats // ignore: cast_nullable_to_non_nullable
                    as List<CatLikedEntity>,
        likesCount:
            null == likesCount
                ? _value.likesCount
                : likesCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$LikedCatsStateImpl implements _LikedCatsState {
  const _$LikedCatsStateImpl({
    final List<CatLikedEntity> likedCats = const [],
    this.likesCount = 0,
  }) : _likedCats = likedCats;

  final List<CatLikedEntity> _likedCats;
  @override
  @JsonKey()
  List<CatLikedEntity> get likedCats {
    if (_likedCats is EqualUnmodifiableListView) return _likedCats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedCats);
  }

  @override
  @JsonKey()
  final int likesCount;

  @override
  String toString() {
    return 'LikedCatsState(likedCats: $likedCats, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedCatsStateImpl &&
            const DeepCollectionEquality().equals(
              other._likedCats,
              _likedCats,
            ) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_likedCats),
    likesCount,
  );

  /// Create a copy of LikedCatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedCatsStateImplCopyWith<_$LikedCatsStateImpl> get copyWith =>
      __$$LikedCatsStateImplCopyWithImpl<_$LikedCatsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LikedCatsState implements LikedCatsState {
  const factory _LikedCatsState({
    final List<CatLikedEntity> likedCats,
    final int likesCount,
  }) = _$LikedCatsStateImpl;

  @override
  List<CatLikedEntity> get likedCats;
  @override
  int get likesCount;

  /// Create a copy of LikedCatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikedCatsStateImplCopyWith<_$LikedCatsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
