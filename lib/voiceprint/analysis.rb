module Voiceprint

  module Analysis

    def self.match_signals(signal1, signal2, fs = 44100)
      # Match two signals

      n1 = signal1.length
      n2 = signal2.length

      n = [n1, n2].min
      # yt1 = signal1(1:n);
      # yt2 = signal2(1:n);

      # [yw1, amp1, phase1] = fftNoShift(yt1);
      # [yw2, amp2, phase2] = fftNoShift(yt2);

      # amp1_filt = smoothFilt(amp1);
      # amp2_filt = smoothFilt(amp2);

      # dt = 1/ fs;
      # freq = fftFreq(n, dt);
      # time = (1:n)*dt;

      # modeMax = 1024;
      # modes = 1:modeMax;

      # time_array = 1:n;

      # fig_rows = 3;
      # fig_cols = 1;

      # subplot(fig_rows, fig_cols, 1);
      # plot(time, yt1, ';signal 1;', time, yt2, ';signal 2;');
      # ylabel("Signal");
      # xlabel("Time (sec)");

      # subplot(fig_rows, fig_cols, 2);
      # plot(freq(modes), amp1(modes), ';signal 1;', ...
      #                                              freq(modes), amp2(modes), ';signal 2;');
      # ylabel("Amp (no filt)");
      # xlabel("Freq (Hz)");

      # subplot(fig_rows, fig_cols, 3);
      # plot(freq(modes), amp1_filt(modes), ';signal 1;', ...
      #                                                   freq(modes), amp2_filt(modes), ';signal 2;');
      # ylabel("Amp (with filt)");
      # xlabel("Freq (Hz)");

      # [result, corr_coef] = patternMatch(amp1, amp2);
      # printf('The result of matching is %g \n', result);
      # printf('The correltion coefficient is %g \n', corr_coef);


    end

  end

end
