import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_miscellaneous/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final adBannerAsync = ref.watch(adBannerProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text('Misceláneos'),
                    actions: [
                      IconButton(
                        onPressed: () => context.push('/permissions'),
                        icon: Icon(Icons.settings),
                      ),
                    ],
                  ),
                  MainMenu(),
                ],
              ),
            ),
          ),

          adBannerAsync.when(
            data: (banner) => SizedBox(
              width: banner.size.width.toDouble(),
              height: banner.size.height.toDouble(),
              child: AdWidget(ad: banner),
            ),
            error: (error, stackTrace) => SizedBox(),
            loading: () => SizedBox(),
          ),
        ],
      ),
    );
  }
}
