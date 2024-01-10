import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/utils/utils.dart';

class SiteItem extends StatelessWidget {
  final SiteResponse site;
  final int companyType;
  const SiteItem({super.key, required this.site, required this.companyType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(children: [_buildHeader(context), _buildBody(context)]),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          color: context.colors.tertiary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                SvgPicture.asset(
                  Utils.siteStatusToIconPath(site.status),
                  width: 18,
                ),
                Text(
                  Utils.siteStatusToString(context,site.status, companyType),
                  style: TextStyle(
                      color: Utils.siteStatusToColor(site.status, context),
                      fontSize: 6),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Text(
              "${site.firstName} ${site.lastName}",
              style: TextStyle(
                  color: context.colors.primary,
                  fontSize: 9,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                site.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: context.colors.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.svg.icLocation.path,
                    height: 13,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      site.address ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: context.colors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.svg.icCalendar.path,
                      height: 13),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${site.startDayRequest} ~ ${site.endDayRequest}",
                    style: TextStyle(
                        color: context.colors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ]),
          ),
          Row(
            children: [
              const SizedBox(width: 5),
              CircleAvatar(
                radius: 12,
                backgroundImage: Image.network(site.companyLogo).image,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                site.companyNameKana,
                style: TextStyle(
                    color: context.colors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ]),
        Positioned(
          right: 15,
          top: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                color: context.colors.tertiary, shape: BoxShape.circle),
            child: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}
