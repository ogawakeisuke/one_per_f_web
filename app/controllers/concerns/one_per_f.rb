require "ruby-audio"
require "narray"
require "fftw3"
require "fft_scratch"
require 'regression_line'

class OnePerF
  attr_accessor :results

  def initialize(file_path)

    window_size = 1024
    @results = Array.new

    buf = RubyAudio::Buffer.float(window_size)

    RubyAudio::Sound.open(file_path) do |snd|
      while snd.read(buf) != 0
        na = NArray.to_na(buf.to_a)

        fft_slice = FFTW3.fft(na, -1).to_a[0, window_size / 2].collect { |complex| Math.log10(complex.abs / (window_size / 2) )}
        
        @results << RegLine.new(fft_slice).regression_slope
      end
    end
  end

  def self.parse(file_path)
    opf = self.new(file_path)
    return (opf.results.inject { |sum, x| sum += x } / opf.results.size)
  end
end

# -0.0001に近づけば高評価、だと思う