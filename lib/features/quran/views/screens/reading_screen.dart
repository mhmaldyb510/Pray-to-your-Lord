import 'package:flutter/material.dart';
import 'package:quran_library/quran_library.dart';

class ReadingScreen extends StatefulWidget {
  final int index;
  const ReadingScreen({super.key, required this.index});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  void initState() {
    QuranLibrary().jumpToSurah(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const QuranLibraryScreen();
  }
}
