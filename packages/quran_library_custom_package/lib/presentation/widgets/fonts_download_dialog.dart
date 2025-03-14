part of '../../quran.dart';

class FontsDownloadDialog extends StatelessWidget {
  final DownloadFontsDialogStyle? downloadFontsDialogStyle;
  final String? languageCode;
  final bool isDark;

  FontsDownloadDialog(
      {super.key,
      this.downloadFontsDialogStyle,
      this.languageCode,
      this.isDark = false});

  final quranCtrl = QuranCtrl.instance;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: true),
      child: IconButton(
        onPressed: () => showDialog(
            context: context, builder: (ctx) => _fontsDownloadDialog(ctx)),
        icon: Stack(
          alignment: Alignment.center,
          children: [
            downloadFontsDialogStyle?.iconWidget ??
                Icon(
                  quranCtrl.state.isDownloadedV2Fonts.value
                      ? Icons.settings
                      : Icons.downloading_outlined,
                  size: 24,
                  color: isDark ? Colors.white : Colors.black,
                ),
            GetX<QuranCtrl>(
              builder: (quranCtrl) => CircularProgressIndicator(
                strokeWidth: 2,
                value: (quranCtrl.state.fontsDownloadProgress.value / 100),
                color: downloadFontsDialogStyle?.linearProgressColor,
                backgroundColor:
                    downloadFontsDialogStyle?.linearProgressBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fontsDownloadDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 3,
      backgroundColor: downloadFontsDialogStyle?.backgroundColor,
      child: quranCtrl.fontsDownloadWidget(context,
          downloadFontsDialogStyle: downloadFontsDialogStyle!,
          languageCode: languageCode,
          isDark: isDark),
    );
  }
}
