import 'package:flutter/material.dart';
import '../../view_model/exercies_store.dart';
import '../utils/app_colors.dart';
import '../utils/custom_text_style.dart';

class ExerciesBox extends StatelessWidget {
  const ExerciesBox({
    Key? key,
    required ExerciesView exerciesView,
    required this.index,
  })  : _exerciesView = exerciesView,
        super(key: key);

  final ExerciesView _exerciesView;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _typeTag(),
          _muscleInfo(),
        ],
      ),
    );
  }

  Text _title() {
    return Text(
      _exerciesView.exerciesList[index].name,
      style: CustomTextStyle.titleTextStyle,
    );
  }

  Padding _muscleInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        _exerciesView.exerciesList[index].muscle.name.toLowerCase(),
        style: CustomTextStyle.titleTextStyle,
      ),
    );
  }

  Container _typeTag() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightGrey,
      ),
      child: Text(
        _exerciesView.exerciesList[index].type.name.toLowerCase(),
        style: CustomTextStyle.tagTextStyle,
      ),
    );
  }
}
