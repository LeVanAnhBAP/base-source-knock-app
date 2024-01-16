import 'dart:io';

import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_event.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_selector.dart';
import 'package:uq_system_app/presentation/widgets/info_item.dart';


import '../../../blocs/auth/auth_state.dart';

@RoutePage()
class DashboardAccountPage extends StatefulWidget {
  @override
  State<DashboardAccountPage> createState() => _DashboardAccountPageState();
}

class _DashboardAccountPageState extends State<DashboardAccountPage>
    with SingleTickerProviderStateMixin {
  final AuthBloc _bloc = getIt.get<AuthBloc>();
  final ScrollController scrollController = ScrollController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  late Account account;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    account = _bloc.state.account!;
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _onRefresh() {
    _bloc.add(const AuthLoadAccount());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AuthListener(
          listener: (BuildContext context, AuthState state) {
            if (state.authStatus == AuthStatus.failure ||
                state.authStatus == AuthStatus.success) {
              if (_refreshController.isRefresh) {
                _refreshController.refreshCompleted();
              }
              setState(() {
                account = state.account!;
              });
            }
          },
          child: SmartRefresher(
            header: MaterialClassicHeader(
              color: context.colors.secondary,
              offset: 30,
            ),
            enablePullUp: false,
            onRefresh: _onRefresh,
            controller: _refreshController,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  collapsedHeight: 66,
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: false,
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    titlePadding: EdgeInsets.zero,
                    title: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE4E4E4),
                                borderRadius: BorderRadius.circular(20)),
                            height: 35,
                            child: TabBar(
                              controller: controller,
                              indicatorPadding: const EdgeInsets.all(5),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                  color: const Color(0xFF4A4B4F),
                                  borderRadius: BorderRadius.circular(15)),
                              dividerColor: Colors.transparent,
                              labelStyle: context.typographies.subBodyBold1
                                  .withColor(Colors.white),
                              unselectedLabelStyle: context
                                  .typographies.subBodyBold1
                                  .withColor(const Color(0xFF868686)),
                              tabs: [
                                Tab(
                                  text: context.tr(
                                      LocaleKeys.Profile_PersonalInformation),
                                ),
                                Tab(
                                  text: context.tr(LocaleKeys.Profile_AboutUs),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: context.colors.divider,
                          )
                        ],
                      ),
                    ),
                    background: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.tr(LocaleKeys.Dashboard_Profile),
                                style: context.typographies.title2
                                    .withWeight(FontWeight.w300),
                              ),
                              Container(
                                width: 70,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: context.colors.secondary,
                                    borderRadius: BorderRadius.circular(5)),
                              )
                            ],
                          ),
                        ),
                        _buildImage(),
                      ],
                    ),
                  ),
                  // flexibleSpace: _buildImage(),
                ),
                SliverToBoxAdapter(
                  child: AutoScaleTabBarView(
                      controller: controller,
                      children: [_buildUserInfo(), _buildCompanyInfo()]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
        color: Colors.grey,
        height: 250,
        child: Stack(
          children: [
            Image.network(

              account.company.background?.url ?? "",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,

              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey,
                );
              },
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 10,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blue,
                            backgroundImage: Image.network(
                              account.avatar?.url ?? "",
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                _onShowUpdateImageOptions();
                              },
                              child:
                                  AssetGenImage(Assets.icons.png.icCamera.path)
                                      .image(width: 35),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 20,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                )),
            Positioned(
                bottom: 45,
                right: 15,
                child: AssetGenImage(Assets.icons.png.icCamera.path)
                    .image(width: 35)),
          ],
        ));
  }

  Widget _buildUserInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoItem(
                title: context.tr(LocaleKeys.Profile_FullName),
                content: "${account.firstName} ${account.lastName}"),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_Furigana),
                content: "${account.firstNameKana} ${account.lastNameKana}"),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_DateOfBirth),
                content: account.dateOfBirth ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_Age),
                content: account.dateOfBirth ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_tel),
                content: account.telNumber ?? ''),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_Email),
                content: account.email ?? ''),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_LoginID),
                content: account.email ?? ''),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_Password),
                content: account.passwordReadable ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoItem(
                title: context.tr(LocaleKeys.Profile_CompanyNameTradeName),
                content: account.company.name),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_Furigana),
                content: account.company.furigana),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_InvoiceNumber),
                content: account.company.invoiceNumber),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_PostCode),
                content: account.company.postalCode),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_Address),
                content: account.company.locationMunicipality ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_AddressBelow),
                content: account.company.locationBelow ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_BuildingNameEtc),
                content: account.company.building ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_RepresentativeTel),
                content: account.company.telNumber),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_HPURL),
                content: account.company.hpUrl),
            const SizedBox(
              height: 25,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Title
                  Text(
                    context.tr(LocaleKeys.Profile_QualificationsHeld),
                    style: context.typographies.subBodyBold1,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.54,
                    child: Text(
                      "AAA,BBB,CCC",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.typographies.subBody1,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Title
                  Text(
                    context.tr(LocaleKeys.Profile_CompatibleArea),
                    style: context.typographies.subBodyBold1,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.54,
                    child: Text(
                      "東京都,神奈川県,埼玉県,千葉県,群馬県…",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.typographies.subBody1,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Title
                  Text(
                    context.tr(LocaleKeys.Profile_Occupation),
                    style: context.typographies.subBodyBold1,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.54,
                    child: Text(
                      "インテリア工事,天井仕上げ工事,クロス工事…",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.typographies.subBody1,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            InfoItem(
                title:
                    context.tr(LocaleKeys.Profile_WorkerCompensationInsurance),
                content: "加入している"),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_SocialInsurance),
                content: "加入している"),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_OtherInsurance),
                content: "PL保険"),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Title
                  Text(
                    context.tr(LocaleKeys
                        .Profile_ConstructionBusinessPermitCertificate),
                    style: context.typographies.subBodyBold1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "なし",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.typographies.subBody1,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Title
                  Text(
                    context.tr(LocaleKeys.Profile_CertificateOfAllHistoryItems),
                    style: context.typographies.subBodyBold1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "なし",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.typographies.subBody1,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_AWordOfIntroduction),
                content: account.company.intro ?? ""),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_SelfIntroduction),
                content: account.company.selfIntro ?? ""),
            const SizedBox(
              height: 40,
            ),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_NumberOfPeopleWhoCanWork),
                content: "3人"),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.tr(LocaleKeys.Profile_AccountingPeriod),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      context.tr(LocaleKeys.Profile_StartDate),
                      style: context.typographies.subBodyBold1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(LocaleKeys.Profile_EndDate),
                      style: context.typographies.subBodyBold1,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Text(
                      "8月1日",
                      style: context.typographies.subBody1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "7月30日",
                      style: context.typographies.subBody1,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_ClosingDate),
                content: "月末日"),
            InfoItem(
                title: context.tr(LocaleKeys.Profile_DateOfPayment),
                content: "1ヶ月後の月末日"),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              color: context.colors.divider,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.tr(LocaleKeys.Profile_AccountInformation),
              style: context.typographies.subBodyBold1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.Profile_FinancialInstitutionName),
                      style: context.typographies.subBodyBold1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(LocaleKeys.Profile_BranchName),
                      style: context.typographies.subBodyBold1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(LocaleKeys.Profile_AccountType),
                      style: context.typographies.subBodyBold1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(LocaleKeys.Profile_AccountNumber),
                      style: context.typographies.subBodyBold1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(LocaleKeys.Profile_AccountHolder),
                      style: context.typographies.subBodyBold1,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "みずほ銀行",
                      style: context.typographies.subBody1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "新宿支店",
                      style: context.typographies.subBody1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "普通",
                      style: context.typographies.subBody1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "1234567",
                      style: context.typographies.subBody1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "TAROU HATTYUU",
                      style: context.typographies.subBody1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onShowUpdateImageOptions() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        _handelImageSelection(ImageSource.gallery);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              context.tr(LocaleKeys.PhotoLibrary),
                              style: context.typographies.title3
                                  .withColor(context.colors.tertiary),
                            ),
                            Expanded(child: Container()),
                            AssetGenImage(Assets.icons.png.icGallery.path)
                                .image(width: 30),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: context.colors.divider,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        _handelImageSelection(ImageSource.camera);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              context.tr(LocaleKeys.TakeAPhoto),
                              style: context.typographies.title3
                                  .withColor(context.colors.tertiary),
                            ),
                            Expanded(child: Container()),
                            AssetGenImage(Assets.icons.png.icCameraBlue.path)
                                .image(width: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.95,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    context.tr(LocaleKeys.Cancel),
                    style:
                        context.typographies.title2Bold.withColor(Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handelImageSelection(ImageSource imageSource) async {
    final returnedImage = await ImagePicker().pickImage(source: imageSource);
    if (returnedImage == null) return;
    _bloc.add(AuthUpdateAvatar(File(returnedImage.path)));
  }
}
