module Voiceprint
  module Plot

    class << self

      def plot(*args, **opts)

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
        else
          raise "Invalid arguments!"
        end

        # Reduce data
        x = select_sample(x)
        y = select_sample(y)

        # Make plot
        plot = Nyaplot::Plot.new
        df = Nyaplot::DataFrame.new({x:x, y:y})
        plot.add_with_df(df, :line, :x, :y)

        xlabel = opts[:xlabel] || "x"
        ylabel = opts[:ylabel] || "y"
        plot.x_label(xlabel)
        plot.y_label(ylabel)
        plot.show
      end

      private

      def select_sample(array)
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
end
