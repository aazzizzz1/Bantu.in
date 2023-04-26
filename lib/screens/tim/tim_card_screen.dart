import 'package:bantuin/models/note_tim_model.dart';
import 'package:bantuin/models/user_note_model.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
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

class TimCardScreen extends StatefulWidget {
  const TimCardScreen({super.key});

  @override
  State<TimCardScreen> createState() => _TimCardScreenState();
}

class _TimCardScreenState extends State<TimCardScreen> {
  // late List<DragAndDropList> lists;
  late List<DragAndDropList> lists = listNoteTim.map(buildList).toList();
  @override
  void initState() {
    super.initState();
    lists = listNoteTim.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tim Jarvis'),
      ),
      body: DragAndDropLists(
        lastItemTargetHeight: 300,
        listWidth: 300,
        axis: Axis.horizontal,
        // lastItemTargetHeight: 50,
        // addLastItemTargetHeightToTop: true,
        // lastListTargetSize: 30,
        listPadding: EdgeInsets.all(16),
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
        ),
        children: lists,
        itemDivider: Divider(thickness: 2, height: 2, color: Colors.green),
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        listDragHandle: buildDragHandle(isList: true),
        itemDragHandle: buildDragHandle(),
        onItemReorder: onReorderListItem,
        onListReorder: onReorderList,
      ),
    );
  }

  //DragAndDrop Handle
  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.blueGrey : Colors.black26;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  // DragAndDrop Widget Build
  DragAndDropList buildList(NoteTimModel list) => DragAndDropList(
        header: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: list.items
            .map(
              (e) => DragAndDropItem(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.date,
                              style: AppFont.semiBold20,
                            ),
                            Text(
                              e.month,
                              style: AppFont.semiBold20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 0.5,
                        height: 120.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.titles,
                                    style: AppFont.semiBold16w500,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: e.isUploaded
                                        ? AppColor.completeColor
                                        : AppColorRed.red4,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    e.isUploaded
                                        ? 'Sudah Upload'
                                        : 'Belum Upload',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: e.isUploaded
                                          ? AppColor.textprogresColor
                                          : AppColor.errorColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            SizedBox(height: 8.0),
                            Text(
                              e.description,
                              style: AppFont.regular12,
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                SvgPicture.asset("lib/assets/icons/Avatar.svg",
                                    height: 26,
                                    width: 26,
                                    color: AppColorPrimary.primary6),
                                SizedBox(width: 8.0),
                                Text(
                                  'Personal',
                                  style: AppFont.regular12,
                                ),
                                SizedBox(width: 8.0),
                                CachedNetworkImage(
                                  imageUrl: e.avatarUrl,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 12.0,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  e.name,
                                  style: AppFont.regular12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
