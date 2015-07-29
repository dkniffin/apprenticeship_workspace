require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject(:todo) { Todo.new }

  it { is_expected.to respond_to(:title)}
  it { is_expected.to respond_to(:is_completed)}

  describe "valid todo" do
    subject(:todo) { build(:todo) }

    it "is valid" do
      expect(todo).to be_valid
    end
    it "has a title" do
      expect(todo.title).to be_a(String)
    end
  end
  describe "invalid todo" do
    let(:no_title) { build(:todo, title: nil) }

    it "receives an error with no title" do
      expect(no_title).to_not be_valid
      expect(no_title.errors[:title]).to include("can't be blank")
    end
  end
end
