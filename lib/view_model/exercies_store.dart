import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../model/exercies.dart';
import '../services/api_services.dart';
import '../view/utils/debounder.dart';
part 'exercies_store.g.dart';

class ExerciesView = _ExerciesViewBase with _$ExerciesView;

// @computed
// @action
// @observerable
abstract class _ExerciesViewBase with Store {
  @observable
  List<ExerciesModel> exerciesList = [];
  @observable
  String textFieldValue = '';
  late TextEditingController tfSearch;
  @observable
  bool isLoading = true;
  final Debouncer onSearchDebouncer = Debouncer();
  @observable
  Type? type;
  @observable
  Muscle? muscle;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @action
  void initPage() {
    tfSearch = TextEditingController();
    ApiServices.fetchExercies(name: '').then(
      (value) {
        exerciesList = value;
        isLoading = false;
      },
    );
  }

  @action
  void disposepage() {
    tfSearch.dispose();
  }

  @action
  Future<void> clearSelection() async {
    type = null;
    muscle = null;
  }

  @action
  void selectType(int index) {
    type = Type.values[index];
  }

  @action
  void selectMuscle(int index) {
    muscle = Muscle.values[index];
  }

  @action
  Future<void> applyFilter() async {
    scaffoldKey.currentState!.closeEndDrawer();
    isLoading = true;
    exerciesList = await ApiServices.fetchExercies(
      name: tfSearch.text,
      type: type == null ? '' : type!.name.toLowerCase(),
      muscle: muscle == null ? '' : muscle!.name.toLowerCase(),
    );
    isLoading = false;
  }

  @action
  Future<void> clearSearchValue(BuildContext context) async {
    tfSearch.clear();
    textFieldValue = '';
    FocusScope.of(context).unfocus();

    await _fetchExercies();
  }

  @action
  Future<void> _fetchExercies() async {
    isLoading = true;
    exerciesList = await ApiServices.fetchExercies(
      name: tfSearch.text,
      type: type == null ? '' : type!.name.toLowerCase(),
      muscle: muscle == null ? '' : muscle!.name.toLowerCase(),
    );
    isLoading = false;
  }

  @action
  Future<void> searchName() async {
    textFieldValue = tfSearch.text;
    onSearchDebouncer.debounce(() async {
      await _fetchExercies();
    });
  }

  @action
  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  @action
  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
