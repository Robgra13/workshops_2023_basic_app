
require 'weather_presenter'
describe WeatherPresenter do
  let(:data) do
    {
      'current' => {
        'condition' => {
          'text' => 'Sunny',
          'icon' => 'sun-icon'
        },
        'temp_c' => 20
      },
      'location' => {
        'name' => 'Sample City'
      }
    }
  end


  subject(:weather_presenter) { WeatherPresenter.new(data) }

  describe '#encourage_text' do
    context 'when it is nice weather to read outside' do
      it 'returns the correct encouragement text' do
        expect(weather_presenter.encourage_text).to eq("Get some snacks and go read a book in a park!")
      end
    end

    context 'when it is not nice weather to read outside' do
      it 'returns the correct encouragement text' do
        # Modify data to simulate not-so-nice weather
        data['current']['condition']['text'] = 'Rainy'
        expect(weather_presenter.encourage_text).to eq("It's always a good weather to read a book!")
      end
    end
  end

  describe '#description' do
    it 'returns the current weather condition description' do
      expect(weather_presenter.description).to eq('Sunny')
    end
  end

  describe '#temperature' do
    it 'returns the current temperature in Celsius' do
      expect(weather_presenter.temperature).to eq(20)
    end
  end

  describe '#icon' do
    it 'returns the current weather condition icon' do
      expect(weather_presenter.icon).to eq('sun-icon')
    end
  end

  describe '#location' do
    it 'returns the location name' do
      expect(weather_presenter.location).to eq('Sample City')
    end
  end
end
