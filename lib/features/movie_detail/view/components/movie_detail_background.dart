part of '../movie_detail_screen.dart';

class _MovieDetailBackground extends StatelessWidget {
  final String? backdropPath;

  const _MovieDetailBackground({this.backdropPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: double.infinity,
          child: CachedNetworkImage(
            imageUrl: AppConstants.imageFullPath(backdropPath ?? '', size: AppConstants.imageW780),
            fit: BoxFit.cover,
          ),
        ),
        const DecoratedBox(decoration: BoxDecoration(color: Colors.black87)),
      ],
    );
  }
}
