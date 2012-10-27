require 'spec_helper'

describe "libros/index" do
  before(:each) do
    assign(:libros, [
      stub_model(Libro,
        :titulo => "Titulo",
        :author => "Author",
        :editorial => "Editorial",
        :isbn => "Isbn"
      ),
      stub_model(Libro,
        :titulo => "Titulo",
        :author => "Author",
        :editorial => "Editorial",
        :isbn => "Isbn"
      )
    ])
  end

  it "renders a list of libros" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Editorial".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
  end
end
