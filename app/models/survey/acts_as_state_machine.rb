class Survey
  module ActsAsStateMachine
    extend ActiveSupport::Concern

    included do
      default_value_for :state, "draft"

      scope :draft,     where( state: "draft" )
      scope :published, where( state: "published" )
      scope :archived,  where( state: "archived" )
    end

    def draft?;     state == "draft";     end
    def published?; state == "published"; end
    def archived?;  state == "archived";  end

    def publish!
      publication.trigger(:publish)
      save!
    end

    def archive!
      publication.trigger(:archive)
      save!
    end

  protected
    def publication
      @publication ||= begin
        sm = MicroMachine.new(state || "draft")

        sm.when(:publish, "draft" => "published")
        sm.when(:archive, "draft" => "archived", "published" => "archived")

        sm.on(:any) { self.state = publication.state }

        sm
      end
    end
  end
end
