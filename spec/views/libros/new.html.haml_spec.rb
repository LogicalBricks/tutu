require 'spec_helper'

describe "libros/new" do
  before(:each) do
    assign(:libro, stub_model(Libro,
      :titulo => "MyString",
      :author => "MyString",
      :editorial => "MyString",
      :isbn => "MyString"
    ).as_new_record)
  end

  it "renders new libro form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => libros_path, :method => "post" do
      assert_select "input#libro_titulo", :name => "libro[titulo]"
      assert_select "input#libro_author", :name => "libro[author]"
      assert_select "input#libro_editorial", :name => "libro[editorial]"
      assert_select "input#libro_isbn", :name => "libro[isbn]"
    end
  end
end
