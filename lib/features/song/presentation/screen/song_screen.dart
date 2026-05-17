import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/theme/colors.dart';
import 'package:music_app/core/theme/text_styles.dart';
import 'package:music_app/core/util/constants/spacing.dart';
import 'package:music_app/core/util/cubit/home_states.dart';
import 'package:music_app/core/util/cubit/home_cubit.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
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
            title: const Text('Song list'),
            backgroundColor: ColorsManager.primaryColor,

          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                verticalSpace70,
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsManager.primaryColor.withValues(
                        alpha: 0.7,
                      ),
                      width: 2,
                    ),
                    color: ColorsManager.primaryColor,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.aboelnasr.com/quraa/maher.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpace40,
                Text(
                  homeCubit.musicList[homeCubit.currentIndex].title,
                  style: TextStylesManager.semiBold20.copyWith(
                    color: homeCubit.isDarkMode ? ColorsManager.whiteColor :
                    ColorsManager.textColor,
                  ),
                ),
                verticalSpace10,
                Text(
                  homeCubit.musicList[homeCubit.currentIndex].artist,
                  style: TextStylesManager.semiBold16.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                ),
                Spacer(),

                Slider(
                  activeColor: ColorsManager.primaryColor,
                  thumbColor: ColorsManager.primaryColor,
                  inactiveColor: ColorsManager.greyColor,
                  autofocus: true,
                  min: 0.0,
                  max: homeCubit.duration!.inMilliseconds.toDouble(),
                  value: homeCubit.position.inMilliseconds.clamp(0, homeCubit.duration!.inMilliseconds).toDouble(),

                  onChangeEnd: (double value)
                  {
                    if(!homeCubit.isCurrentAudioPaused){
                      homeCubit.changeAudioPauseIconValue(isPaused: true);
                    }
                    homeCubit.changeEnd();
                    homeCubit.audioPlayer!.play();
                  },
                  onChanged: (double value) {
                    if(homeCubit.isCurrentAudioPaused){
                      homeCubit.changeAudioPauseIconValue(isPaused: false);
                    }
                    homeCubit.changeEnd();
                    homeCubit.audioPlayer!.pause();
                    final newPosition = Duration(milliseconds: value.toInt());
                    homeCubit.seekToAudio(
                      newPosition: newPosition,
                    );
                  },

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Text(formatDuration(homeCubit.position),
                        style: TextStylesManager.semiBold16.copyWith(
                          color: homeCubit.isDarkMode ? ColorsManager.whiteColor :
                    ColorsManager.textColor,
                        ),
                      ),
                      Spacer(),
                      Text(formatDuration(homeCubit.duration!),
                        style: TextStylesManager.semiBold16.copyWith(
                        color: homeCubit.isDarkMode ? ColorsManager.whiteColor :
                    ColorsManager.textColor,
                      ),),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// skip previous

                      IconButton(
                        onPressed: () {
                          if (state is SetUrlLoadingState) return;
                          homeCubit.skipPreviousAudio();
                        },
                        icon: Icon(
                          Icons.skip_previous,
                          color: ColorsManager.primaryColor,
                          size: 30,
                        ),
                      ),

                      /// fast rewind
                      IconButton(
                        onPressed: () {
                          if (state is SetUrlLoadingState) return;

                          homeCubit.fastRewindAudio();
                        },
                        icon: Icon(
                          Icons.fast_rewind,
                          color: ColorsManager.primaryColor,
                          size: 40,
                        ),
                      ),

                      /// play pause resume
                      if (state is SetUrlLoadingState)
                        CupertinoActivityIndicator(
                          color: ColorsManager.primaryColor,
                          radius: 24,
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
                                  size: 60,
                                )
                              : Icon(
                                  Icons.play_arrow,
                                  color: ColorsManager.primaryColor,
                                  size: 60,
                                ),
                        ),

                      /// fast forward
                      IconButton(
                        onPressed: () {
                          if (state is SetUrlLoadingState) return;

                          homeCubit.fastForwardAudio();
                        },
                        icon: Icon(
                          Icons.fast_forward,
                          color: ColorsManager.primaryColor,
                          size: 40,
                        ),
                      ),

                      /// skip next
                      IconButton(
                        onPressed: () {
                          if (state is SetUrlLoadingState) return;
                          homeCubit.skipNextAudio();
                        },
                        icon: Icon(
                          Icons.skip_next,
                          color: ColorsManager.primaryColor,
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
  String formatDuration(Duration d) {
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours : $minutes: $seconds";
  }

}
