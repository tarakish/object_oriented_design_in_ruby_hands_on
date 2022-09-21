# 1
chainring = 52
cog = 11
ratio = chainring / cog.to_f
puts ratio

chainring = 30
cog = 27
ratio = chainring / cog.to_f
puts ratio

# 自転車やギアがオブジェクトの候補。
# 上記のコードでは自転車の振る舞いについては記述がないので不適切
# 一方ギアにはチェーンとコグ、比率がある。つまりデータと振る舞いがあるためクラスとしてふさわしそう。

# 2
class Gear
  attr_reader :chainring, :cog
  def initialize(:chainring, :cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11).ratio
puts Gear.new(30, 27).ratio

# 「車輪の大きさの違いも考慮して！」
# ギアインチ = 車輪の直径 x ギア比
# 車輪の直径 = リムの直径 + タイヤの厚みの２倍
# アクセサではなくinitializeで定義しているのはキーワード引数にせずエラーを起こすため？

# 3
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(:chainring, :cog, :rim, :tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * (rim + (tire * 2))
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(30, 27, 24, 1.25).gear_inches

# 以前動いていた以下のコードは動かない
puts Gear.new(52, 11).ratio
# ArgumentError: wrong number of arguments (2 for 4)

# 4 クラスには切り出さずに単一責任を示唆する
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(:chainring, :cog, :rim, :tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end

# 5 Wheelクラスの切り出し
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(:chainring, :cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = rire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.nwe(26, 1.5)
puts Gear.new(52, 11, @wheel).gear_inches
puts Gear.new(52, 11).ratio