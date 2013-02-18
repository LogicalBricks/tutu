require 'spec_helper'

describe "prestadores/show" do
  before(:each) do
    @prestador = assign(:prestador, stub_model(Prestador,
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
  end
end
