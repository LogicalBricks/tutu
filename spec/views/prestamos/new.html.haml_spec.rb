require 'spec_helper'

describe "prestamos/new" do
  before(:each) do
    assign(:prestamo, stub_model(Prestamo).as_new_record)
  end

  it "renders new prestamo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prestamos_path, :method => "post" do
    end
  end
end
