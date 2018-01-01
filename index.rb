Dir.glob('src/**/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}

ScoreOperator.new(ARGV[0]).run.print

# TODOS
# -日付表示
# -名前入力
# -人ごとaverage