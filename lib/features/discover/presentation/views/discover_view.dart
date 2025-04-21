import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/discover_bloc.dart';
import '../widgets/section_header.dart';
import '../widgets/official_models_list.dart';
import '../widgets/ai_tools_list.dart';
import '../widgets/experts_list.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        if (state is DiscoverInitial) {
          context.read<DiscoverBloc>().add(LoadDiscoverData());
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DiscoverLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DiscoverError) {
          return const Center(child: Text('Error loading data'));
        }

        if (state is DiscoverLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const SectionHeader(title: 'Resmi Modeller', actionText: 'Hepsini Gör'),
                ),
                OfficialModelsList(models: state.officialModels),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const SectionHeader(
                    title: 'Yapay Zeka Araçları',
                    actionText: 'Hepsini Gör',
                  ),
                ),
                AIToolsList(tools: state.aiTools),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const SectionHeader(title: 'Uzmanlar', actionText: 'Hepsini Gör'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ExpertsList(experts: state.experts),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
