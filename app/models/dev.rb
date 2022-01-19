class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.pluck(:item_name).include?(item_name)
    end

    def give_away(dev, freebie)
        if self.freebies.include?(freebie)
            freebie.dev = dev
            freebie.save
            "#{self.name} gave #{dev.name} a #{freebie.item_name}"
        else "#{self.name} doesn't own a #{freebie.item_name}!"
        end
    end
end
