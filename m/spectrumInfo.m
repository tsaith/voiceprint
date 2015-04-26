function [yk, amp, phase] = spectrumInfo(yt, fs = 44100)
  % Fourier spectrum information
  % yt: signail of time

  [yk, amp, phase] = fftNoShift(yt);

  n = length(yt);
  dt = 1/ fs;
  freq = fftFreq(n, dt);
  time = (1:n)*dt;

  mode_max = 1024;
  modes = 1:mode_max;

  fig_rows = 3;
  fig_cols = 1;

  n = length(yt);
  subplot(fig_rows, fig_cols, 1), plot(time, yt);
  ylabel ("Signal");
  xlabel ("Time (sec)");

  subplot(fig_rows, fig_cols, 2), plot(freq(modes), amp(modes));
  ylabel ("Amp");
  xlabel ("Freq (Hz)");

  subplot(fig_rows, fig_cols, 3), plot(freq(modes), phase(modes));
  ylabel ("Phase");
  xlabel ("Freq (Hz)");

end
