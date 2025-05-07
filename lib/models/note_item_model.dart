import 'dart:ui';
import 'package:hive/hive.dart';
import 'dart:io';
part 'note_item_model.g.dart';

@HiveType(typeId: 1)
class NoteItemModel extends HiveObject {


  @HiveField(0)
   String titleNote;
  @HiveField(1)
   String subTitleNote;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;


  NoteItemModel({
    required this.titleNote,
    required this.subTitleNote,
    required this.date,
    required this.color,
  });

}
