project('moodbar', 'cpp',
  version : '0.0.1',
)

dep_gstreamer = dependency('gstreamer-1.0')

gstfastspectrum = static_library('gstfastspectrum',
  'gst/moodbar/gstfastspectrum.cpp',
  'gst/moodbar/plugin.cpp',
  dependencies : [
    dep_gstreamer,
    dependency('gstreamer-audio-1.0'),
    dependency('fftw3'),
  ],
)

moodbar = static_library('moodbar',
  'moodbar.cpp',
  'src/moodbar/moodbarbuilder.cpp',
  'src/moodbar/moodbarpipeline.cpp',
  include_directories : include_directories('src'),
  link_with : gstfastspectrum,
  dependencies : [
    dependency('glib-2.0'),
    dep_gstreamer,
  ],
)

moodbar_exe = executable('moodbar',
  'moodbar_exe.cpp',
  include_directories : include_directories('src'),
  link_with : moodbar,
  dependencies : [
    dependency('gio-2.0'),
    dep_gstreamer,
  ],
)