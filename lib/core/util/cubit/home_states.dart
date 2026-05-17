abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeThemeState extends HomeStates {}

class AudioPlayerInitializeState extends HomeStates {}
class SetUrlAudioPlayerState extends HomeStates {}
class PausePlayAudioState extends HomeStates {}
class ResetAudioPlayerState extends HomeStates {}

class SetUrlLoadingState extends HomeStates {}
class SetUrlSuccessState extends HomeStates {}
class SetUrlErrorState extends HomeStates {}
class PauseAudioState extends HomeStates {}
class PlayAudioState extends HomeStates {}
class ListenForCurrentPositionState extends HomeStates {}
class SeekToNewPositionState extends HomeStates {}
class OnChangeState extends HomeStates {}
class ChangeAudioPauseIconState extends HomeStates {}