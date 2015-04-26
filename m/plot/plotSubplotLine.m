function plotSubplotLine(rows, cols, index, x, y, x_label = "x", y_label = "y" )

  subplot(rows, cols, index);
  plot(x, y);
  ylabel(y_label);
  xlabel(x_label);

end
