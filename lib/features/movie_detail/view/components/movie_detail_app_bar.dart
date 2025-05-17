part of '../movie_detail_screen.dart';

class _MovieDetailAppBar extends StatelessWidget {
  final String? backdropPath;
  final String? title;

  const _MovieDetailAppBar({this.backdropPath, this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title ?? '', style: AppTextTheme.headline.copyWith(color: Colors.white), textAlign: TextAlign.center),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w780${backdropPath ?? ''}',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
