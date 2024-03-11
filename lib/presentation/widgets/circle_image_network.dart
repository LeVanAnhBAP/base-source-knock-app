import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class CircleImageNetwork extends StatelessWidget {
  final String src;
  final double radius;

  const CircleImageNetwork({required this.src, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.primary.withOpacity(0.4), width: 1.0),
      ),
      child: ClipOval(
        child: Image.network(
          src,
          loadingBuilder: (context, child, loadingProgress){
            if(loadingProgress == null){
              return child;
            }
            return  SkeletonItem(
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    shape: BoxShape.circle, width: radius, height: radius),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return AssetGenImage(Assets.images.imgBuildingLogo.path).image(width: radius, height: radius);
          },
          width: radius,
          height: radius,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
