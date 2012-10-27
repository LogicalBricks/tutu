require 'spec_helper'

describe "lectores/show" do
  before(:each) do
    @lector = assign(:lector, stub_model(Lector,
      :nombre => "Nombre",
      :primer_apellido => "Primer Apellido",
      :segundo_apellido => "Segundo Apellido",
      :grado => "Grado",
      :grupo => "Grupo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Primer Apellido/)
    rendered.should match(/Segundo Apellido/)
    rendered.should match(/Grado/)
    rendered.should match(/Grupo/)
  end
end
