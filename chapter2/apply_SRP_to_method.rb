# diametersメソッドは責任を2つ持っている
  # まず繰り返し
  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  # 次に一つの直径を計算する
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

# gear_inchesの場合
  def gear_inches
    ratio * (rim + (tire * 2))
  end

  # ↓
  def gear_inches
    ratio * diameter
  end

  def diameter
    rim +(tire * 2)
  end