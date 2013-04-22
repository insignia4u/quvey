["open", "yes/no", "multiple-choise", "options"].each do |t|
  QuestionType.create!(:name => t)
end
