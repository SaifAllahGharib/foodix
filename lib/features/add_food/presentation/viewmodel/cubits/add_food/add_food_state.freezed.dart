// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_food_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddFoodState {

  PageState get status;

  String? get pickedImage;

  bool get isValid;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddFoodStateCopyWith<AddFoodState> get copyWith =>
      _$AddFoodStateCopyWithImpl<AddFoodState>(
          this as AddFoodState, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddFoodState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }


  @override
  int get hashCode => Object.hash(runtimeType, status, pickedImage, isValid);

  @override
  String toString() {
    return 'AddFoodState(status: $status, pickedImage: $pickedImage, isValid: $isValid)';
  }


}

/// @nodoc
abstract mixin class $AddFoodStateCopyWith<$Res> {
  factory $AddFoodStateCopyWith(AddFoodState value,
      $Res Function(AddFoodState) _then) = _$AddFoodStateCopyWithImpl;

  @useResult
  $Res call({
    PageState status, String? pickedImage, bool isValid
  });


  $PageStateCopyWith<dynamic, $Res> get status;

}

/// @nodoc
class _$AddFoodStateCopyWithImpl<$Res>
    implements $AddFoodStateCopyWith<$Res> {
  _$AddFoodStateCopyWithImpl(this._self, this._then);

  final AddFoodState _self;
  final $Res Function(AddFoodState) _then;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? status = null, Object? pickedImage = freezed, Object? isValid = null,}) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
      as PageState,
      pickedImage: freezed == pickedImage
          ? _self.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
      as String?,
      isValid: null == isValid
          ? _self.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
      as bool,
    ));
  }

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageStateCopyWith<dynamic, $Res> get status {
    return $PageStateCopyWith<dynamic, $Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}


/// @nodoc


class _AddFoodState implements AddFoodState {
  const _AddFoodState({this.status = const PageState
      .init(), this.pickedImage, this.isValid = false});


  @override
  @JsonKey()
  final PageState status;
  @override final String? pickedImage;
  @override
  @JsonKey()
  final bool isValid;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddFoodStateCopyWith<_AddFoodState> get copyWith =>
      __$AddFoodStateCopyWithImpl<_AddFoodState>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AddFoodState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }


  @override
  int get hashCode => Object.hash(runtimeType, status, pickedImage, isValid);

  @override
  String toString() {
    return 'AddFoodState(status: $status, pickedImage: $pickedImage, isValid: $isValid)';
  }


}

/// @nodoc
abstract mixin class _$AddFoodStateCopyWith<$Res>
    implements $AddFoodStateCopyWith<$Res> {
  factory _$AddFoodStateCopyWith(_AddFoodState value,
      $Res Function(_AddFoodState) _then) = __$AddFoodStateCopyWithImpl;

  @override
  @useResult
  $Res call({
    PageState status, String? pickedImage, bool isValid
  });


  @override $PageStateCopyWith<dynamic, $Res> get status;

}

/// @nodoc
class __$AddFoodStateCopyWithImpl<$Res>
    implements _$AddFoodStateCopyWith<$Res> {
  __$AddFoodStateCopyWithImpl(this._self, this._then);

  final _AddFoodState _self;
  final $Res Function(_AddFoodState) _then;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? status = null, Object? pickedImage = freezed, Object? isValid = null,}) {
    return _then(_AddFoodState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
      as PageState,
      pickedImage: freezed == pickedImage
          ? _self.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
      as String?,
      isValid: null == isValid
          ? _self.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
      as bool,
    ));
  }

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageStateCopyWith<dynamic, $Res> get status {
    return $PageStateCopyWith<dynamic, $Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

// dart format on
