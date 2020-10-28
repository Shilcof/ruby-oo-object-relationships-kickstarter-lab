class Project

    attr_reader :title

    @@all = []

    def initialize(title)
        @title = title
        save
    end

    def save
        @@all << self
    end

    def backers
        ProjectBacker.all.select{|i| i.project == self}.collect(&:backer)
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

end