RSpec.describe Api::Views::Books::Index, type: :view do
  let(:books)     { Array.new }
  let(:exposures) { Hash[format: :json, books: books] }
  let(:view)      { described_class.new(nil, exposures) }
  let(:rendered)  { view.render }
  let(:rendered_json) { JSON.parse(rendered) }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'response' do
    # binding.pry
    expect(rendered_json).to eq []
  end
end
