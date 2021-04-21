class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @weekdays = ["Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira"]
    @timetables = ["8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]

    if params[:new_day].present? && ! params[:new_day].blank?
      @today = params[:new_day].to_date
    else
      @today = Time.current.strftime('%d/%m/%Y').to_date
    end

    if @today.monday? || @today.sunday? || @today.saturday?
      add = 0
    elsif @today.tuesday?
      add = 1
    elsif @today.wednesday?
      add = 2
    elsif @today.thursday?
      add = 3
    elsif @today.friday?
      add = 4
    end

    @dateIni = (@today - add.days)

    @dates = []
    dd = 0
    @weekdays.each do |_day|
      @dates << (@dateIni + dd.days).strftime('%d/%m/%Y')
      dd += 1
    end

  end

end
