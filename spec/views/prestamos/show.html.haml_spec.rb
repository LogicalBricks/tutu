require 'spec_helper'

describe "prestamos/show" do
  before(:each) do
    @prestamo = assign(:prestamo, stub_model(Prestamo))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
