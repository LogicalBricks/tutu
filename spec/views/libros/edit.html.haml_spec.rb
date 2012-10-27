require 'spec_helper'

describe "libros/edit" do
  before(:each) do
    @libro = assign(:libro, stub_model(Libro,
      :titulo => "MyString",
      :author => "MyString",
      :editorial => "MyString",
      :isbn => "MyString"
    ))
  end

  it "renders the edit libro form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => libros_path(@libro), :method => "post" do
      assert_select "input#libro_titulo", :name => "libro[titulo]"
      assert_select "input#libro_author", :name => "libro[author]"
      assert_select "input#libro_editorial", :name => "libro[editorial]"
      assert_select "input#libro_isbn", :name => "libro[isbn]"
    end
  end
end
