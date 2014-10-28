class Technology
  @id

  @@names = {
      0 => I18n.t('GPS'),
      1 => I18n.t('BEACON'),
      2 => I18n.t('NFC'),
      3 => I18n.t('QR')
  }

  def initialize(id)
    raise ArgumentError.new("Incorrect Technology Identifier") unless @@names[id]!=nil
    @id = id
  end


  def self.technologies
    [
        Technology.new(0),
        Technology.new(1),
        Technology.new(2),
        Technology.new(3)
    ]
  end

  def self.GPS
    0
  end

  def self.BEACON
    1
  end

  def self.NFC
    2
  end

  def self.QR
    3
  end

  def name
    @@names[@id]
  end

  def id
    @id
  end
end