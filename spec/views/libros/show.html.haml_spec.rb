require 'spec_helper'

describe "libros/show" do
  before(:each) do
    @libro = assign(:libro, stub_model(Libro,
      :titulo => "Titulo",
      :author => "Author",
      :editorial => "Editorial",
      :isbn => "Isbn"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Titulo/)
    rendered.should match(/Author/)
    rendered.should match(/Editorial/)
    rendered.should match(/Isbn/)
  end
end
