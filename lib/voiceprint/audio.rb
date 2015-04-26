module Voiceprint

  class Audio

    def initialize(snd)
      @snd = snd
    end

    def self.open(file)
      snd = RubyAudio::Sound.open(file)
      audio = Audio.new(snd)
      audio
    end

    def self.play(file)
      # Play sound (.wav file supported)
      system("play #{file}");
    end

    def disp_info
      len_secs = length.round(2)
      puts "Sample rate: #{samplerate}"
      puts "Channels: #{channels}"
      puts "Length: #{len_secs} secs"
    end

    def samplerate
      @snd.info.samplerate
    end

    def channels
      @snd.info.channels
    end

    def length
      @snd.info.length
    end

    def close
      @snd.close
    end


  end

end
