class QuestionController < ApplicationController
  def index
    if Vocabulary.where(:is_active => true).count() > 1
      @notice = "You have #{Vocabulary.where(:is_active => true).count()} Question"
    else
      @notice = "Please, Add Vocabulary"
    end
  end

  def play
    if Vocabulary.where(:is_active => true).count() < 1
      @notice = "Please, Add Vocabulary"
      redirect_to question_index_url
    end

    @vocabularies = Vocabulary.where(:is_active => true)
  end

  def sumscore
    @point = 0
    params.each do |key, value|
      if key[0..4] == "vocab"
        @vocabulary = Vocabulary.find(key[6..-1])
        if @vocabulary != nil
          if value == @vocabulary.word
            @point += 1
          end
        end
      end
    end
    puts "Your name : #{params[:name]}"
    puts "Your point : #{@point}"
  end
end
