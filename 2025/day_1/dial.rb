class Dial
  def initialize
    @points_at = 50
  end

  def rotate direction, distance
    positions_to_move = distance % 100

    rotate_right!(positions_to_move) if direction == 'R'
    rotate_left!(positions_to_move) if direction == 'L'

    @points_at
  end

  private

    def rotate_right! positions_to_move
      distance_from_first_zero = @points_at + positions_to_move

      if distance_from_first_zero > 99
        @points_at = distance_from_first_zero - 99 - 1
      else
        @points_at += positions_to_move
      end
    end

    def rotate_left! positions_to_move
      distance_from_first_zero = @points_at - positions_to_move

      if distance_from_first_zero < 0
        @points_at = 99 - (distance_from_first_zero.abs - 1)
      else
        @points_at -= positions_to_move
      end
    end
end