import 'dart:developer';

import 'package:get/get.dart';
import '../../core/db/db_helper.dart';
import '../../core/models/note_model.dart';

class NoteController extends GetxController {
  final noteList = [].obs;

  @override
  void onReady() {
    getNotes();
    super.onReady();
  }

  Future<void> addNote({required Note note}) async {
    try {
      await DBHelper.insert(note);
    } catch (e) {
      log('Exception (notController): $e');
    }
    getNotes();
  }

  Future<void> getNotes() async {
    List<Map<String, dynamic>> notes = await DBHelper.query();
    noteList.assignAll(notes.map((data) => Note.fromJson(data)).toList());
  }

  Future<void> deleteNote({required Note note}) async {
    await DBHelper.delete(note);
    getNotes();
  }

  Future<void> updateNote({required Note note}) async {
    await DBHelper.update(note);
    getNotes();
  }
}
