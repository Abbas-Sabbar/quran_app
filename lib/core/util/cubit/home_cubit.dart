import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/util/cubit/home_states.dart';
import 'package:music_app/features/home/data/music_model.dart';
import 'package:music_app/main.dart';
import 'package:just_audio/just_audio.dart';

HomeCubit homeCubit = HomeCubit.get(navigatorKey.currentContext!);

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    emit(ChangeThemeState());
  }

  // void toggleTheme() {
  //   isDarkMode = !isDarkMode;
  //   emit(ChangeThemeState());
  // }

  // final player = AudioPlayer();                   // Create a player
  // final duration = await player.setUrl(           // Load a URL
  // 'https://foo.com/bar.mp3');                 // Schemes: (https: | file: | asset: )
  // player.play();                                  // Play without waiting for completion
  // await player.play();                            // Play while waiting for completion
  // await player.pause();                           // Pause but remain ready to play
  // await player.seek(Duration(seconds: 10));       // Jump to the 10 second position
  // await player.setSpeed(2.0);                     // Twice as fast
  // await player.setVolume(0.5);                    // Half as loud
  // await player.stop();                            // Stop and free resources
  // الفاتحة
  // البقرة
  // آل عمران
  // النساء
  // المائدة
  // الأنعام
  // الأعراف
  // الأنفال
  List<MusicModel> musicList = [
    MusicModel(
      title: 'الفاتحة',
      urlAudio: 'https://server12.mp3quran.net/maher/001.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'البقرة ',
      urlAudio: 'https://server12.mp3quran.net/maher/002.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'ال عمران',
      urlAudio: 'https://server12.mp3quran.net/maher/003.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'النساء',
      urlAudio: 'https://server12.mp3quran.net/maher/004.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'المادة',
      urlAudio: 'https://server12.mp3quran.net/maher/005.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'الانعام',
      urlAudio: 'https://server12.mp3quran.net/maher/006.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'الاعراف',
      urlAudio: 'https://server12.mp3quran.net/maher/007.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'الانفال',
      urlAudio: 'https://server12.mp3quran.net/maher/008.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'التوبة',
      urlAudio: 'https://server12.mp3quran.net/maher/009.mp3',
      artist: 'ماهر المعيقلي',
    ),
    MusicModel(
      title: 'هود',
      urlAudio: 'https://server12.mp3quran.net/maher/010.mp3',
      artist: 'ماهر المعيقلي',
    ),
  ];

  AudioPlayer? audioPlayer;
  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    emit(AudioPlayerInitializeState());
  }

  int currentIndex = -1;
  bool isCurrentAudioPaused = false;
  Duration position = Duration.zero;
  Duration? duration;

  void setUrlAudioPlay({
    required int index,
  }) async {
    emit(SetUrlLoadingState());
    if (audioPlayer == null) {
      initAudioPlayer();
    }
    currentIndex = index;
    duration = await audioPlayer!.setUrl(
      musicList[index].urlAudio,
    );
    if (isCurrentAudioPlayBackCompleted) {
      isCurrentAudioPlayBackCompleted = false;
    }
    if (duration != null) {
      isCurrentAudioPaused = true;
      audioPlayer!.play();
      listenForCurrentPos();
      emit(AudioPlayerInitializeState());
    } else {
      debugPrint('audioPlayer is null');
      emit(SetUrlErrorState());
    }
  }

  bool isChangeEnd = true;
  void changeEnd() {
    isChangeEnd = !isChangeEnd;
    emit(OnChangeState());
  }

  void changeAudioPauseIconValue({
    required bool isPaused,
  }) {
    isCurrentAudioPaused = isPaused;
    emit(ChangeAudioPauseIconState());
  }

  bool isCurrentAudioPlayBackCompleted = false;

  void listenForCurrentPos() {
    audioPlayer!.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        if (!isCurrentAudioPlayBackCompleted) {
          isCurrentAudioPlayBackCompleted = true;
          debugPrint('Audio player completed');
          skipNextAudio();
        }
      }
    });
    audioPlayer!.positionStream.listen((pos) {
      position = pos;
      emit(ListenForCurrentPositionState());
    });
  }

  void seekToAudio({required Duration newPosition}) {
    audioPlayer!.seek(newPosition);
    emit(SeekToNewPositionState());
  }

  void pausePlayAudio() {
    if (audioPlayer != null) {
      if (audioPlayer!.playing) {
        isCurrentAudioPaused = false;
        audioPlayer!.pause();
        emit(PausePlayAudioState());
      } else {
        audioPlayer!.play();
        isCurrentAudioPaused = true;
        emit(PausePlayAudioState());
      }
    } else {
      debugPrint('audioPlayer is null');
    }
  }

  void resetAudioPlayer() {
    audioPlayer!.dispose();
    audioPlayer = null;
    currentIndex = -1;
    isCurrentAudioPaused = false;
    emit(ResetAudioPlayerState());
  }

  /// skip previous audio
  void skipPreviousAudio() {
    if (currentIndex > 0) {
      setUrlAudioPlay(index: currentIndex - 1);
    } else {
      debugPrint('audioPlayer is null');
      setUrlAudioPlay(index: musicList.length - 1);
    }
  }

  /// skip next audio
  void skipNextAudio() {
    if (currentIndex < musicList.length - 1) {
      debugPrint('complete done');
      setUrlAudioPlay(index: currentIndex + 1);
    } else {
      debugPrint('audioPlayer is null');
      setUrlAudioPlay(index: 0);
    }
  }

  /// fast forward audio
  void fastForwardAudio() {
    if (audioPlayer != null) {
      audioPlayer!.seek(
        audioPlayer!.position + const Duration(seconds: 10),
      );
    } else {
      debugPrint('audioPlayer is null');
    }
  }

  /// fast rewind audio
  void fastRewindAudio() {
    if (audioPlayer != null) {
      audioPlayer!.seek(
        audioPlayer!.position - const Duration(seconds: 10),
      );
    } else {
      debugPrint('audioPlayer is null');
    }
  }
}
