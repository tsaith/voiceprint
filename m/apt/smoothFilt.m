function y = smoothFilt(x)
  % Return smooth curve after filtering

  % Generate a butterworth filter With order 3
  [b, a] = butter(3, 0.1);

  % Forward and backword filtering
  y = filtfilt(b, a, x);

end
