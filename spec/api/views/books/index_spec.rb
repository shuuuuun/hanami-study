RSpec.describe Api::Views::Books::Index, type: :view do
  let(:exposures) { Hash[format: :json] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/books/show.json.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
