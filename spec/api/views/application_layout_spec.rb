require "spec_helper"

RSpec.describe Api::Views::ApplicationLayout, type: :view do
  let(:layout)   { Api::Views::ApplicationLayout.new({ format: :json }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    expect(rendered).to include('contents')
  end
end
