// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:audio_session/audio_session.dart';
// class AudioPlayerWidget extends StatefulWidget {
//   final String audioUrl;

//   AudioPlayerWidget({required this.audioUrl});

//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   late AudioPlayer _player;
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _initAudioPlayer();
//   }

//   Future<void> _initAudioPlayer() async {
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration.speech());
//     try {
//       await _player.setUrl(widget.audioUrl);
      
//       // Listen to player state stream
//       _player.playerStateStream.listen((playerState) {
//         final processingState = playerState.processingState;
//         if (processingState == ProcessingState.completed) {
//           // Reset slider position to start when audio completes
//           setState(() {
//             position = Duration.zero;
//             isPlaying = false;
//           });
//           _player.seek(Duration.zero);
//           _player.pause();
//         }
//       });

//       _player.playingStream.listen((playing) {
//         setState(() {
//           isPlaying = playing;
//         });
//       });

//       _player.durationStream.listen((d) {
//         setState(() {
//           duration = d ?? Duration.zero;
//         });
//       });

//       _player.positionStream.listen((p) {
//         setState(() {
//           position = p;
//         });
//       });
//     } catch (e) {
//       print("Error loading audio: $e");
//     }
//   }

//   void _playPause() {
//     if (isPlaying) {
//       _player.pause();
//     } else {
//       _player.play();
//     }
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade300,
//         borderRadius: BorderRadius.circular(27.0),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: _playPause,
//           ),
//           Text(
//             "${_formatDuration(position)} / ${_formatDuration(duration)}",
//             style: TextStyle(fontSize: 14),
//           ),
//           Expanded(
//             child: Slider(
//               value: position.inSeconds.toDouble(),
//               max: duration.inSeconds > 0 ? duration.inSeconds.toDouble() : 1.0,
//               onChanged: (value) {
//                 _player.seek(Duration(seconds: value.toInt()));
//               },
//             ),
//           ),
//           // Icon(Icons.volume_up),
//         ],
//       ),
//     );
//   }

//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return "$minutes:$seconds";
//   }
// }
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  AudioPlayerWidget({required this.audioUrl});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _player;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    try {
      await _player.setUrl(widget.audioUrl);

      // Auto-play when the widget is initialized
      _player.play();

      // Listen to player state stream
      _player.playerStateStream.listen((playerState) {
        final processingState = playerState.processingState;
        if (processingState == ProcessingState.completed) {
          // Reset slider position to start when audio completes
          setState(() {
            position = Duration.zero;
            isPlaying = false;
          });
          _player.seek(Duration.zero);
          _player.pause();
        }
      });

      _player.playingStream.listen((playing) {
        setState(() {
          isPlaying = playing;
        });
      });

      _player.durationStream.listen((d) {
        setState(() {
          duration = d ?? Duration.zero;
        });
      });

      _player.positionStream.listen((p) {
        setState(() {
          position = p;
        });
      });
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  void _playPause() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(27.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _playPause,
          ),
          Text(
            "${_formatDuration(position)} / ${_formatDuration(duration)}",
            style: TextStyle(fontSize: 14),
          ),
          Expanded(
            child: Slider(
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds > 0 ? duration.inSeconds.toDouble() : 1.0,
              onChanged: (value) {
                _player.seek(Duration(seconds: value.toInt()));
              },
            ),
          ),
          // Icon(Icons.volume_up),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
