class TodosController < ApplicationController

  # GET /
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: "Todo was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_url, notice: "Todo was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_url, notice: "Todo was successfully deleted."
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.update(completed: params[:completed])

    render json: { message: "Success" }
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
