defmodule College do

  @moduledoc """
  """

  @vsn 0.1

  @doc """
  Parse file to HashDict of rooms
  """

  @spec make_room_list(String.t) :: HashDict.t
  def make_room_list(file_name) do
    { _result, device } = File.open(file_name, [:read, :utf8])
    room_list = HashDict.new()
    process_line(device, room_list)
  end

  defp process_line(device, room_list) do
    data = IO.read(device, :line)
    case data do
      :eof ->
        File.close(device)
        room_list
      _ ->
        new_rooms_list = process_room(data, room_list)
        process_line(device, new_rooms_list)
    end
  end

  defp process_room(data, room_list) do
    [_id, course, room] = String.split(String.strip(data), ",")
    courses_list = HashDict.get(room_list, room)

    case courses_list do
      nil -> updated_list = HashDict.put_new(room_list, room, [course])
      _ -> updated_list = HashDict.put(room_list, room, [ course | courses_list])
    end

    updated_list
  end

end
