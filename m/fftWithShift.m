function [yw, amp, phase] = fftWithShift(yt)
  % Take FFT and shift zero mode to center
  % yt: signail of time

  yw = fft(yt);
  yw = fftshift(yw);

  amp = abs(yw);
  phase = angle(yw);

end
