import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import 'chat_option_card.dart';

class ChatOptionsSection extends StatelessWidget {
  const ChatOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(top: 5.0), child: _seeAllButton(context)),
          _chatOptionCards(),
        ],
      ),
    );
  }

  Widget _seeAllButton(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black54, Colors.grey[850]!, Colors.grey[800]!],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: ColorConstants.buttonText, width: 0.7),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Text(StringConstants.seeAll, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  Expanded _chatOptionCards() {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.chatOptions.length,
            itemBuilder: (context, index) {
              final option = state.chatOptions[index];
              return ChatOptionCard(
                title: option.title,
                icon: option.icon,
                onTap: () {
                  context.read<HomeBloc>().add(ChatOptionSelected(option));
                  Navigator.of(context).pushNamed(option.route);
                },
              );
            },
          );
        },
      ),
    );
  }
}
