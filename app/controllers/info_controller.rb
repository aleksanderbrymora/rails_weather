class InfoController < ApplicationController
  require 'open_weather'

  def index
    @city = City.last
    options = {
      units: "metric",
      APPID: Rails.application.secrets.open_weather_key
    }
    report = OpenWeather::Current.city(@city.name, options)
    @weather = report["weather"].first
  end
end
