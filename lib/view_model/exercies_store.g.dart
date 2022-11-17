// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExerciesView on _ExerciesViewBase, Store {
  late final _$exerciesListAtom =
      Atom(name: '_ExerciesViewBase.exerciesList', context: context);

  @override
  List<ExerciesModel> get exerciesList {
    _$exerciesListAtom.reportRead();
    return super.exerciesList;
  }

  @override
  set exerciesList(List<ExerciesModel> value) {
    _$exerciesListAtom.reportWrite(value, super.exerciesList, () {
      super.exerciesList = value;
    });
  }

  late final _$textFieldValueAtom =
      Atom(name: '_ExerciesViewBase.textFieldValue', context: context);

  @override
  String get textFieldValue {
    _$textFieldValueAtom.reportRead();
    return super.textFieldValue;
  }

  @override
  set textFieldValue(String value) {
    _$textFieldValueAtom.reportWrite(value, super.textFieldValue, () {
      super.textFieldValue = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ExerciesViewBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$typeAtom =
      Atom(name: '_ExerciesViewBase.type', context: context);

  @override
  Type? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(Type? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$muscleAtom =
      Atom(name: '_ExerciesViewBase.muscle', context: context);

  @override
  Muscle? get muscle {
    _$muscleAtom.reportRead();
    return super.muscle;
  }

  @override
  set muscle(Muscle? value) {
    _$muscleAtom.reportWrite(value, super.muscle, () {
      super.muscle = value;
    });
  }

  late final _$clearSelectionAsyncAction =
      AsyncAction('_ExerciesViewBase.clearSelection', context: context);

  @override
  Future<void> clearSelection() {
    return _$clearSelectionAsyncAction.run(() => super.clearSelection());
  }

  late final _$applyFilterAsyncAction =
      AsyncAction('_ExerciesViewBase.applyFilter', context: context);

  @override
  Future<void> applyFilter() {
    return _$applyFilterAsyncAction.run(() => super.applyFilter());
  }

  late final _$clearSearchValueAsyncAction =
      AsyncAction('_ExerciesViewBase.clearSearchValue', context: context);

  @override
  Future<void> clearSearchValue(BuildContext context) {
    return _$clearSearchValueAsyncAction
        .run(() => super.clearSearchValue(context));
  }

  late final _$_fetchExerciesAsyncAction =
      AsyncAction('_ExerciesViewBase._fetchExercies', context: context);

  @override
  Future<void> _fetchExercies() {
    return _$_fetchExerciesAsyncAction.run(() => super._fetchExercies());
  }

  late final _$searchNameAsyncAction =
      AsyncAction('_ExerciesViewBase.searchName', context: context);

  @override
  Future<void> searchName() {
    return _$searchNameAsyncAction.run(() => super.searchName());
  }

  late final _$_ExerciesViewBaseActionController =
      ActionController(name: '_ExerciesViewBase', context: context);

  @override
  void initPage() {
    final _$actionInfo = _$_ExerciesViewBaseActionController.startAction(
        name: '_ExerciesViewBase.initPage');
    try {
      return super.initPage();
    } finally {
      _$_ExerciesViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposepage() {
    final _$actionInfo = _$_ExerciesViewBaseActionController.startAction(
        name: '_ExerciesViewBase.disposepage');
    try {
      return super.disposepage();
    } finally {
      _$_ExerciesViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectType(int index) {
    final _$actionInfo = _$_ExerciesViewBaseActionController.startAction(
        name: '_ExerciesViewBase.selectType');
    try {
      return super.selectType(index);
    } finally {
      _$_ExerciesViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectMuscle(int index) {
    final _$actionInfo = _$_ExerciesViewBaseActionController.startAction(
        name: '_ExerciesViewBase.selectMuscle');
    try {
      return super.selectMuscle(index);
    } finally {
      _$_ExerciesViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeDrawer() {
    final _$actionInfo = _$_ExerciesViewBaseActionController.startAction(
        name: '_ExerciesViewBase.closeDrawer');
    try {
      return super.closeDrawer();
    } finally {
      _$_ExerciesViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openDrawer() {
    final _$actionInfo = _$_ExerciesViewBaseActionController.startAction(
        name: '_ExerciesViewBase.openDrawer');
    try {
      return super.openDrawer();
    } finally {
      _$_ExerciesViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exerciesList: ${exerciesList},
textFieldValue: ${textFieldValue},
isLoading: ${isLoading},
type: ${type},
muscle: ${muscle}
    ''';
  }
}
