require 'spec_helper'

describe "prestamos/edit" do
  before(:each) do
    @prestamo = assign(:prestamo, stub_model(Prestamo))
  end

  it "renders the edit prestamo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prestamos_path(@prestamo), :method => "post" do
    end
  end
end
