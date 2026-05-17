import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/theme/colors.dart';
import 'package:music_app/core/theme/text_styles.dart';
import 'package:music_app/core/util/constants/routes.dart';
import 'package:music_app/core/util/constants/spacing.dart';
import 'package:music_app/core/util/cubit/home_states.dart';
import 'package:music_app/core/util/cubit/home_cubit.dart';
import 'package:music_app/core/util/extensions/context_extension.dart';
import 'package:music_app/features/home/data/music_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
            backgroundColor: ColorsManager.primaryColor,
            actions: [
              IconButton(
                icon: Icon(
                  homeCubit.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: ColorsManager.whiteColor,
                ),
                onPressed: () {
                  homeCubit.isDarkMode = !homeCubit.isDarkMode;
                },
              ),
            ],
          ),
          body: ListView.separated(
            itemBuilder: (context, index) {
              MusicModel music = homeCubit.musicList[index];
              return Container(
                color: homeCubit.currentIndex == index
                    ? ColorsManager.primaryColor.withValues(
                        alpha: 0.2,
                      )
                    : null,
                child: InkWell(
                  onTap: () {
                    homeCubit.setUrlAudioPlay(index: index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorsManager.primaryColor,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.aboelnasr.com/quraa/maher.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        horizontalSpace16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                music.title,
                                style: TextStylesManager.bold16.copyWith(
                                  color: homeCubit.isDarkMode
                                      ? ColorsManager.whiteColor
                                      : ColorsManager.textColor,
                                ),
                              ),
                              Text(
                                music.artist,
                                style: TextStylesManager.medium16.copyWith(
                                  color: ColorsManager.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (homeCubit.currentIndex == index)
                          if (state is SetUrlLoadingState)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CupertinoActivityIndicator(
                                color: ColorsManager.primaryColor,
                              ),
                            )
                          else
                            IconButton(
                              onPressed: () {
                                homeCubit.pausePlayAudio();
                              },
                              icon: homeCubit.isCurrentAudioPaused
                                  ? Icon(
                                      Icons.pause,
                                      color: ColorsManager.primaryColor,
                                      size: 30,
                                    )
                                  : Icon(
                                      Icons.play_arrow,
                                      color: ColorsManager.primaryColor,
                                      size: 30,
                                    ),
                            ),
                        if (homeCubit.currentIndex != index)
                          IconButton(
                            onPressed: () {
                              homeCubit.setUrlAudioPlay(index: index);
                            },
                            icon: Icon(
                              Icons.play_arrow,
                              color: ColorsManager.primaryColor,
                              size: 30,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: ColorsManager.greyColor.withValues(alpha: 0.3),
            ),
            itemCount: homeCubit.musicList.length,
          ),
          bottomNavigationBar: homeCubit.audioPlayer == null
              ? null
              : InkWell(
                  onTap: () {
                    context.push(Routes.songScreen);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: ColorsManager.primaryColor,
                        padding: const EdgeInsets.only(
                          bottom: 32,
                          top: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsManager.primaryColor,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://www.aboelnasr.com/quraa/maher.jpeg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            horizontalSpace16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeCubit.musicList[homeCubit.currentIndex]
                                        .title,
                                    style:
                                        TextStylesManager.semiBold18.copyWith(
                                      color: ColorsManager.whiteColor,
                                    ),
                                  ),
                                  Text(
                                    homeCubit.musicList[homeCubit.currentIndex]
                                        .artist,
                                    style: TextStylesManager.regular14.copyWith(
                                      color: ColorsManager.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                homeCubit.resetAudioPlayer();
                              },
                              icon: Icon(
                                Icons.close,
                                color: ColorsManager.whiteColor,
                              ),
                            ),
                            if (state is SetUrlLoadingState)
                              CupertinoActivityIndicator(
                                color: ColorsManager.whiteColor,
                              )
                            else
                              IconButton(
                                onPressed: () {
                                  homeCubit.pausePlayAudio();
                                },
                                icon: homeCubit.isCurrentAudioPaused
                                    ? Icon(
                                        Icons.pause,
                                        color: ColorsManager.whiteColor,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.play_arrow,
                                        color: ColorsManager.whiteColor,
                                        size: 30,
                                      ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
