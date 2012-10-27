require 'spec_helper'

describe "lectores/new" do
  before(:each) do
    assign(:lector, stub_model(Lector,
      :nombre => "MyString",
      :primer_apellido => "MyString",
      :segundo_apellido => "MyString",
      :grado => "MyString",
      :grupo => "MyString"
    ).as_new_record)
  end

  it "renders new lector form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lectores_path, :method => "post" do
      assert_select "input#lector_nombre", :name => "lector[nombre]"
      assert_select "input#lector_primer_apellido", :name => "lector[primer_apellido]"
      assert_select "input#lector_segundo_apellido", :name => "lector[segundo_apellido]"
      assert_select "input#lector_grado", :name => "lector[grado]"
      assert_select "input#lector_grupo", :name => "lector[grupo]"
    end
  end
end
