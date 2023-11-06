import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../core/controllers/note_controller.dart';
import '../../ui/pages/add_note_page.dart';
import '../../ui/styles/colors.dart';
import '../../ui/widgets/note_tile.dart';

class NoteHomePage extends StatefulWidget {
  const NoteHomePage({super.key});

  @override
  State<NoteHomePage> createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  final _notesController = Get.put(NoteController());

  final _tileCounts = [
    [2, 2],
    [2, 2],
    [4, 2],
    [2, 3],
    [2, 2],
    [2, 3],
    [2, 2],
  ];

  final _tileTypes = [
    TileType.Square,
    TileType.Square,
    TileType.HorRect,
    TileType.VerRect,
    TileType.Square,
    TileType.VerRect,
    TileType.Square,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 12, 78, 245),
          onPressed: () {
            Get.to(
              () => const AddNotePage(
                note: null,
              ),
              transition: Transition.downToUp,
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            const SizedBox(
              height: 16,
            ),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "MY NOTES",
            style: TextStyle(
              fontFamily: 'MontserratBold',
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Icon(Icons.search, color: Colors.black)
        ],
      ),
    );
  }

  _body() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (_notesController.noteList.isNotEmpty) {
          return StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              axisDirection: AxisDirection.down,
              children: [
                for (int i = 0; i < _notesController.noteList.length; i++)
                  StaggeredGridTile.count(
                      crossAxisCellCount: _tileCounts[i % 7][0],
                      mainAxisCellCount: _tileCounts[i % 7][1],
                      child: NoteTile(
                        index: i,
                        note: _notesController.noteList[i],
                        tileType: _tileTypes[i % 7],
                      ))
              ]);
          // itemCount: _notesController.noteList.length,
          // itemBuilder: (context, index)
          // {
          //   return NoteTile(
          //     tileType: _tileTypes[index % 7],
          //     note: _notesController.noteList[index],
          //   );
          // },
          // StaggeredGridTileBuilder: (int index) => _tileCounts[index % 7]);

          // return StaggeredGridView.count(
          //   crossAxisCount: 4,
          //   StaggeredGridTiles: _StaggeredGridTiles,
          //   mainAxisSpacing: 12,
          //   crossAxisSpacing: 12,
          //   children: _notesController.noteList
          //       .map((n) => NoteTile(
          //             note: n,
          //           ))
          //       .toList(),
          // );

          // ListView.builder(
          //     itemCount: _notesController.noteList.length,
          //     itemBuilder: (context, index) {
          //       return NoteTile(
          //         note: _notesController.noteList[index],
          //       );
          //     });
        } else {
          return const Center(
            child: Text("Empty",
                style: TextStyle(color: Colors.black, fontSize: 24)),
          );
        }
      }),
    ));
  }
}
