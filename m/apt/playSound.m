function playSound(file)
% Play sound (.wav file supported)

  cmd = ["play ", file];
  system(cmd);

end
