require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/string/strip'
require 'tunees/commander'

module Tunees
  module Application

    def self.execute(method, *args)
      Commander.run <<-JXA.strip_heredoc
        var app = Application("iTunes")
        app.#{method}()
      JXA
    end

    %w(
      add
      backTrack
      convert
      fastForward
      nextTrack
      pause
      play
      playpause
      previousTrack
      refresh
      resume
      reveal
      rewind
      search
      stop
      update
      eject
      subscribe
      updateallpodcasts
      updatepodcast
      download
    ).each do |camel_cased_method|
      method = camel_cased_method.underscore
      define_singleton_method(method) do |*args|
        execute(camel_cased_method, *args)
      end
    end

    # Application elements
    %w(
      airplayDevices
      browserWindows
      encoders
      eqPresets
      eqWindows
      playlistWindows
      sources
        audioCDPlaylists
          audioCDTracks
        libraryPlaylists
          fileTracks
          urlTracks
          sharedTracks
        playlists
          tracks
            artworks
        radioTunerPlaylists
          urlTracks
        userPlaylists
          fileTracks
          urlTracks
          sharedTracks
      visuals
      windows
    ).uniq.each do |camel_cased_element|
      method = camel_cased_element.underscore
      define_singleton_method(method) do
        execute(camel_cased_element)
      end
    end
  end
end
