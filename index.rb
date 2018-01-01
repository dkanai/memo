Dir.glob('src/**/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}

StdOut.print(ScoreOperator.factory(ARGV[0].to_i).run)


# TODOS
# -色をつける
# -html出力
# -日付表示
# -名前入力
# -人ごとaverage