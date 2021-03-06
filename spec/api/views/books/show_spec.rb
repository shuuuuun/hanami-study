RSpec.describe Api::Views::Books::Show, type: :view do
  # let(:book)      { double('book') }
  # let(:book)      { create('book') }
  # let(:book)      { build('book') }
  let(:book)      { Fabricate.create(:book) }
  let(:exposures) { Hash[format: :json, book: book] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/books/show.json.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:rendered_json) { JSON.parse(rendered).deep_symbolize_keys }

  # before do
  #   book.stub(:id) { 1 }
  # end

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'response' do
    # binding.pry
    expect(rendered_json[:id]).to eq book.id
  end
end
