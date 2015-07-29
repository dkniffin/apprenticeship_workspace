require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "POST /todos" do
    context "with valid parameters" do
      let(:valid_params) { attributes_for(:todo) }

      it "creates a new todo" do
        expect{ post :create, todo: valid_params, format: :json
        }.to change{ Todo.count }.by(1)
      end
      it "responds with the new todo's info" do
        post :create, todo: valid_params, format: :json
        expect(response).to have_http_status(:created)
        todo_json = response_json["todo"]
        expect(todo_json["title"]).to eq(valid_params[:title])
        expect(todo_json["is_completed"]).to eq(valid_params[:is_completed])
      end
    end
    context "with invalid parameters" do
      let(:invalid_params) { attributes_for(:todo, title: nil) }
      it "doesn't create the new todo" do
        expect{ post :create, todo: invalid_params, format: :json
        }.to_not change{ Todo.count }
      end
      it "responds with an error" do
        post :create, todo: invalid_params, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response_json["errors"]).to include("title")
        expect(response_json["errors"]["title"]).to include("can't be blank")
      end
    end
  end
  describe "GET /todos" do
    let(:todos) { create_list(:todo, 3) }

    it "responds with all the todos" do
      todos
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(response_json['todos'].length).to eq(3)
      expect(response_json['todos'].first['title']).to eq(todos.first['title'])
      expect(response_json['todos'].first['is_completed']).to eq(todos.first['is_completed'])
    end
  end
  describe "PUT /todos/:id" do
    context "when the id is valid" do
      context "with valid parameters" do
        let(:todo) { create(:todo) }
        let(:valid_params) { attributes_for(:todo, title: "Test title") }

        it "updates the todo" do
          todo # Create the todo
          expect { put :update, id: todo.id, todo: valid_params, format: :json
          }.to change { todo.reload.title }.from(todo.title).to("Test title")
        end
        it "responds with the updated todo" do
          put :update, id: todo.id, todo: valid_params, format: :json
          expect(response).to have_http_status(:ok)
          todo_json = response_json["todo"]
          expect(todo_json["title"]).to eq(valid_params[:title])
          expect(todo_json["is_completed"]).to eq(valid_params[:is_completed])
        end
      end
    end
  end
  describe "DELETE /todos/:id" do
    context "when the id is valid" do
      let(:todo) { create(:todo) }
      it "deletes the todo" do
        todo
        expect{ delete :destroy, id: todo.id, format: :json
        }.to change { Todo.count }.by(-1)
      end
      it "sends an empty response" do
        todo
        delete :destroy, id: todo.id, format: :json
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
