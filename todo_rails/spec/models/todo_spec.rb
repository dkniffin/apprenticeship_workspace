require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject(:todo) { Todo.new }

  it "has a title" do
    expect(subject.attribute_names).to include("title")
  end

  it "has an is_completed flag" do
    expect(subject.attribute_names).to include("is_completed")
  end
end
