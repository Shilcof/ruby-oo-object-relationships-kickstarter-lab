class Backer

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end
    
    def backed_projects
        ProjectBacker.all.select{|i| i.backer == self}.collect(&:project)
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

end