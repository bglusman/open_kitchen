import EctoEnum
#int type enums
#defenum StatusEnum, registered: 0, active: 1, inactive: 2, archived: 3

#postgres internal enums https://www.postgresql.org/docs/current/static/datatype-enum.html
#defenum StatusEnum, :status, [:registered, :active, :inactive, :archived]

defenum FoodGroup, :food_group, [:protein, :grain, :fruit, :vegetable, :dairy]