require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "POST /todos" do
    context "with valid parameters" do
      subject(:valid_params) { attributes_for(:todo) }

      it "creates a new todo" do
        expect{ post :craete, todo: valid_params
        }.to change{ Todo.count }.by(1)
      end
      it "responds with the new todo's info"
    end
    context "with invalid parameters" do
      it "doesn't create the new todo"
      it "responds with an error"
    end
  end
  describe "GET /todos"
  describe "PUT /todos/3"
  describe "DELETE /todos/3"
end
