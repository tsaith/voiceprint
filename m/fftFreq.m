function freq = fftFreq(n, d = 1)
  % Return the Discrete Fourier Transform sample frequencies

  val = 1 / (n * d);

  if mod(n, 2) == 0
    freq = (-n/2 : (n/2 - 1))*val;
  else
    freq = (-(n-1)/2 : (n-1)/2)*val;
  end
  freq = ifftshift(freq);

end
