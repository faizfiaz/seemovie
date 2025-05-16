part of '../movie_detail_screen.dart';

class _MovieContentInfo extends StatelessWidget {
  final DetailMovie detail;

  const _MovieContentInfo({required this.detail});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Wrap(
              spacing: 12,
              // runSpacing: 8,
              children: [
                if (detail.releaseDate != null)
                  Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    label: Text(DateFormat.yMMMd().format(detail.releaseDate!), style: const TextStyle(fontSize: 12, color: Colors.black)),
                    avatar: const Icon(Icons.calendar_today, size: 12),
                  ),
                if (detail.originalLanguage != null)
                  Chip(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text(
                      'Lang: ${detail.originalLanguage?.toUpperCase()}',
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    avatar: const Icon(Icons.language, size: 12),
                  ),
                if (detail.status != null)
                  Chip(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text(detail.status!, style: const TextStyle(fontSize: 12, color: Colors.black)),
                    avatar: const Icon(Icons.info, size: 12),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            // Overview
            if (detail.overview?.isNotEmpty ?? false)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text(detail.overview!, style: const TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
