puts "[Seed Data] Default question types"
["open", "yes/no", "multiple-choise", "options"].each do |type|
  puts "[Seed Data] >> Creating type '#{type}'"
  QuestionType.create!(:name => type)
end
puts "[Seed Data] >> Done!"
