class QuestionController < ApplicationController
  def index
    if Vocabulary.where(:is_active => true).count() >= 1
      @notices = "You have #{Vocabulary.where(:is_active => true).count()} Question"
    else
      @notices = "Please, Add Vocabulary"
    end
  end

  def play
    if Vocabulary.where(:is_active => true).count() < 1
      @notices = "Please, Add Vocabulary"
      redirect_to question_index_url
    end

    @vocabularies = Vocabulary.where(:is_active => true)
  end
end
