require 'spec_helper'

describe "prestadores/edit" do
  before(:each) do
    @prestador = assign(:prestador, stub_model(Prestador,
      :nombre => "MyString"
    ))
  end

  it "renders the edit prestador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prestadores_path(@prestador), :method => "post" do
      assert_select "input#prestador_nombre", :name => "prestador[nombre]"
    end
  end
end
