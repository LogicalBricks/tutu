require 'spec_helper'

describe "lectores/index" do
  before(:each) do
    assign(:lectores, [
      stub_model(Lector,
        :nombre => "Nombre",
        :primer_apellido => "Primer Apellido",
        :segundo_apellido => "Segundo Apellido",
        :grado => "Grado",
        :grupo => "Grupo"
      ),
      stub_model(Lector,
        :nombre => "Nombre",
        :primer_apellido => "Primer Apellido",
        :segundo_apellido => "Segundo Apellido",
        :grado => "Grado",
        :grupo => "Grupo"
      )
    ])
  end

  it "renders a list of lectores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Primer Apellido".to_s, :count => 2
    assert_select "tr>td", :text => "Segundo Apellido".to_s, :count => 2
    assert_select "tr>td", :text => "Grado".to_s, :count => 2
    assert_select "tr>td", :text => "Grupo".to_s, :count => 2
  end
end
