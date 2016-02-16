class Cohort::Associate < Cohort::Function
  belongs_to :employee
  belongs_to :cohort

  def title
    "Associate"
  end
end
