# 複雑なデータ構造
class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    data.collect { |cell| cell[0] + cell[1] *2 }
  end
end

# 以下のような構造のデータが必要
@data = [[622, 20], [622, 23], [559, 30], [559, 40]]

# Structクラスで意味と構造を分ける
# diameterメソッドは配列の内部構造を知らなくなった
class RevealingReferences
  attr_reader:wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    data.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  # rimとtireに反応する小さくて軽量なオブジェクトを作っている
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheek.new(cell[0], cell[1]) }
  end
end

# diametersメソッドは責任を2つ持っている
