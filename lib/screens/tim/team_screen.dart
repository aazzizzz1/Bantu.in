import 'package:bantuin/models/note_team_model.dart';
import 'package:bantuin/models/tim_model.dart';
import 'package:bantuin/models/user_note_model.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:bantuin/screens/tim/tim_all_member.dart';
import 'package:bantuin/screens/tim/tim_detail_screen.dart';
import 'package:bantuin/screens/tim/list_team_screen.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class TeamScreen extends StatefulWidget {
  final TeamDetailModel teamDetail;
  const TeamScreen({
    super.key,
    required this.teamDetail,
  });

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  // late List<DragAndDropList> lists;
  late List<DragAndDropList> lists = listNoteTim.map(buildList).toList();
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TeamViewModel>(context, listen: false)
        .getDetailTeam(widget.teamDetail));
    lists = listNoteTim.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        toolbarHeight: 71,
        leadingWidth: 90,
        shadowColor: AppColorNeutral.neutral2,
        backgroundColor: Colors.white,
        title: Consumer<TeamViewModel>(
          builder: (context, teamAppbar, child) {
            if (teamAppbar.appState == AppState.loading) {
              return const ShimmerContainer.rectangle(height: 24, width: 50);
            }
            if (teamAppbar.appState == AppState.loaded) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TimDetailScreen(teamDetail: teamAppbar.detailTeam),
                      ));
                    },
                    child: SizedBox(
                      width: 170,
                      child: Text(
                        teamAppbar.detailTeam.title,
                        style: AppFont.textTitleScreen,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            }
            if (teamAppbar.appState == AppState.noData) {
              return SizedBox(
                width: 170,
                child: Text(
                  'Tanpa nama',
                  style: AppFont.textTitleScreen,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  // constraints: const BoxConstraints(maxWidth: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomMenu(
                              currentTab: 2, currentScreen: const TimScreen())),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  alignment: Alignment.topLeft,
                  splashColor: AppColorNeutral.neutral1,
                  splashRadius: 25,
                  iconSize: 30,
                ),
              ),
              SvgPicture.asset('lib/assets/images/exampleLogoTim.svg'),
            ],
          ),
        ),
        actions: [
          Consumer<TeamViewModel>(
            builder: (context, teamAction, child) => Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        TimAllMember(timdetail: teamAction.detailTeam),
                  ));
                },
                icon: SvgPicture.asset(
                  'lib/assets/icons/Group.svg',
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      body: DragAndDropLists(
        listWidth: 300,
        axis: Axis.horizontal,
        // lastItemTargetHeight: MediaQuery.of(context).size.height - 720,
        // addLastItemTargetHeightToTop: true,
        // lastListTargetSize: 30,
        listPadding: const EdgeInsets.all(16),
        listInnerDecoration: const BoxDecoration(
          color: Colors.white,
        ),
        children: lists,
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        // listDragHandle: buildDragHandle(isList: true),
        // itemDragHandle: buildDragHandle(),
        onItemReorder: onReorderListItem,
        onListReorder: onReorderList,
      ),
    );
  }

  //DragAndDrop Handle
  DragHandle buildDragHandle({bool isList = false}) {
    return DragHandle(
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.menu),
      ),
    );
  }

  // DragAndDrop Widget Build
  DragAndDropList buildList(NoteTimModel list) => DragAndDropList(
        canDrag: false,
        header: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: AppColorNeutral.neutral1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: Text(
            'Title',
            style: AppFont.semiBold14,
          ),
        ),
        footer: Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NoteForm(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColor.activeColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Tambah Catatan',
                      style: AppFont.textButtonActive,
                    ),
                  ],
                ))
            // ElevatedButton(
            //     style: const ButtonStyle(
            //       overlayColor:
            //           MaterialStatePropertyAll(AppColorPrimary.primary3),
            //       elevation: MaterialStatePropertyAll(0),
            //       backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            //     ),
            //     onPressed: () {},
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Icon(
            //           Icons.add,
            //           color: AppColor.activeColor,
            //         ),
            //         const SizedBox(
            //           width: 8,
            //         ),
            //         Text(
            //           'Tambah Catatan',
            //           style: AppFont.textButtonActive,
            //         ),
            //       ],
            //     )),
            ),
        children: list.items
            .map(
              (e) => DragAndDropItem(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.all(12.0),
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        e.titles,
                        style: AppFont.semiBold14,
                      ),
                      Text(
                        e.description,
                        style: AppFont.textDescription,
                      ),
                      CachedNetworkImage(
                        imageUrl: e.avatarUrl,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 12.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}
