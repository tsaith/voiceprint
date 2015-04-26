function waveInfo(wave, frame_size = 512, frame_overlap = 128)
  % Show the information of an audio file with .wav extension

  y = wave.signal;
  fs = wave.fs;
  bits = wave.bits;

  samples = length(y);
  time = sampleTime(wave);

  dt = 1/fs;

  fprintf('Sampling rate = %g samples/second \n', fs);
  fprintf('Bit resolution = %g bits/sample \n', bits);
  fprintf('Number of sampls = %g \n', samples);
  fprintf('Time interval = %g seconds \n', dt);
  fprintf('Duration (T) = %g seconds \n', samples*dt);

  fprintf('Plotting ... \n');

  fig_rows = 3;
  fig_cols = 1;

  signal = y(:,1);  % Left channel
  subplot(fig_rows, fig_cols, 1), plot(time, signal);
  ylabel ("Signal");
  xlabel ("Time (sec)");

  % Find frame and time
  frame = enframe(wave.signal, frame_size, frame_overlap);
  ftime = frameTime(frame, wave.fs);

  % Volume vs time
  volume = frame2volume(frame);
  subplot(fig_rows, fig_cols, 2), plot(ftime, volume);
  ylabel ("Volume (decibel)");
  xlabel ("Time (sec)");

  % ZCR vs time
  zcr = frame2zcr(frame);
  subplot(fig_rows, fig_cols, 3), plot(ftime, zcr);
  ylabel ("zcr");
  xlabel ("Time (sec)");


end
