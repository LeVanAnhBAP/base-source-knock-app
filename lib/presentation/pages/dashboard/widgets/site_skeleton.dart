import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

class SiteSkeletion extends StatelessWidget {
  const SiteSkeletion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: context.colors.tertiary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ),
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SkeletonItem(
                child: Column(
              children: [
            
                SkeletonLine(
                  style: SkeletonLineStyle(
                    borderRadius: BorderRadius.circular(15),
                    height: 20,
                    minLength: MediaQuery.of(context).size.width / 2,
                    maxLength: MediaQuery.of(context).size.width * 0.6,
                    randomLength: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 SkeletonLine(
                  style: SkeletonLineStyle(
                    borderRadius: BorderRadius.circular(15),
                    height: 15,
                    width: 150,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 SkeletonLine(
                  style: SkeletonLineStyle(
                    borderRadius: BorderRadius.circular(15),
                    height: 15,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 SkeletonLine(
                  style: SkeletonLineStyle(
                    borderRadius: BorderRadius.circular(15),
                    height: 15,
                    width: 120,
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
