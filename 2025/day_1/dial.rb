class Dial
  def initialize
    @points_at = 50
  end

  def rotate(direction, size)
    if direction == 'R'
      new_pointing = @points_at + size

      if new_pointing > 99
        @points_at = (new_pointing - 1) - 99
      else
        @points_at += size
      end
    end

    if direction == 'L'
      new_pointing = @points_at - size

      if new_pointing < 0
        @points_at = 99 - (new_pointing.abs - 1)
      else
        @points_at -= size
      end
    end

    @points_at
  end
end