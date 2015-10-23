#File: lib/tasks/bar.rake
#require 'byebug'

class Bar
	def bake
		"whatever"
	end
end

class BarOutput
  def self.banner text
    spit '*' * 60
    spit " #{text}"
    spit '*' * 60
  end

  def self.spit string
    puts string
  end
end

namespace :foo do
  desc "bake some bars"
  task :bake_a_bar do # :environment do
    BarOutput.banner " Step back: baking in action!"
    BarOutput.spit Bar.new.bake
    BarOutput.banner " All done. Thank you for your patience."
  end
end

