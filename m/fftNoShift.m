function [yw, amp, phase] = fftNoShift(yt)
  % Take FFT without shift zero mode to center
  % yt: signail of time

  yw = fft(yt);
  amp = abs(yw);
  phase = angle(yw);

end
