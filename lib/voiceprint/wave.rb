module Voiceprint

  class Wave
    include RubyAudio

    def initialize(*args)
      @signal = args[0]
      @sample_rate = args[1]
    end

    def self.file2wave(file)
      snd = Sound.open(file)
      sample_rate = snd.info.samplerate
      len_sec = snd.info.length
      buf_size = sample_rate * len_sec
      buf = snd.read("double", buf_size)
      buf
    end
  end

end
