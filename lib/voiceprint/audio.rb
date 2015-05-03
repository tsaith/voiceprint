module Voiceprint
  module Audio
    class << self
      include RubyAudio

      def open(file)
        Sound.open(file)
      end

      def read(file, buf_size = nil)
        snd = Sound.open(file)
        sample_rate = snd.info.samplerate
        len_sec = snd.info.length.floor
        buf_size ||= sample_rate * len_sec
        buf = snd.read("double", buf_size)
        snd.close

        buf.to_a
      end

      def play(file) # Play sound (.wav file supported)
        system("play #{file}");
      end

      def disp_file_info(file)
        snd = Sound.open(file)

        sample_rate = snd.info.samplerate
        channels = snd.info.channels
        len_sec = snd.info.length
        sample_num = sample_rate * len_sec
        puts "Sample rate: #{sample_rate}"
        puts "Channels: #{channels}"
        puts "Length: #{len_sec} secs"
        puts "Sample number: #{sample_num}"

        snd.close
      end

    end
  end
end
