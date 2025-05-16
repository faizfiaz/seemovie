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
              children: [
                if (detail.releaseDate != null)
                  Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    label: Text(DateFormat.yMMMd().format(detail.releaseDate!), style: AppTextTheme.caption),
                    avatar: const Icon(Icons.calendar_today, size: 12),
                  ),
                if (detail.originalLanguage != null)
                  Chip(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text('Lang: ${detail.originalLanguage?.toUpperCase()}', style: AppTextTheme.caption),
                    avatar: const Icon(Icons.language, size: 12),
                  ),
                if (detail.status != null)
                  Chip(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text(detail.status!, style: AppTextTheme.caption),
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
                  Text('Overview', style: AppTextTheme.headline.copyWith(color: Colors.white)),
                  const SizedBox(height: 8),
                  Text(detail.overview!, style: AppTextTheme.bodySmall.copyWith(color: Colors.white70)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
