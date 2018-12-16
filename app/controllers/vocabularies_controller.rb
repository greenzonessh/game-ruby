class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: [:edit, :update, :destroy]

  # GET /vocabularies
  def index
    @vocabularies = Vocabulary.where(:is_active => true)
  end

  # GET /vocabularies/new
  def new
    @vocabulary = Vocabulary.new
  end

  # GET /vocabularies/1/edit
  def edit
  end

  # POST /vocabularies
  def create
    @vocabulary = Vocabulary.new(vocabulary_params)

    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to vocabularies_url, notice: 'Vocabulary was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /vocabularies/1
  def update
    respond_to do |format|
      if @vocabulary.update(vocabulary_params)
        format.html { redirect_to vocabularies_url, notice: 'Vocabulary was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /vocabularies/1
  def destroy
    @vocabulary.is_active = false
    @vocabulary.save()
    respond_to do |format|
      format.html { redirect_to vocabularies_url, notice: 'Vocabulary was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocabulary_params
      params.require(:vocabulary).permit(:word)
    end
end
