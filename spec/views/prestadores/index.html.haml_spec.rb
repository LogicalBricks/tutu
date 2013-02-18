require 'spec_helper'

describe "prestadores/index" do
  before(:each) do
    assign(:prestadores, [
      stub_model(Prestador,
        :nombre => "Nombre"
      ),
      stub_model(Prestador,
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of prestadores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
