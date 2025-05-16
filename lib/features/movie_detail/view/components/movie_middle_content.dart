part of '../movie_detail_screen.dart';

class _MovieMiddleContent extends StatelessWidget {
  final DetailMovie detail;

  const _MovieMiddleContent({required this.detail});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            if (detail.tagline?.isNotEmpty ?? false)
              Expanded(
                child: Text(detail.tagline!, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12, color: Colors.white)),
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
