#interface, output
class Interface

  def start
    puts 'Hello! What is your name?'
  end

  def choice_info
    puts
    puts 'Enter the number:
      1 - station, 2 - train, 3 - route,
      4 - add station to the route, 5 - remove station from the route,
      6 - set route to the train, 7 - add wagon to the train,
      8 - remove wagon from the train, 9 - move train forward,
      10 - move train backward, 11 - watch station list,
      12 - watch trains on the station, 13 - watch train wagons on the station,
      14 - occupy seat or volume in wagon, 0 - to exit'
  end
end