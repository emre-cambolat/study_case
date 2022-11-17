import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:study_case/model/exercies.dart';

import '../../view_model/exercies_store.dart';
import '../utils/app_colors.dart';
import '../utils/custom_text_style.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
    required ExerciesView exerciesView,
  })  : _exerciesView = exerciesView,
        super(key: key);

  final ExerciesView _exerciesView;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Filter",
                        style: CustomTextStyle.titleTextStyle,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "Clear Selection",
                      ),
                      onPressed: _exerciesView.clearSelection,
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.darkGrey,
                ),
                _itemList(isType: true),
                Divider(),
                _itemList(isType: false),
              ],
            ),
          ),
          Spacer(),
          _filterInfo(),
          _applyButton(),
        ],
      ),
    );
  }

  InkWell _applyButton() {
    return InkWell(
      onTap: _exerciesView.applyFilter,
      child: Container(
        width: double.infinity,
        color: AppColors.lightGrey,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        alignment: Alignment.center,
        child: Text(
          "Apply",
          style: CustomTextStyle.titleTextStyle,
        ),
      ),
    );
  }

  Padding _filterInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: SizedBox(
        width: double.infinity,
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _exerciesView.type == null
                  ? SizedBox.shrink()
                  : Text(
                      "Selected Type: " +
                          _exerciesView.type!.name.toLowerCase(),
                    ),
              _exerciesView.muscle == null
                  ? SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Selected Muscle: " +
                            _exerciesView.muscle!.name.toLowerCase(),
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }

  Widget _itemList({
    required bool isType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isType ? "Type" : "Muscle",
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: isType ? Type.values.length : Muscle.values.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 8,
                ),
                child: InkWell(
                  onTap: () {
                    isType
                        ? _exerciesView.selectType(index)
                        : _exerciesView.selectMuscle(index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isType
                          ? Type.values[index].name.toLowerCase()
                          : Muscle.values[index].name.toLowerCase(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
