RSpec.describe Web::Controllers::Sessions::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
