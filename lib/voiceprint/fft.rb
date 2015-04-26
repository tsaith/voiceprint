module Voiceprint
  module FFT
    class << self
      include GSL::FFT

      def fft(a)
        n = a.length
        data = a.to_gv.to_complex

        table = ComplexWavetable.alloc(n)
        space = ComplexWorkspace.alloc(n)
        ffted = data.forward(table, space)/n

        ffted.to_na
      end

      def ifft(a)
        n = a.length
        data = a.to_gv
        table = ComplexWavetable.alloc(n)
        space = ComplexWorkspace.alloc(n)
        iffted = data.backward(table, space)

        iffted.to_na
      end

      def fftfreq(n, d = 1)
        if n % 2 == 0
          f = (-n/2..n/2-1).map {|e| e}
        else
          f = (-(n-1)/2..(n-1)/2).map {|e| e}
        end
        f = f.rotate(n/2)
        na = to_narray(f)
        na/(n*d)
      end


      private

      def to_narray(a)
        n = a.length
        na = NArray.float(n)
        (0..n-1).each do |index|
          na[index] = a[index]
        end
        na
      end

    end
  end
end
