module Voiceprint
  module Audio
    class << self
      include RubyAudio

      def self.open(file)
        Sound.open(file)
      end

      def self.play(file) # Play sound (.wav file supported)
        system("play #{file}");
      end

      def self.disp_file_info(file)
        snd = Sound.open(file)

        sample_rate = snd.info.samplerate
        channels = snd.info.channels
        len_secs = snd.info.length.round(2)
        puts "Sample rate: #{sample_rate}"
        puts "Channels: #{channels}"
        puts "Length: #{len_secs} secs"

        snd.close
      end

    end
  end
end
