Dir.glob('src/**/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}

puts MemoOperator.new(ARGV[0].to_i).run


# TODOS
# -日付表示
# -点数入力
# -数値,範囲validation
# -全体average出力
# -名前入力
# -人ごとaverage