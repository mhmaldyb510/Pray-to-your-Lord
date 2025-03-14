part of '../../quran.dart';

class BasmallahWidget extends StatelessWidget {
  const BasmallahWidget({
    super.key,
    required this.surahNumber,
    this.basmalaStyle,
  });

  final int surahNumber;
  final BasmalaStyle? basmalaStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        surahNumber == 95 || surahNumber == 97
            ? AssetsPath().besmAllah2
            : AssetsPath().besmAllah,
        width: basmalaStyle?.basmalaWidth ?? 150,
        height: basmalaStyle?.basmalaHeight ?? 40,
        colorFilter: ColorFilter.mode(
            basmalaStyle?.basmalaColor ?? Colors.black, BlendMode.srcIn),
      ),
    );
  }
}
