module Voiceprint
  module Plot

    def self.plot(*args, **opts)
      case args.size
      when 1
        y = args.first
        points = y.size
        x = []

        (1..points).each do |index|
          x.push(index)
        end
      when 2
        x = args.first
        y = args.last

      when 4
          x = args[0]
          y = args[1]
          x1 = args[2]
          y1 = args[3]

      when 6
          x = args[0]
          y = args[1]
          title = args[2].gsub(/[;]/, '')
          x1 = args[3]
          y1 = args[4]
          title1 = args[5].gsub(/[;]/, '')
      else
        raise "Invalid arguments!"
      end

      plot_two_lines = (defined? y1) && y1 ? true : false

      # Reduce data
      x = select_sample(x)
      y = select_sample(y)

      if plot_two_lines
        x1 = select_sample(x1)
        y1 = select_sample(y1)
      end

      # Make plot
      plot = Nyaplot::Plot.new
      line = plot.add(:line, x, y)

      if plot_two_lines
        line1 = plot.add(:line, x1, y1)
        line.title(title)
        line1.title(title1)
        line1.color('#008000') # green
      end

      xlabel = opts[:xlabel] || "x"
      ylabel = opts[:ylabel] || "y"
      plot.x_label(xlabel)
      plot.y_label(ylabel)
      plot.legend(true)
      plot.show
    end

    private

    def self.select_sample(array)
      num_total = array.length
      num_threshold = 8192
      num_plot = 1024
      num_sample = num_total / num_plot

      if num_total >= num_threshold
        array = array.select.with_index {|e, i| i % num_sample == 0}
      end
      array
    end

  end
end
