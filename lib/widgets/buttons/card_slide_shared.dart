import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';

class CardSlideShared extends ConsumerWidget {
  final ProviderListenable provider;
  final List<ImageProvider> images;
  final double? height;
  final double? width;

  const CardSlideShared({
    super.key,
    required this.provider,
    required this.images,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (images.isEmpty) {
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child: Image(image: Assets.images.bgLogin.provider()),
        ),
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        final loginCardStateNotifier = ref.watch(provider);
        return _getCard(loginCardStateNotifier.value);
      },
    );
  }

  Widget _getCard(int? loginCardStateNotifier) {
    if (loginCardStateNotifier != null && loginCardStateNotifier < images.length) {
      return _loginCardView(images[loginCardStateNotifier]);
    } else {
      return _loginCardView(images.first);
    }
  }

  Widget _loginCardView(ImageProvider imageProvider) {
    return Center(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child: Image(image: imageProvider),
        ),
      ),
    );
  }
}
