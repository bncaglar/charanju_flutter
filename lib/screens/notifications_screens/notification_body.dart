import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/notification_drop_down_cubit/notification_drop_down_cubit.dart';
import 'package:charanju_flutter/helper/dummy_data/notification_data.dart';
import 'package:charanju_flutter/widgets/slid_able_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBody extends StatelessWidget {
  NotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationDropDownCubit, NotificationDropDownState>(
      builder: (context, state) {
        if (state is FollowingAndFollowers) {
          return buildBody(
              itemCategories: S.of(context).followingFollowers, state: state);
        }
        if (state is NewVideosAndVictories) {
          return buildBody(
              itemCategories: S.of(context).newVideosVictories, state: state);
        }
        if (state is Comments) {
          return buildBody(
              itemCategories: S.of(context).comments, state: state);
        }
        if (state is Messages) {
          return buildBody(
              itemCategories: S.of(context).messages, state: state);
        }
        if (state is NewChallengeRequests) {
          return buildBody(
              itemCategories: S.of(context).newChallengeRequest, state: state);
        }
        return buildBody(
            itemCategories: S.of(context).allNotifications, state: state);
      },
    );
  }

  ListView buildBody(
      {required String itemCategories,
      required NotificationDropDownState state}) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: NotificationData.items.length,
      itemBuilder: (context, index) {
        final item = NotificationData.items[index];
        if (!(state is AllNotifications)) {
          return item.categories == itemCategories
              ? SlidAbleWidget(item: item, index: index)
              : Container();
        } else {
          return SlidAbleWidget(item: item, index: index);
        }
      },
    );
  }
}
