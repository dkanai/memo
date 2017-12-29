Dir.glob('src/**/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}

puts ScoreOperator.new(ARGV[0].to_i).run


# TODOS
# -全体average出力
# -名前入力
# -日付表示
# -人ごとaverage
# -色をつける
# -html出力