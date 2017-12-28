Dir.glob('src/**/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}

puts MemoOperator.new(ARGV[0].to_i).run