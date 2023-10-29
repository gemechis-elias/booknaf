import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/controllers/note_controller.dart';
import '../../core/models/note_model.dart';
import 'note_page.dart';
import '../../ui/styles/colors.dart';
import '../../ui/styles/text_styles.dart';
import '../../ui/widgets/icon_button.dart';

class AddNotePage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNotePage({super.key, this.isUpdate = false, this.note});

  @override
  AddNotePageState createState() => AddNotePageState();
}

class AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _noteTextController = TextEditingController();
  final NoteController _noteController = Get.find<NoteController>();
  final DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleTextController.text = widget.note!.title;
      _noteTextController.text = widget.note!.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
          MyIconButton(
            onTap: () {
              _validateInput();
            },
            txt: widget.isUpdate ? "Update" : "Save",
          ),
        ],
      ),
    );
  }

  _body() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleTextController,
            style: titleTextStyle,
            cursorColor: Colors.black,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: "Title",
              hintStyle: titleTextStyle.copyWith(
                  color: const Color.fromARGB(255, 94, 94, 94), fontSize: 18),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _noteTextController,
            style: const TextStyle(
                color: Color.fromARGB(255, 97, 97, 97), fontSize: 16),
            cursorColor: Colors.black,
            minLines: 3,
            maxLines: 12,
            decoration: InputDecoration(
              hintText: "Type something...",
              hintStyle: titleTextStyle.copyWith(
                  color: const Color.fromARGB(255, 97, 97, 97), fontSize: 16),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validateInput() async {
    bool isNotEmpty = _titleTextController.text.isNotEmpty &&
        _noteTextController.text.isNotEmpty;
    if (isNotEmpty && !widget.isUpdate) {
      _addNoteToDB();
      Get.back();
    } else if (widget.isUpdate &&
            _titleTextController.text != widget.note!.title ||
        _noteTextController.text != widget.note!.text) {
      _updateNote();
      Get.offAll(() => const NoteHomePage());
    } else {
      Get.snackbar(
        widget.isUpdate ? "Not Updated" : "Required*",
        widget.isUpdate
            ? "Fields are not updated yet."
            : "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  _addNoteToDB() async {
    await _noteController.addNote(
      note: Note(
        text: _noteTextController.text,
        title: _titleTextController.text,
        date: DateFormat.yMMMd().format(_currentDate).toString(),
      ),
    );
  }

  _updateNote() async {
    await _noteController.updateNote(
      note: Note(
        id: widget.note!.id,
        text: _noteTextController.text,
        title: _titleTextController.text,
        date: DateFormat.yMMMd().format(_currentDate).toString(),
      ),
    );
  }
}
