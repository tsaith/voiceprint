function [result, corr_coef] = signalMatch(signal1, signal2, fs = 44100)

  n1 = length(signal1);
  n2 = length(signal2);

  n = min(n1, n2);
  yt1 = signal1(1:n);
  yt2 = signal2(1:n);

  [yw1, amp1, phase1] = fftNoShift(yt1);
  [yw2, amp2, phase2] = fftNoShift(yt2);

  %amp1_filt = smoothFilt(amp1);
  %amp2_filt = smoothFilt(amp2);

  dt = 1/fs;
  df = 1/ (n * dt);
  [mode_min, mode_max] = voiceModeRange(df);
  modes = mode_min:mode_max;

  [result, corr_coef] = patternMatch(amp1, amp2);
  %[result, corr_coef] = patternMatch(amp1(modes), amp2(modes));

end
