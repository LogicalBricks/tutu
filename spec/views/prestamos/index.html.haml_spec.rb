require 'spec_helper'

describe "prestamos/index" do
  before(:each) do
    assign(:prestamos, [
      stub_model(Prestamo),
      stub_model(Prestamo)
    ])
  end

  it "renders a list of prestamos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
