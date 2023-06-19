# Moodbar

Moodbar is a music visualization method that assigns colors to different parts of a track and presents them as a timeline.
Applied to a music player, the main goal is to help the user navigate within a particular track.
For example, if the user wants to skip to the first chorus of a song, a good moodbar implementation should be able to provide a hint of where this might occur in the timeline.

![Moodbar example](https://user-images.githubusercontent.com/8440927/38452195-b894a060-3a2e-11e8-8573-acb542630774.png)

The particular moodbar implementation in this repository is based on the Bandwise Spectral Magnitude method presented in [*On Techniques for Content-Based Visual Annotation to Aid Intra-Track Music Navigation*](https://ismir2005.ismir.net/proceedings/1023.pdf) (Gavin Wood & Simon O'Keefe, 2005).
It divides the track into small chunks and assigns a color to each chunk: the red channel represents audio levels in the low frequencies, green for mid frequencies, and blue for high frequencies.

The code is mostly taken from [Clementine](https://www.clementine-player.org/), with the addition of a command-line interface that is a drop-in alternative to [the original Moodbar program](https://userbase.kde.org/Amarok/Manual/Various/Moodbar).
Clementine's moodbar implementation used to be based on the original project's, but they have since diverged greatly.
Both implement the same idea and the outputs should be roughly similar.

Files in the `gst` and `src` directories are directly taken from Clementine's repository with slight modifications to remove some extra dependencies.
The initial code is taken from Clementine revision 3886f3d1e4b29d028c1bacf474bc40d1c45c2ea9 (2014-12-22), with non-Moodbar commits filtered out.
Last sync is at Clementine revision 55edcf5321051e44281f067a7e3ee44871982c12 (2019-03-11).

# About this repo

This repo is a fork of the repo ![exaile/moodbar](https://github.com/exaile/moodbar). This will be used by the project ManaZeak to generate the moodbars of the application.
The moodbar component will be present in a docker image with a small python server.

This server is used to allow ManaZeak to launch moodbar command.
