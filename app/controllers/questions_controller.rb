class QuestionsController < ApplicationController
  before_action :load_question, only: %i[ show edit update destroy ]

  before_action :authorize_user, except: [:create]

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    @question.author = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to user_path(@question.user), notice: "Вопрос задан" }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to user_path(@question.user), notice: "Вопрос сохранён" }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    user = @question.user
    @question.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user), notice: "Вопрос удалён!!!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_question
      @question = Question.find(params[:id])
    end

  def authorize_user
    reject_user unless @question.user == current_user
  end

    # Only allow a list of trusted parameters through.
  def question_params
    if current_user.present? &&
      params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end
end
