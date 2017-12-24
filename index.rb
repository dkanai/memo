Dir[File.expand_path('../src', __FILE__) + '/*.rb'].each { |file| require file }

puts Memo.new(ARGV[0].to_i).run