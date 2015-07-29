class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  protect_from_forgery with: :null_session,
    if: Proc.new { |c| c.request.format == 'application/json' }

  # GET /todos
  def index
    respond_with Todo.all
  end

  # POST /todos
  def create
    @todo = Todo.create(todo_params)
    respond_with @todo
  end

  # PATCH/PUT /todos/:id
  def update
    @todo.update(todo_params)
    respond_with @todo, json: @todo
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    respond_with @todo
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :is_completed)
    end
end
