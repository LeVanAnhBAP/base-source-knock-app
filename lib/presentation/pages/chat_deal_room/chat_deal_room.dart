import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/chat_deal_room/chat_deal_room_bloc.dart';
import 'package:uq_system_app/presentation/pages/chat_deal_room/widgets/chat_item.dart';
import 'package:uq_system_app/presentation/pages/chat_deal_room/widgets/menu_popup.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/divider_line.dart';
import 'package:uq_system_app/presentation/widgets/expanded_animation_widget.dart';

@RoutePage()
class ChatDealRoomPage extends StatefulWidget {
  @override
  State<ChatDealRoomPage> createState() => _ChatDealRoomPageState();
}

class _ChatDealRoomPageState extends State<ChatDealRoomPage> {
  final ChatDealRoomBloc _bloc = getIt.get<ChatDealRoomBloc>();
  final ValueNotifier<bool> isShowBottomPopup =
  ValueNotifier(false);
  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          customTitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AssetGenImage(Assets.images.imgBuildingLogo.path)
                  .image(width: 30),
              const SizedBox(
                width: 10,
              ),
              Text(
                "(株)職人インテリア",
                style: context.typographies.subBodyBold1,
              )
            ],
          ),
          rightIcPath: Assets.icons.svg.icMoreHorizontal.path,
          onRightPress: (){
            _displayMenuPopup();
          },
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 1,
            ),
            Container(
              color: const Color(0xFFF7F8FA),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: context.colors.quaternary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        AssetGenImage(Assets.icons.png.icPhone.path)
                            .image(width: 20),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "電話する",
                          style: context.typographies.subBody1
                              .withColor(Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: context.colors.tertiary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        AssetGenImage(Assets.icons.png.icPdf.path)
                            .image(width: 20),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "工事下請基本契約書",
                          style: context.typographies.subBody1
                              .withColor(Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: _buildBody()),
            _buildBottom()
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      physics: const  ClampingScrollPhysics(),
      itemCount: 4,
      reverse: true,
      shrinkWrap: true,
      itemBuilder: (context, index) => ChatItem(),
    );
  }

  Widget _buildBottom() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 15,bottom: 15, right: 10),
          child: Row(
            children: [
              ValueListenableBuilder(
                valueListenable: isShowBottomPopup,
                builder: (BuildContext context, bool value, Widget? child) {
                  return InkWell(
                    onTap: (){
                      isShowBottomPopup.value = !isShowBottomPopup.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        value ? Assets.icons.svg.icArrowUp.path : Assets.icons.svg.icArrowDown.path,
                        width: 20,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        width: 1, color: context.colors.primary.withOpacity(0.3))),
                child: TextField(
                  maxLines: 10,
                  minLines: 1,
                  style: context.typographies.subBody2,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    hintText: "メッセージを入力",
                    hintStyle: context.typographies.subBody3
                        .withColor(context.colors.primary),
                  ),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                Assets.icons.svg.icSendMessage.path,
                width: 20,
              ),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isShowBottomPopup,
          builder: (BuildContext context, bool value, Widget? child) {
            return ExpandedSection(
              expand: isShowBottomPopup.value,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const DividerLine(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(Assets.icons.svg.icAttachFile.path),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("添付", style: context.typographies.subBody3,)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
  Future _displayMenuPopup() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))
      ),
      context: context,
      builder: (context) => MenuPopup(),
    );
  }
}
