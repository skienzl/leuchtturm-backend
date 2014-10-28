class Accuracy
  @id

  @@names = {
      0 => I18n.t('LOW'),
      1 => I18n.t('MEDIUM'),
      2 => I18n.t('HIGH')
  }

  def initialize(id)
    raise ArgumentError.new("Incorrect Technology Identifier") unless @@names[id]!=nil
    @id = id
  end

  def self.accuracies
    [
        Accuracy.new(0),
        Accuracy.new(1),
        Accuracy.new(2)
    ]
  end


  def self.LOW
    0
  end

  def self.MEDIUM
    1
  end

  def self.HIGH
    2
  end

  def name
    @@names[@id]
  end

  def id
    @id
  end
end