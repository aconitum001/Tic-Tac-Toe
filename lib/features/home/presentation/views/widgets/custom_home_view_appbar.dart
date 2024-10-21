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

class _CustomAppBarState extends State<CustomAppBar> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = true; // Track whether music is playing

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playMusic(); // Start music when the app bar is initialized
  }

  // Function to play music
  void _playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Loop music
    await _audioPlayer.play(
      AssetSource('sound/background_music.mp3'), // Use your audio path
      volume: 0.6, // Set volume
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
      _isPlaying = !_isPlaying; // Toggle music state
    });
  }

  @override
  void dispose() {
    _audioPlayer
        .dispose(); // Dispose of the audio player when the widget is removed
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
                onPressed: _toggleMusic, // Toggle music on button press
                icon: Icon(
                  _isPlaying
                      ? Icons.volume_up_outlined
                      : Icons.volume_off_outlined, // Change icon based on state
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
