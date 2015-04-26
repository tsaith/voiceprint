module Voiceprint

  module Audio
    include RubyAudio

    def self.open(file)
      Sound.open(file)
    end

    def self.play(file)
      # Play sound (.wav file supported)
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

    def self.buf2narray(a)
      n = a.size
      na = NArray.float(n)
      (0..n-1).each do |index|
        na[index] = a[index]
      end
      na
    end

  end

end
