class ScoresController < ApplicationController

  # GET /scores
  def index
    @scores = Score.order(created_at: :desc)
  end

  # POST /scores
  def create
    if params[:name] != nil
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

      if Score.create(name: params[:name], score: @point)
        redirect_to scores_url
      else
        redirect_to question_index_url
      end
    end
  end
end
