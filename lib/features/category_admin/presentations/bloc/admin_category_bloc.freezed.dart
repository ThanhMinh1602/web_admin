// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminCategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function() adImagePickerEvent,
    required TResult Function(CategoryModel addCategoryModel)
        adAddNewCategoryEvent,
    required TResult Function(String idCate) adCategoryDeleteEvent,
    required TResult Function(CategoryModel updateCategoryModel)
        adCategoryUpdateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialEvent,
    TResult? Function()? adImagePickerEvent,
    TResult? Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult? Function(String idCate)? adCategoryDeleteEvent,
    TResult? Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function()? adImagePickerEvent,
    TResult Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult Function(String idCate)? adCategoryDeleteEvent,
    TResult Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdCategoryInitialEvent value) initialEvent,
    required TResult Function(AdImagePickerEvent value) adImagePickerEvent,
    required TResult Function(AdAddNewCategoryEvent value)
        adAddNewCategoryEvent,
    required TResult Function(AdDeleteCategoryEvent value)
        adCategoryDeleteEvent,
    required TResult Function(AdUpdateCategoryEvent value)
        adCategoryUpdateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdCategoryInitialEvent value)? initialEvent,
    TResult? Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult? Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult? Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult? Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdCategoryInitialEvent value)? initialEvent,
    TResult Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCategoryEventCopyWith<$Res> {
  factory $AdminCategoryEventCopyWith(
          AdminCategoryEvent value, $Res Function(AdminCategoryEvent) then) =
      _$AdminCategoryEventCopyWithImpl<$Res, AdminCategoryEvent>;
}

/// @nodoc
class _$AdminCategoryEventCopyWithImpl<$Res, $Val extends AdminCategoryEvent>
    implements $AdminCategoryEventCopyWith<$Res> {
  _$AdminCategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AdCategoryInitialEventImplCopyWith<$Res> {
  factory _$$AdCategoryInitialEventImplCopyWith(
          _$AdCategoryInitialEventImpl value,
          $Res Function(_$AdCategoryInitialEventImpl) then) =
      __$$AdCategoryInitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdCategoryInitialEventImplCopyWithImpl<$Res>
    extends _$AdminCategoryEventCopyWithImpl<$Res, _$AdCategoryInitialEventImpl>
    implements _$$AdCategoryInitialEventImplCopyWith<$Res> {
  __$$AdCategoryInitialEventImplCopyWithImpl(
      _$AdCategoryInitialEventImpl _value,
      $Res Function(_$AdCategoryInitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AdCategoryInitialEventImpl implements AdCategoryInitialEvent {
  const _$AdCategoryInitialEventImpl();

  @override
  String toString() {
    return 'AdminCategoryEvent.initialEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdCategoryInitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function() adImagePickerEvent,
    required TResult Function(CategoryModel addCategoryModel)
        adAddNewCategoryEvent,
    required TResult Function(String idCate) adCategoryDeleteEvent,
    required TResult Function(CategoryModel updateCategoryModel)
        adCategoryUpdateEvent,
  }) {
    return initialEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialEvent,
    TResult? Function()? adImagePickerEvent,
    TResult? Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult? Function(String idCate)? adCategoryDeleteEvent,
    TResult? Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
  }) {
    return initialEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function()? adImagePickerEvent,
    TResult Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult Function(String idCate)? adCategoryDeleteEvent,
    TResult Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (initialEvent != null) {
      return initialEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdCategoryInitialEvent value) initialEvent,
    required TResult Function(AdImagePickerEvent value) adImagePickerEvent,
    required TResult Function(AdAddNewCategoryEvent value)
        adAddNewCategoryEvent,
    required TResult Function(AdDeleteCategoryEvent value)
        adCategoryDeleteEvent,
    required TResult Function(AdUpdateCategoryEvent value)
        adCategoryUpdateEvent,
  }) {
    return initialEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdCategoryInitialEvent value)? initialEvent,
    TResult? Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult? Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult? Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult? Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
  }) {
    return initialEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdCategoryInitialEvent value)? initialEvent,
    TResult Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (initialEvent != null) {
      return initialEvent(this);
    }
    return orElse();
  }
}

abstract class AdCategoryInitialEvent implements AdminCategoryEvent {
  const factory AdCategoryInitialEvent() = _$AdCategoryInitialEventImpl;
}

/// @nodoc
abstract class _$$AdImagePickerEventImplCopyWith<$Res> {
  factory _$$AdImagePickerEventImplCopyWith(_$AdImagePickerEventImpl value,
          $Res Function(_$AdImagePickerEventImpl) then) =
      __$$AdImagePickerEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdImagePickerEventImplCopyWithImpl<$Res>
    extends _$AdminCategoryEventCopyWithImpl<$Res, _$AdImagePickerEventImpl>
    implements _$$AdImagePickerEventImplCopyWith<$Res> {
  __$$AdImagePickerEventImplCopyWithImpl(_$AdImagePickerEventImpl _value,
      $Res Function(_$AdImagePickerEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AdImagePickerEventImpl implements AdImagePickerEvent {
  const _$AdImagePickerEventImpl();

  @override
  String toString() {
    return 'AdminCategoryEvent.adImagePickerEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AdImagePickerEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function() adImagePickerEvent,
    required TResult Function(CategoryModel addCategoryModel)
        adAddNewCategoryEvent,
    required TResult Function(String idCate) adCategoryDeleteEvent,
    required TResult Function(CategoryModel updateCategoryModel)
        adCategoryUpdateEvent,
  }) {
    return adImagePickerEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialEvent,
    TResult? Function()? adImagePickerEvent,
    TResult? Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult? Function(String idCate)? adCategoryDeleteEvent,
    TResult? Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
  }) {
    return adImagePickerEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function()? adImagePickerEvent,
    TResult Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult Function(String idCate)? adCategoryDeleteEvent,
    TResult Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adImagePickerEvent != null) {
      return adImagePickerEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdCategoryInitialEvent value) initialEvent,
    required TResult Function(AdImagePickerEvent value) adImagePickerEvent,
    required TResult Function(AdAddNewCategoryEvent value)
        adAddNewCategoryEvent,
    required TResult Function(AdDeleteCategoryEvent value)
        adCategoryDeleteEvent,
    required TResult Function(AdUpdateCategoryEvent value)
        adCategoryUpdateEvent,
  }) {
    return adImagePickerEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdCategoryInitialEvent value)? initialEvent,
    TResult? Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult? Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult? Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult? Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
  }) {
    return adImagePickerEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdCategoryInitialEvent value)? initialEvent,
    TResult Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adImagePickerEvent != null) {
      return adImagePickerEvent(this);
    }
    return orElse();
  }
}

abstract class AdImagePickerEvent implements AdminCategoryEvent {
  const factory AdImagePickerEvent() = _$AdImagePickerEventImpl;
}

/// @nodoc
abstract class _$$AdAddNewCategoryEventImplCopyWith<$Res> {
  factory _$$AdAddNewCategoryEventImplCopyWith(
          _$AdAddNewCategoryEventImpl value,
          $Res Function(_$AdAddNewCategoryEventImpl) then) =
      __$$AdAddNewCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryModel addCategoryModel});
}

/// @nodoc
class __$$AdAddNewCategoryEventImplCopyWithImpl<$Res>
    extends _$AdminCategoryEventCopyWithImpl<$Res, _$AdAddNewCategoryEventImpl>
    implements _$$AdAddNewCategoryEventImplCopyWith<$Res> {
  __$$AdAddNewCategoryEventImplCopyWithImpl(_$AdAddNewCategoryEventImpl _value,
      $Res Function(_$AdAddNewCategoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addCategoryModel = null,
  }) {
    return _then(_$AdAddNewCategoryEventImpl(
      null == addCategoryModel
          ? _value.addCategoryModel
          : addCategoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$AdAddNewCategoryEventImpl implements AdAddNewCategoryEvent {
  const _$AdAddNewCategoryEventImpl(this.addCategoryModel);

  @override
  final CategoryModel addCategoryModel;

  @override
  String toString() {
    return 'AdminCategoryEvent.adAddNewCategoryEvent(addCategoryModel: $addCategoryModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdAddNewCategoryEventImpl &&
            (identical(other.addCategoryModel, addCategoryModel) ||
                other.addCategoryModel == addCategoryModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addCategoryModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdAddNewCategoryEventImplCopyWith<_$AdAddNewCategoryEventImpl>
      get copyWith => __$$AdAddNewCategoryEventImplCopyWithImpl<
          _$AdAddNewCategoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function() adImagePickerEvent,
    required TResult Function(CategoryModel addCategoryModel)
        adAddNewCategoryEvent,
    required TResult Function(String idCate) adCategoryDeleteEvent,
    required TResult Function(CategoryModel updateCategoryModel)
        adCategoryUpdateEvent,
  }) {
    return adAddNewCategoryEvent(addCategoryModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialEvent,
    TResult? Function()? adImagePickerEvent,
    TResult? Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult? Function(String idCate)? adCategoryDeleteEvent,
    TResult? Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
  }) {
    return adAddNewCategoryEvent?.call(addCategoryModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function()? adImagePickerEvent,
    TResult Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult Function(String idCate)? adCategoryDeleteEvent,
    TResult Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adAddNewCategoryEvent != null) {
      return adAddNewCategoryEvent(addCategoryModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdCategoryInitialEvent value) initialEvent,
    required TResult Function(AdImagePickerEvent value) adImagePickerEvent,
    required TResult Function(AdAddNewCategoryEvent value)
        adAddNewCategoryEvent,
    required TResult Function(AdDeleteCategoryEvent value)
        adCategoryDeleteEvent,
    required TResult Function(AdUpdateCategoryEvent value)
        adCategoryUpdateEvent,
  }) {
    return adAddNewCategoryEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdCategoryInitialEvent value)? initialEvent,
    TResult? Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult? Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult? Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult? Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
  }) {
    return adAddNewCategoryEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdCategoryInitialEvent value)? initialEvent,
    TResult Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adAddNewCategoryEvent != null) {
      return adAddNewCategoryEvent(this);
    }
    return orElse();
  }
}

abstract class AdAddNewCategoryEvent implements AdminCategoryEvent {
  const factory AdAddNewCategoryEvent(final CategoryModel addCategoryModel) =
      _$AdAddNewCategoryEventImpl;

  CategoryModel get addCategoryModel;
  @JsonKey(ignore: true)
  _$$AdAddNewCategoryEventImplCopyWith<_$AdAddNewCategoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdDeleteCategoryEventImplCopyWith<$Res> {
  factory _$$AdDeleteCategoryEventImplCopyWith(
          _$AdDeleteCategoryEventImpl value,
          $Res Function(_$AdDeleteCategoryEventImpl) then) =
      __$$AdDeleteCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String idCate});
}

/// @nodoc
class __$$AdDeleteCategoryEventImplCopyWithImpl<$Res>
    extends _$AdminCategoryEventCopyWithImpl<$Res, _$AdDeleteCategoryEventImpl>
    implements _$$AdDeleteCategoryEventImplCopyWith<$Res> {
  __$$AdDeleteCategoryEventImplCopyWithImpl(_$AdDeleteCategoryEventImpl _value,
      $Res Function(_$AdDeleteCategoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCate = null,
  }) {
    return _then(_$AdDeleteCategoryEventImpl(
      null == idCate
          ? _value.idCate
          : idCate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AdDeleteCategoryEventImpl implements AdDeleteCategoryEvent {
  const _$AdDeleteCategoryEventImpl(this.idCate);

  @override
  final String idCate;

  @override
  String toString() {
    return 'AdminCategoryEvent.adCategoryDeleteEvent(idCate: $idCate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdDeleteCategoryEventImpl &&
            (identical(other.idCate, idCate) || other.idCate == idCate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idCate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdDeleteCategoryEventImplCopyWith<_$AdDeleteCategoryEventImpl>
      get copyWith => __$$AdDeleteCategoryEventImplCopyWithImpl<
          _$AdDeleteCategoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function() adImagePickerEvent,
    required TResult Function(CategoryModel addCategoryModel)
        adAddNewCategoryEvent,
    required TResult Function(String idCate) adCategoryDeleteEvent,
    required TResult Function(CategoryModel updateCategoryModel)
        adCategoryUpdateEvent,
  }) {
    return adCategoryDeleteEvent(idCate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialEvent,
    TResult? Function()? adImagePickerEvent,
    TResult? Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult? Function(String idCate)? adCategoryDeleteEvent,
    TResult? Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
  }) {
    return adCategoryDeleteEvent?.call(idCate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function()? adImagePickerEvent,
    TResult Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult Function(String idCate)? adCategoryDeleteEvent,
    TResult Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adCategoryDeleteEvent != null) {
      return adCategoryDeleteEvent(idCate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdCategoryInitialEvent value) initialEvent,
    required TResult Function(AdImagePickerEvent value) adImagePickerEvent,
    required TResult Function(AdAddNewCategoryEvent value)
        adAddNewCategoryEvent,
    required TResult Function(AdDeleteCategoryEvent value)
        adCategoryDeleteEvent,
    required TResult Function(AdUpdateCategoryEvent value)
        adCategoryUpdateEvent,
  }) {
    return adCategoryDeleteEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdCategoryInitialEvent value)? initialEvent,
    TResult? Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult? Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult? Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult? Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
  }) {
    return adCategoryDeleteEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdCategoryInitialEvent value)? initialEvent,
    TResult Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adCategoryDeleteEvent != null) {
      return adCategoryDeleteEvent(this);
    }
    return orElse();
  }
}

abstract class AdDeleteCategoryEvent implements AdminCategoryEvent {
  const factory AdDeleteCategoryEvent(final String idCate) =
      _$AdDeleteCategoryEventImpl;

  String get idCate;
  @JsonKey(ignore: true)
  _$$AdDeleteCategoryEventImplCopyWith<_$AdDeleteCategoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdUpdateCategoryEventImplCopyWith<$Res> {
  factory _$$AdUpdateCategoryEventImplCopyWith(
          _$AdUpdateCategoryEventImpl value,
          $Res Function(_$AdUpdateCategoryEventImpl) then) =
      __$$AdUpdateCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryModel updateCategoryModel});
}

/// @nodoc
class __$$AdUpdateCategoryEventImplCopyWithImpl<$Res>
    extends _$AdminCategoryEventCopyWithImpl<$Res, _$AdUpdateCategoryEventImpl>
    implements _$$AdUpdateCategoryEventImplCopyWith<$Res> {
  __$$AdUpdateCategoryEventImplCopyWithImpl(_$AdUpdateCategoryEventImpl _value,
      $Res Function(_$AdUpdateCategoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateCategoryModel = null,
  }) {
    return _then(_$AdUpdateCategoryEventImpl(
      null == updateCategoryModel
          ? _value.updateCategoryModel
          : updateCategoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$AdUpdateCategoryEventImpl implements AdUpdateCategoryEvent {
  const _$AdUpdateCategoryEventImpl(this.updateCategoryModel);

  @override
  final CategoryModel updateCategoryModel;

  @override
  String toString() {
    return 'AdminCategoryEvent.adCategoryUpdateEvent(updateCategoryModel: $updateCategoryModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdUpdateCategoryEventImpl &&
            (identical(other.updateCategoryModel, updateCategoryModel) ||
                other.updateCategoryModel == updateCategoryModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateCategoryModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdUpdateCategoryEventImplCopyWith<_$AdUpdateCategoryEventImpl>
      get copyWith => __$$AdUpdateCategoryEventImplCopyWithImpl<
          _$AdUpdateCategoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function() adImagePickerEvent,
    required TResult Function(CategoryModel addCategoryModel)
        adAddNewCategoryEvent,
    required TResult Function(String idCate) adCategoryDeleteEvent,
    required TResult Function(CategoryModel updateCategoryModel)
        adCategoryUpdateEvent,
  }) {
    return adCategoryUpdateEvent(updateCategoryModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialEvent,
    TResult? Function()? adImagePickerEvent,
    TResult? Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult? Function(String idCate)? adCategoryDeleteEvent,
    TResult? Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
  }) {
    return adCategoryUpdateEvent?.call(updateCategoryModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function()? adImagePickerEvent,
    TResult Function(CategoryModel addCategoryModel)? adAddNewCategoryEvent,
    TResult Function(String idCate)? adCategoryDeleteEvent,
    TResult Function(CategoryModel updateCategoryModel)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adCategoryUpdateEvent != null) {
      return adCategoryUpdateEvent(updateCategoryModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdCategoryInitialEvent value) initialEvent,
    required TResult Function(AdImagePickerEvent value) adImagePickerEvent,
    required TResult Function(AdAddNewCategoryEvent value)
        adAddNewCategoryEvent,
    required TResult Function(AdDeleteCategoryEvent value)
        adCategoryDeleteEvent,
    required TResult Function(AdUpdateCategoryEvent value)
        adCategoryUpdateEvent,
  }) {
    return adCategoryUpdateEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdCategoryInitialEvent value)? initialEvent,
    TResult? Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult? Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult? Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult? Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
  }) {
    return adCategoryUpdateEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdCategoryInitialEvent value)? initialEvent,
    TResult Function(AdImagePickerEvent value)? adImagePickerEvent,
    TResult Function(AdAddNewCategoryEvent value)? adAddNewCategoryEvent,
    TResult Function(AdDeleteCategoryEvent value)? adCategoryDeleteEvent,
    TResult Function(AdUpdateCategoryEvent value)? adCategoryUpdateEvent,
    required TResult orElse(),
  }) {
    if (adCategoryUpdateEvent != null) {
      return adCategoryUpdateEvent(this);
    }
    return orElse();
  }
}

abstract class AdUpdateCategoryEvent implements AdminCategoryEvent {
  const factory AdUpdateCategoryEvent(final CategoryModel updateCategoryModel) =
      _$AdUpdateCategoryEventImpl;

  CategoryModel get updateCategoryModel;
  @JsonKey(ignore: true)
  _$$AdUpdateCategoryEventImplCopyWith<_$AdUpdateCategoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminCategoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  CategoryModel? get categoryModel => throw _privateConstructorUsedError;
  Uint8List? get imageUnit8List => throw _privateConstructorUsedError;
  html.File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminCategoryStateCopyWith<AdminCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCategoryStateCopyWith<$Res> {
  factory $AdminCategoryStateCopyWith(
          AdminCategoryState value, $Res Function(AdminCategoryState) then) =
      _$AdminCategoryStateCopyWithImpl<$Res, AdminCategoryState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryModel> categories,
      CategoryModel? categoryModel,
      Uint8List? imageUnit8List,
      html.File? imageFile});
}

/// @nodoc
class _$AdminCategoryStateCopyWithImpl<$Res, $Val extends AdminCategoryState>
    implements $AdminCategoryStateCopyWith<$Res> {
  _$AdminCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? categoryModel = freezed,
    Object? imageUnit8List = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryModel: freezed == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      imageUnit8List: freezed == imageUnit8List
          ? _value.imageUnit8List
          : imageUnit8List // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as html.File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminCategoryStateImplCopyWith<$Res>
    implements $AdminCategoryStateCopyWith<$Res> {
  factory _$$AdminCategoryStateImplCopyWith(_$AdminCategoryStateImpl value,
          $Res Function(_$AdminCategoryStateImpl) then) =
      __$$AdminCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryModel> categories,
      CategoryModel? categoryModel,
      Uint8List? imageUnit8List,
      html.File? imageFile});
}

/// @nodoc
class __$$AdminCategoryStateImplCopyWithImpl<$Res>
    extends _$AdminCategoryStateCopyWithImpl<$Res, _$AdminCategoryStateImpl>
    implements _$$AdminCategoryStateImplCopyWith<$Res> {
  __$$AdminCategoryStateImplCopyWithImpl(_$AdminCategoryStateImpl _value,
      $Res Function(_$AdminCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? categoryModel = freezed,
    Object? imageUnit8List = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$AdminCategoryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryModel: freezed == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      imageUnit8List: freezed == imageUnit8List
          ? _value.imageUnit8List
          : imageUnit8List // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as html.File?,
    ));
  }
}

/// @nodoc

class _$AdminCategoryStateImpl implements _AdminCategoryState {
  const _$AdminCategoryStateImpl(
      {this.isLoading = false,
      final List<CategoryModel> categories = const [],
      this.categoryModel,
      this.imageUnit8List,
      this.imageFile})
      : _categories = categories;

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final CategoryModel? categoryModel;
  @override
  final Uint8List? imageUnit8List;
  @override
  final html.File? imageFile;

  @override
  String toString() {
    return 'AdminCategoryState(isLoading: $isLoading, categories: $categories, categoryModel: $categoryModel, imageUnit8List: $imageUnit8List, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminCategoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.categoryModel, categoryModel) ||
                other.categoryModel == categoryModel) &&
            const DeepCollectionEquality()
                .equals(other.imageUnit8List, imageUnit8List) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      categoryModel,
      const DeepCollectionEquality().hash(imageUnit8List),
      imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminCategoryStateImplCopyWith<_$AdminCategoryStateImpl> get copyWith =>
      __$$AdminCategoryStateImplCopyWithImpl<_$AdminCategoryStateImpl>(
          this, _$identity);
}

abstract class _AdminCategoryState implements AdminCategoryState {
  const factory _AdminCategoryState(
      {final bool isLoading,
      final List<CategoryModel> categories,
      final CategoryModel? categoryModel,
      final Uint8List? imageUnit8List,
      final html.File? imageFile}) = _$AdminCategoryStateImpl;

  @override
  bool get isLoading;
  @override
  List<CategoryModel> get categories;
  @override
  CategoryModel? get categoryModel;
  @override
  Uint8List? get imageUnit8List;
  @override
  html.File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$AdminCategoryStateImplCopyWith<_$AdminCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
