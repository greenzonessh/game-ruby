class ScoresController < ApplicationController

  # GET /scores
  def index
    @scores = Score.order(created_at: :desc)
  end

  # POST /scores
  def create
    if params[:name] != nil
      point = 0
      wrong = []
      pass = []
      params.each do |key, value|
        if key[0..4] == "vocab"
          vocabulary = Vocabulary.find(key[6..-1])
          if vocabulary != nil
            if value == vocabulary.word
              point += 1
              pass.push(value)
            else
              wrong.push(value)
            end
          end
        end
      end

      respond_to do |format|
        if Score.create(name: params[:name], score: point)
          format.html { redirect_to question_index_url, notice: "Your Score : #{point}, Your Correct Answer : #{pass}, Your Wrong Answer : #{wrong}" }
        else
          redirect_to question_index_url
        end
      end
    end
  end
end
