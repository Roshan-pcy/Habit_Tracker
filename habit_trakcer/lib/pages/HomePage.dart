import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_trakcer/componets/showDailogue.dart';
import 'package:habit_trakcer/componets/floatingAction.dart';
import 'package:habit_trakcer/componets/habittile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  bool ischange = false;
  List listData = [
    ['moringname', true],
    ['moring', true],
    ['mori', false]
  ];
  void onChangeValue(bool? bool, int index) {
    setState(() {
      listData[index][1] = bool!;
    });
  }

  void onSave() {
    listData.add([controller.text, false]);
    controller.clear();
    Navigator.pop(context);

    setState(() {});
    print(listData);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return Showdailogue(
          onCancel: onCancel,
          onSaved: onSave,
          controller: controller,
        );
      },
    );
  }

  void perfectEdit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Showdailogue(
          onCancel: onCancel,
          onSaved: () => onEditSave(index),
          controller: controller,
        );
      },
    );
  }

  void onEditSave(int index) {
    listData[index][0] = controller.text;
    Navigator.pop(context);
    controller.clear();
    setState(() {});
  }

  void delete(int position) {
    listData.removeAt(position);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Floatingaction(
        onPressed: createNewHabit,
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Habittile(
            onDelete: (position) => delete(index),
            onEdit: (p0) => perfectEdit(index),
            ischecked: listData[index][1],
            name: listData[index][0],
            onChanged: (p0) {
              onChangeValue(p0, index);
            },
          );
        },
      )),
    );
  }
}
