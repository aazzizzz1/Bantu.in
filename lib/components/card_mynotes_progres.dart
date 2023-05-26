import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/note/note_detail_client.dart';

class CardMyNotesProgres extends StatelessWidget {
  final NoteDetailModel noteDetail;

  CardMyNotesProgres({required this.noteDetail});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteViewModel>(
      builder: (context, noteView, child) {
        return GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String name = prefs.getString('username').toString();
            bool isOwner = false;
            if (name == noteDetail.owner[0].username) {
              isOwner = true;
            }

            // try {
            //   await noteView
            //       .getDetailNote(noteDetail.id)
            //       .then((value) => Fluttertoast.showToast(msg: 'berhasil get'))
            //       .then((value) => Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => NoteDetailClient(
            //               noteDetail: noteView.noteDetail,
            //               // isOwner: isOwner,
            //             ),
            //           )));
            // } catch (e) {
            //   await Fluttertoast.showToast(msg: e.toString());
            // }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesDetail(
                    noteDetail: noteDetail,
                    isOwner: isOwner,
                  ),
                ));
          },
          child: Container(
            height: 135,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'lib/assets/icons/Group.svg',
                    alignment: Alignment.centerLeft,
                    allowDrawingOutsideViewBox: true,
                    color: AppColorPrimary.primary6,
                  ),
                ),
                const VerticalDivider(
                  width: 5,
                  color: AppColorNeutral.neutral2,
                  thickness: 1.5,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  noteDetail.subject,
                                  style: AppFont.semiBold16w500,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: AppColor.completeColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text('${(0 * 100).toStringAsFixed(0)}%'),
                                // Text(noteDetail.status),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            noteDetail.description,
                            style: AppFont.regular12,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  backgroundImage: imageProvider,
                                  radius: 10.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                noteDetail.owner[0].username,
                                style: AppFont.regular12,
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              // noteDetail.eventDate.toString(),
                              DateFormat('dd MMMM yyyy', 'id_ID')
                                  .format(noteDetail.eventDate),
                              style: AppFont.regular12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey),
          //     borderRadius: BorderRadius.circular(16.0),
          //   ),
          //   padding: EdgeInsets.all(10.0),
          //   margin: EdgeInsets.only(bottom: 16.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(date, style: AppFont.semiBold20),
          //             Text(month, style: AppFont.semiBold20),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: 0.5,
          //         height: 120.0,
          //         color: Colors.grey,
          //       ),
          //       SizedBox(width: 16.0),
          //       Expanded(
          //         flex: 5,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Text(
          //                     title,
          //                     style: AppFont.semiBold16w500,
          //                   ),
          //                 ),
          //                 Container(
          //                   padding: EdgeInsets.all(4.0),
          //                   decoration: BoxDecoration(
          //                     color: AppColor.completeColor,
          //                     borderRadius: BorderRadius.circular(8.0),
          //                   ),
          //                   child: Text('${(progress * 100).toStringAsFixed(0)}%',
          //                       style: AppFont.regularprogres12),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 8.0),
          //             LinearProgressIndicator(
          //               value: progress,
          //               backgroundColor: Colors.grey[300],
          //               valueColor: AlwaysStoppedAnimation<Color>(
          //                   AppColor.textprogresColor),
          //             ),
          //             SizedBox(height: 8.0),
          //             Text(description, style: AppFont.regular12),
          //             SizedBox(height: 8.0),
          //             Row(
          //               children: [
          //                 //add icon
          //                 SvgPicture.asset("lib/assets/icons/Avatar.svg",
          //                     height: 26,
          //                     width: 26,
          //                     color: AppColorPrimary.primary6),
          //                 SizedBox(width: 8.0),
          //                 Text('Personal', style: AppFont.regular12),
          //                 SizedBox(width: 8.0),
          //                 CachedNetworkImage(
          //                   imageUrl: avatarUrl,
          //                   placeholder: (context, url) => CircularProgressIndicator(),
          //                   errorWidget: (context, url, error) => Icon(Icons.error),
          //                   imageBuilder: (context, imageProvider) => CircleAvatar(
          //                     backgroundImage: imageProvider,
          //                     radius: 12.0,
          //                   ),
          //                 ),
          //                 SizedBox(width: 8.0),
          //                 Text(
          //                   name,
          //                   style: AppFont.regular12,
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
    // GestureDetector(
    //   onTap: () async {
    //     SharedPreferences prefs = await SharedPreferences.getInstance();
    //     String name = prefs.getString('username').toString();
    //     bool isOwner = false;
    //     if (name == noteDetail.owner[0].username) {
    //       isOwner = true;
    //     }

    //     try {
    //       await val
    //           .getDetailNote(noteDetail.id)
    //           .then((value) => Fluttertoast.showToast(msg: 'berhasil get'))
    //           .then((value) => Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => NoteDetailClient(
    //                   noteDetail: noteDetail,
    //                 ),
    //               )));
    //     } catch (e) {
    //       await Fluttertoast.showToast(msg: e.toString());
    //     }
    //     // Navigator.push(
    //     //     context,
    //     //     MaterialPageRoute(
    //     //       builder: (context) => NotesDetail(
    //     //         noteDetail: noteDetail,
    //     //         isOwner: isOwner,
    //     //       ),
    //     //     ));
    //   },
    //   child: Container(
    //     height: 135,
    //     decoration: BoxDecoration(
    //       border: Border.all(color: Colors.grey),
    //       borderRadius: BorderRadius.circular(16.0),
    //     ),
    //     padding: const EdgeInsets.all(10.0),
    //     margin: const EdgeInsets.only(bottom: 16.0),
    //     child: Row(
    //       children: [
    //         Container(
    //           alignment: Alignment.centerRight,
    //           margin: const EdgeInsets.all(8),
    //           child: SvgPicture.asset(
    //             'lib/assets/icons/Group.svg',
    //             alignment: Alignment.centerLeft,
    //             allowDrawingOutsideViewBox: true,
    //             color: AppColorPrimary.primary6,
    //           ),
    //         ),
    //         const VerticalDivider(
    //           width: 5,
    //           color: AppColorNeutral.neutral2,
    //           thickness: 1.5,
    //         ),
    //         const SizedBox(width: 16.0),
    //         Expanded(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Expanded(
    //                         child: Text(
    //                           noteDetail.subject,
    //                           style: AppFont.semiBold16w500,
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.all(4.0),
    //                         decoration: BoxDecoration(
    //                           color: AppColor.completeColor,
    //                           borderRadius: BorderRadius.circular(8.0),
    //                         ),
    //                         child: Text('${(0 * 100).toStringAsFixed(0)}%'),
    //                         // Text(noteDetail.status),
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(height: 8.0),
    //                   Text(
    //                     noteDetail.description,
    //                     style: AppFont.regular12,
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       CachedNetworkImage(
    //                         imageUrl:
    //                             'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    //                         placeholder: (context, url) =>
    //                             const CircularProgressIndicator(),
    //                         errorWidget: (context, url, error) =>
    //                             const Icon(Icons.error),
    //                         imageBuilder: (context, imageProvider) =>
    //                             CircleAvatar(
    //                           backgroundImage: imageProvider,
    //                           radius: 10.0,
    //                         ),
    //                       ),
    //                       const SizedBox(width: 8.0),
    //                       Text(
    //                         noteDetail.owner[0].username,
    //                         style: AppFont.regular12,
    //                       ),
    //                     ],
    //                   ),
    //                   Container(
    //                     child: Text(
    //                       // noteDetail.eventDate.toString(),
    //                       DateFormat('dd MMMM yyyy', 'id_ID')
    //                           .format(noteDetail.eventDate),
    //                       style: AppFont.regular12,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   // Container(
    //   //   decoration: BoxDecoration(
    //   //     border: Border.all(color: Colors.grey),
    //   //     borderRadius: BorderRadius.circular(16.0),
    //   //   ),
    //   //   padding: EdgeInsets.all(10.0),
    //   //   margin: EdgeInsets.only(bottom: 16.0),
    //   //   child: Row(
    //   //     crossAxisAlignment: CrossAxisAlignment.center,
    //   //     children: [
    //   //       Expanded(
    //   //         child: Column(
    //   //           mainAxisAlignment: MainAxisAlignment.center,
    //   //           children: [
    //   //             Text(date, style: AppFont.semiBold20),
    //   //             Text(month, style: AppFont.semiBold20),
    //   //           ],
    //   //         ),
    //   //       ),
    //   //       Container(
    //   //         width: 0.5,
    //   //         height: 120.0,
    //   //         color: Colors.grey,
    //   //       ),
    //   //       SizedBox(width: 16.0),
    //   //       Expanded(
    //   //         flex: 5,
    //   //         child: Column(
    //   //           crossAxisAlignment: CrossAxisAlignment.start,
    //   //           children: [
    //   //             Row(
    //   //               children: [
    //   //                 Expanded(
    //   //                   child: Text(
    //   //                     title,
    //   //                     style: AppFont.semiBold16w500,
    //   //                   ),
    //   //                 ),
    //   //                 Container(
    //   //                   padding: EdgeInsets.all(4.0),
    //   //                   decoration: BoxDecoration(
    //   //                     color: AppColor.completeColor,
    //   //                     borderRadius: BorderRadius.circular(8.0),
    //   //                   ),
    //   //                   child: Text('${(progress * 100).toStringAsFixed(0)}%',
    //   //                       style: AppFont.regularprogres12),
    //   //                 ),
    //   //               ],
    //   //             ),
    //   //             SizedBox(height: 8.0),
    //   //             LinearProgressIndicator(
    //   //               value: progress,
    //   //               backgroundColor: Colors.grey[300],
    //   //               valueColor: AlwaysStoppedAnimation<Color>(
    //   //                   AppColor.textprogresColor),
    //   //             ),
    //   //             SizedBox(height: 8.0),
    //   //             Text(description, style: AppFont.regular12),
    //   //             SizedBox(height: 8.0),
    //   //             Row(
    //   //               children: [
    //   //                 //add icon
    //   //                 SvgPicture.asset("lib/assets/icons/Avatar.svg",
    //   //                     height: 26,
    //   //                     width: 26,
    //   //                     color: AppColorPrimary.primary6),
    //   //                 SizedBox(width: 8.0),
    //   //                 Text('Personal', style: AppFont.regular12),
    //   //                 SizedBox(width: 8.0),
    //   //                 CachedNetworkImage(
    //   //                   imageUrl: avatarUrl,
    //   //                   placeholder: (context, url) => CircularProgressIndicator(),
    //   //                   errorWidget: (context, url, error) => Icon(Icons.error),
    //   //                   imageBuilder: (context, imageProvider) => CircleAvatar(
    //   //                     backgroundImage: imageProvider,
    //   //                     radius: 12.0,
    //   //                   ),
    //   //                 ),
    //   //                 SizedBox(width: 8.0),
    //   //                 Text(
    //   //                   name,
    //   //                   style: AppFont.regular12,
    //   //                 ),
    //   //               ],
    //   //             ),
    //   //           ],
    //   //         ),
    //   //       ),
    //   //     ],
    //   //   ),
    //   // ),
    // );
  }
}
