part of '../movie_detail_screen.dart';

class _MovieMiddleContent extends StatelessWidget {
  final DetailMovie detail;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;

  const _MovieMiddleContent({required this.detail, required this.onFavoritePressed, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (detail.posterPath != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    AppConstants.imageFullPath(detail.posterPath!, size: AppConstants.imageW342),
                    height: 220,
                    errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
                  ),
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  if (detail.tagline?.isNotEmpty ?? false) ...[
                    Text(detail.tagline!, style: AppTextTheme.bodySmall.copyWith(color: Colors.white70, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 8),
                  ],

                  ElevatedButton.icon(
                    onPressed: onFavoritePressed,
                    label: Text(isFavorite ? 'Un-favorite' : 'Favorite', style: AppTextTheme.bodySmall.copyWith(color: Colors.white70)),
                    icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.white70),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                      shadowColor: Colors.transparent,
                      side: const BorderSide(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
