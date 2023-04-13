class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :get_subjets, only: [:edit, :new]

  def index
    #Incluir model do relacionamento p/ evitar querys desnecessarias(problemas N + 1)
    @questions = Question.includes(:subject)
                         .order(:description)
                         .page(params[:page]).per(8)
    #Primeira query - @questions = Question.all.order(:description).page(params[:page]).per(8)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      redirect_to admins_backoffice_questions_path(@question), notice: "Questão cadastrado com sucesso!!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update(params_question)
      redirect_to admins_backoffice_questions_path(@question), notice: "Questão atualizado com sucesso!!!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_path, notice: "Questão excluido com sucesso!!!"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def params_question
    params.require(:question).permit(:description, :subject_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_subjets
    @subjects = Subject.all
  end
end
