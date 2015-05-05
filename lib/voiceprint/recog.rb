module Voiceprint
  module Recog

    def self.signal_match(s1, s2, fs = 44100)
      # Return the match probability of two signals

      n1 = s1.length
      n2 = s2.length

      n = [n1, n2].min
      yt1 = s1[0..n-1]
      yt2 = s2[0..n-1]

      yw1 = FFT.fft(yt1)
      yw2 = FFT.fft(yt2)

      amp1 = yw1.abs
      amp2 = yw2.abs

      dt = 1.0 / fs
      df = 1.0 / (n * dt)
      mode_min, mode_max = voice_mode_range(df)
      mode_range = mode_min..mode_max

      pattern_match(amp1[mode_range], amp2[mode_range])
    end

    private

    def self.pattern_match(x, y)
      # Return the match probability of two patterns
      corr_coef = Stats.corr(x, y)
      prob = corr_coef
      return prob
    end

    def self.voice_mode_range(df, freq_min = 50, freq_max = 300)
      mode_min = (freq_min/df).ceil
      mode_max = (freq_max/df).floor
      return mode_min, mode_max
    end

  end
end
