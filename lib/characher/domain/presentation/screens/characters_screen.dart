import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson01_flutter/characher/domain/presentation/bloc/characters_bloc.dart';
import 'package:lesson01_flutter/characher/domain/presentation/bloc/characters_event.dart';
import 'package:lesson01_flutter/characher/domain/presentation/bloc/characters_state.dart';
import 'package:lesson01_flutter/characher/domain/presentation/widgets/character_item.dart';
import 'package:lesson01_flutter/core/di/service_locator.dart';
import 'package:lesson01_flutter/core/theme/app_colors.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    sl<CharactersBloc>().add(LoadCharactersEvent(0));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      sl<CharactersBloc>().add(LoadNextPageEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<CharactersBloc, CharactersState>(
          bloc: sl<CharactersBloc>(),
          builder: (context, state) {
            if (state is CharactersLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 3),
              );
            } 
            
            else if (state is CharactersLoadedSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      state.characters.length + (state.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {

                    if (index < state.characters.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: CharacterItem(
                          character: state.characters[index],
                        ),
                      );
                    } 
                    
                    else {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              );
            } 
            
            else if (state is CharactersError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 60,
                        color: AppColors.error,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } 
            
            else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}