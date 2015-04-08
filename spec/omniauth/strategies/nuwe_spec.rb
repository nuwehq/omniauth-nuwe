require 'spec_helper'

describe "OmniAuth::Strategies::Nuwe" do
  subject do
    OmniAuth::Strategies::Nuwe.new(nil, @options || {})
  end

  context 'client options' do
    it 'has the correct name' do
      expect(subject.options.name).to eq('nuwe')
    end

    it 'has correct OAuth endpoint' do
      expect(subject.options.client_options.site).to eq('https://api.nuwe.co')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://api.nuapi.co/oauth/authorize')
    end
  end

  context 'uid' do
    before :each do
      @raw_info = { 'user' => { 'id' => 123} }
      allow(subject).to receive_messages(:raw_info => @raw_info)
    end

    it 'returns the correct id from raw_info' do
      expect(subject.uid).to eq(123)
    end
  end

  describe '#info' do
    before :each do
      @raw_info = { 'user' => { 'id' => 123,
                                'email' => 'fred@example.com'},
        'profile' => {
        'first_name' => 'Fred',
        'last_name' => 'Smith',
        'sex' => 'F',
        'birth_date' => '1981-08-01',
        'activity' => 2 }
      }
      allow(subject).to receive_messages(:raw_info => @raw_info)
    end

    context 'when data is present in raw info' do
      it 'returns the first name' do
          expect(subject.info[:first_name]).to eq('Fred')
      end

      it 'returns the last name' do
          expect(subject.info[:last_name]).to eq('Smith')
      end

      it 'returns the email' do
          expect(subject.info[:email]).to eq('fred@example.com')
      end

      it 'returns the sex' do
          expect(subject.info[:sex]).to eq('F')
      end

      it 'returns the birthdate' do
          expect(subject.info[:birth_date]).to eq('1981-08-01')
      end

      it 'returns the activity' do
          expect(subject.info[:activity]).to eq(2)
      end
    end
  end
end
