% Initialize testing env

% Load packages
pkg load signal

addsearchpath;
wave1 = file2wave("../data/turn_on.wav");
%wave2 = file2wave("../data/turn_on_cmp.wav");
wave2 = file2wave("../data/turn_off_cmp.wav");
%wave2 = file2wave("../data/open_cmp.wav");
%wave2 = file2wave("../data/close_cmp.wav");

n1 = length(wave1.signal);
n2 = length(wave2.signal);
n = min(n1, n2);

yt1 = wave1.signal(1:n);
yt2 = wave2.signal(1:n);

yt1_filt = smoothFilt(yt1);
yt2_filt = smoothFilt(yt2);

[yw1, amp1, phase1] = fftNoShift(yt1);
[yw2, amp2, phase2] = fftNoShift(yt2);

amp1_filt = smoothFilt(amp1);
amp2_filt = smoothFilt(amp2);

modeMax = 1024;
modes = 1: modeMax;
