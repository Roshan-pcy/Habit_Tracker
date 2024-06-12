import 'package:habit_trakcer/dateTime/dateTime.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _box = Hive.box('Habit_DataBase');

class HabitdataBase {
  List totalHabitList = [];

  //create a initail state
  void createDefaultData() {
    totalHabitList = [
      ["Yoga", false],
      ["Run", false]
    ];
    _box.put('START_DAY', totdaysDateFormatted());
  }

  //load data if  it already  exit
  void loadData() {
    //if it is a new day get habit list from database
    if (_box.get(totdaysDateFormatted()) == null) {
      totalHabitList = _box.get("CURRENT_HABIT_LIST");
      for (int i = 0; i < totalHabitList.length; i++) {
        totalHabitList[i][1] = false;
      }
    } else {
      totalHabitList = _box.get(totdaysDateFormatted());
    }
  }

  // update database
  void updateDatbase() {
    _box.put(totdaysDateFormatted(), totalHabitList);
    _box.put('CURRENT_HABIT_LIST', totalHabitList);
  }
}
