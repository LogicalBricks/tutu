module LectoresHelper
  
  def edad(lector)
    actual = Time.now.utc.to_date
    nacimiento = lector.fecha_nacimiento
    actual.year - nacimiento.year - ((actual.month > nacimiento.month || (actual.month == nacimiento.month && actual.day >= nacimiento.day)) ? 0 : 1) 
  end

end
