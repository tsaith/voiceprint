function freq = lin2melfreq(lin_freq)
  % Linear frequency to Mel frequency

  freq = 1125*log(1+lin_freq/700);

end
