module Voiceprint
  module FFTW
    class << self
      include NumRu

      def fft(a)
        num = a.length
        FFTW3.fft(a, -1)/num
      end

      def ifft(a)
        FFTW3.fft(a, 1)
      end

    end
  end
end
