module ApplicationHelper

  def data_ptbr(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def whos_ambient_rails
    if Rails.env.production?
      "Production Ambient"
    elsif Rails.env.development?
      "Dev Ambient"
    else
      "Test Ambient"
    end

  end

end
