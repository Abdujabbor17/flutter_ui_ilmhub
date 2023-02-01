import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/tweet_model.dart';
import '../utils.dart';

Widget postTweet(BuildContext context,TweetModel tweet) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade400))),
    width: MediaQuery.of(context).size.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // #profile_image
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 3),
            SvgPicture.asset(tweet.actionIcon!),
            const SizedBox(
              height: 6.8,
            ),
            CircleAvatar(
              radius: 27.5,
              backgroundImage: AssetImage(tweet.userImage),
            )
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // #reactions
            Text(
              tweet.actionUserNameList!.length > 1
                  ? tweet.actionUserNameList!.last +
                  " and " +
                  tweet.actionUserNameList![
                  tweet.actionUserNameList!.length - 2] +
                  tweet.actionType!
                  : tweet.actionUserNameList!.first +
                  tweet.actionType!,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff687684)),
            ),

            // #user_name_time_post
            SizedBox(
              width: MediaQuery.of(context).size.width - 103,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 114,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 9,
                          child: Text(
                            tweet.userName,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        tweet.isOfficialAccount?
                        Flexible(
                            flex: 1,
                            child: SvgPicture.asset("assets/icons/tick.svg")):
                        const SizedBox.shrink(),
                        Flexible(
                          flex: 8,
                          child: Text(
                            " " + tweet.nickName,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: const TextStyle(
                                color: Color(0xff687684), fontSize: 16),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            " ${String.fromCharCode(0x00B7)} ${tweet.tweetTime}",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: const TextStyle(
                                color: Color(0xff687684), fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/icons/down.svg")
                ],
              ),
            ),

            // #contentPost
            Container(
                padding: const EdgeInsets.only(bottom: 5),
                width: MediaQuery.of(context).size.width - 103,
                child: convertHashtag(tweet.textContent)),

            // #contentImage
            tweet.contentImage != null
                ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                    width: MediaQuery.of(context).size.width-105,
                    image: AssetImage(tweet.contentImage!)))
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),

            // #reactions_icons
            SizedBox(
              width: MediaQuery.of(context).size.width - 103,
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/icons/comment.svg"),
                          Text(
                            " ${tweet.commentNumber}",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff687684)),
                          )
                        ],
                      )),
                  const SizedBox(width: 15,),
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/icons/retweet.svg"),
                          Text(
                            " " + tweet.retweetNumber.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff687684)),
                          )
                        ],
                      )),
                  const SizedBox(width: 15,),
                  Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/like.svg"),
                          Text(
                            " " + tweet.likeNumber.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff687684)),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )),
                  const SizedBox(width: 15,),
                  Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/share.svg"),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}