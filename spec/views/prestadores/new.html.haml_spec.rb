require 'spec_helper'

describe "prestadores/new" do
  before(:each) do
    assign(:prestador, stub_model(Prestador,
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new prestador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prestadores_path, :method => "post" do
      assert_select "input#prestador_nombre", :name => "prestador[nombre]"
    end
  end
end
