# DBdesign

## Model
+ user
  + name
  + email
  + password
  + profile
  + position
  + occupation
  + avatar

+ prototype
  + title
  + catch_copy
  + concept
  + user_id

+ proto_thumbnail
  + thumbnail
  + prototype_id

+ protocomment
  + comment
  + user_id
  + prototype_id

+ like
  + user_id
  + prototype_id


## Association
+ user has_many prototypes
+ prototype belongs_to user
+ prototype has_many protocomments
+ protocomments belongs_to prototype
+ prototype belongs_to tag
+ like belongs_to user
+ like belongs_to prototype
