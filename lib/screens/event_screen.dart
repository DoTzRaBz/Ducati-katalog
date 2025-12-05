import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widgets/drawer_navigation.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ducati Events'),
        backgroundColor: Colors.red[900],
      ),
      drawer: const DrawerNavigation(),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: const [HypermotardEventCard(), WdwEventCard()],
        ),
      ),
    );
  }
}

class HypermotardEventCard extends StatefulWidget {
  const HypermotardEventCard({super.key});

  @override
  State<HypermotardEventCard> createState() => _HypermotardEventCardState();
}

class _HypermotardEventCardState extends State<HypermotardEventCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showVideo = false;

  final YoutubePlayerController _youtubeController = YoutubePlayerController(
    initialVideoId: 'SRf4iF4KqCs',
    flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showVideo = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hypermotard 698 Mono Launch',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          _showVideo
              ? YoutubePlayer(
                  controller: _youtubeController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent,
                  ),
                )
              : ScaleTransition(
                  scale: _animation,
                  child: Image.asset('assets/ducati_hypermotard_v2.jpg'),
                ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Experience the new Hypermotard 698 Mono. The first single-cylinder Supermotard by Ducati. Simple, lightweight, and agile for a fun-packed experience.',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class WdwEventCard extends StatelessWidget {
  const WdwEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'World Ducati Week 2026',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.go('/wdw'),
            child: Image.asset('assets/wdw.jpg'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'The biggest Ducati party in the world is back! Join us from 3 to 6 July 2026 at the Misano World Circuit Marco Simoncelli.',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
