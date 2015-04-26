function [mode_min, mode_max] = voiceModeRange(df, freq_min = 50, freq_max = 300)
  % df: Frequency interval

  mode_min = round(freq_min/df);
  mode_max = round(freq_max/df);

end
