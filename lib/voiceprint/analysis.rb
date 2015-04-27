module Voiceprint
  module Analysis

    def self.inspect_signal(signal, fs = 44100)
      # Match two signals

      n = signal.length

      yt = signal
      yw = FFT.fft(yt)

      amp = yw.abs

      dt = 1.0 / fs

      time = (0..n-1).map {|e| e * dt}
      freq = FFT.fftfreq(n, dt)

      mode_max = 1024
      mode_range = 0..mode_max-1

      Plot.plot(time, yt, xlabel: "Time (sec)", ylabel: "Signal")
      Plot.plot(freq[mode_range], amp[mode_range], xlabel: "Freq (Hz)", ylabel: "Amp")

    end

    def self.match_signals(signal1, signal2, fs = 44100)
      # Match two signals

      n1 = signal1.length
      n2 = signal2.length

      n = [n1, n2].min
      yt1 = signal1[0..n-1]
      yt2 = signal2[0..n-1]

      yw1 = FFT.fft(yt1)
      yw2 = FFT.fft(yt2)

      amp1 = yw1.abs
      amp2 = yw2.abs

      dt = 1.0 / fs
      freq = FFT.fftfreq(n, dt)

      mode_max = 1024
      mode_range = 0..mode_max-1

      Plot.plot(freq[mode_range], amp1[mode_range], xlabel: "Freq (Hz)", ylabel: "Amp 1")
      Plot.plot(freq[mode_range], amp2[mode_range], xlabel: "Freq (Hz)", ylabel: "Amp 2")

    end

  end
end
