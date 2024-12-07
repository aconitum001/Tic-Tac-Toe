import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/widgets/display_points_widget.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Add observer for app lifecycle
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  // Handle app lifecycle changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // Stop music when app is in the background or closed
      _pauseMusic();
    } else if (state == AppLifecycleState.resumed) {
      // Optionally, resume music when app is back in the foreground
      if (_isPlaying) _playMusic();
    }
  }

  // Function to play music
  void _playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(
      AssetSource('sound/background_music.mp3'),
      volume: 0.6,
    );
  }

  // Function to pause music
  void _pauseMusic() async {
    await _audioPlayer.pause();
  }

  // Function to toggle the audio
  void _toggleMusic() {
    setState(() {
      if (_isPlaying) {
        _pauseMusic();
      } else {
        _playMusic();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: IconButton(
                onPressed: _toggleMusic,
                icon: Icon(
                  _isPlaying
                      ? Icons.volume_up_outlined
                      : Icons.volume_off_outlined,
                ),
              ),
            ),
            PointsDisplayWidget(user: widget.user),
          ],
        );
      },
    );
  }
}
