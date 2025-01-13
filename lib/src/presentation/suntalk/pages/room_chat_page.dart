import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/models/response/chat/channel_message_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/private_message_datasources.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/pages/private_chat_page.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/contact_card.dart';

class RoomChatPage extends StatefulWidget {
  const RoomChatPage({super.key});

  @override
  State<RoomChatPage> createState() => _RoomChatPageState();
}

class _RoomChatPageState extends State<RoomChatPage> {
  final ScrollController _scrollController = ScrollController();
  final AuthRemoteDatasources authRemoteDatasources =
      AuthRemoteDatasources(authLocalDatasources: AuthLocalDatasources());

  User? currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    final authData = await AuthLocalDatasources().getAuthData();
    setState(() {
      currentUser = authData.user;
      isLoading = false;
    });
  }

  void _openRoomChat(
      String channelId, String currentUserId, String partnerUserId) async {
    final channel = {
      'unRead.$currentUserId': false,
      'unRead.$partnerUserId': true,
    };

    await PrivateMessageDatasources.instance
        .updateChannelReadStatus(channelId, channel);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CustomLoadingIndicator();
    } else {
      return Scaffold(
        appBar: const CustomAppbar(title: 'Private Message', canBack: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              StreamBuilder<List<ChannelMessageModel>>(
                  stream: PrivateMessageDatasources.instance
                      .getAllChannel(currentUser!.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                          child: Center(child: CustomLoadingIndicator()));
                    }
                    final List<ChannelMessageModel> channels =
                        snapshot.data ?? [];

                    if (channels.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text('No channel found'),
                        ),
                      );
                    }

                    return Expanded(
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            reverse: false,
                            controller: _scrollController,
                            itemCount: channels.length,
                            itemBuilder: (context, index) {
                              final channel = channels[index];
                              final String currentUserId =
                                  currentUser!.id!.toString();
                              final filteredIds = channel.memberIds!
                                  .where((id) => id != currentUserId)
                                  .toList();
                              String partnerUserId = filteredIds.first;
                              debugPrint(
                                  'currentUser: $currentUserId, partnerUser: $partnerUserId');

                              return FutureBuilder<User>(
                                  future: authRemoteDatasources
                                      .getUserInfo(partnerUserId),
                                  builder: (context, userSnapshot) {
                                    if (userSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return ContactCard(
                                        imageUrl: '',
                                        userName: 'Loading..',
                                        lastMessage: channel.lastMessage!,
                                        onTap: () {},
                                      );
                                    } else if (userSnapshot.hasError) {
                                      return Text(
                                          'Error: ${userSnapshot.error}');
                                    } else if (userSnapshot.hasData) {
                                      final partnerUserData =
                                          userSnapshot.data!;
                                      return ContactCard(
                                        imageUrl: partnerUserData.avatar,
                                        userName: partnerUserData.name!,
                                        lastMessage: channel.lastMessage!,
                                        isRead:
                                            channel.unRead![currentUserId] ==
                                                    true
                                                ? false
                                                : true,
                                        onTap: () {
                                          if (channel.unRead![currentUserId] ==
                                              true) {
                                            _openRoomChat(channel.id,
                                                currentUserId, partnerUserId);
                                          }
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return PrivateChatPage(
                                                partnerUser: partnerUserData);
                                          }));
                                        },
                                      );
                                    } else {
                                      return const Text('Error');
                                    }
                                  });
                            }));
                  }),
            ],
          ),
        ),
      );
    }
  }
}
