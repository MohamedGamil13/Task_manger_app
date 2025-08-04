import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_manger_app/firebase_options.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/models/note_model.dart';
import 'package:task_manger_app/pages/task_manger_app.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(KnoteBoxName);
  runApp(const TaskMangerApp());
}
