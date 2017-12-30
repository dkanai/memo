Dir.glob('src/**/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}

puts ScoreOperator.factory(ARGV[0].to_i).run


# TODOS
# -名前入力
# -日付表示
# -人ごとaverage
# -色をつける
# -html出力