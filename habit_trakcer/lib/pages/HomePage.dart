import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_trakcer/componets/showDailogue.dart';
import 'package:habit_trakcer/componets/floatingAction.dart';
import 'package:habit_trakcer/componets/habittile.dart';
import 'package:habit_trakcer/data/habit_dataBase.dart';
import 'package:hive_flutter/adapters.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HabitdataBase db = HabitdataBase();
  final TextEditingController controller = TextEditingController();
  final _mybox = Hive.box('Habit_DataBase');

  bool ischange = false;

  @override
  void initState() {
    super.initState();
    if (_mybox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }
    db.updateDatbase();
  }

  void onChangeValue(bool? bool, int index) {
    setState(() {
      db.totalHabitList[index][1] = bool!;
    });
    db.updateDatbase();
  }

  void onSave() {
    db.totalHabitList.add([controller.text, false]);
    controller.clear();
    Navigator.pop(context);

    setState(() {});
    db.updateDatbase();
    print(db.totalHabitList);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return Showdailogue(
          hitText: 'Enter your habit',
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
          hitText: db.totalHabitList[index][0],
          onCancel: onCancel,
          onSaved: () => onEditSave(index),
          controller: controller,
        );
      },
    );
  }

  void onEditSave(int index) {
    db.totalHabitList[index][0] = controller.text;
    Navigator.pop(context);
    controller.clear();
    db.updateDatbase();
    setState(() {});
  }

  void delete(int position) {
    db.totalHabitList.removeAt(position);
    db.updateDatbase();
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
        itemCount: db.totalHabitList.length,
        itemBuilder: (context, index) {
          return Habittile(
            onDelete: (position) => delete(index),
            onEdit: (p0) => perfectEdit(index),
            ischecked: db.totalHabitList[index][1],
            name: db.totalHabitList[index][0],
            onChanged: (p0) {
              onChangeValue(p0, index);
            },
          );
        },
      )),
    );
  }
}
