#DBdesign

##Model
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
  + main_thumbnail
  + sub_thumbnail
  + catch_copy
  + concept
  + user_id

+ protocomment
  + comment
  + user_id
  + prototype_id

+ like
  + user_id
  + prototypze_id


##Association
+ user has_many prototypes
+ prototype belongs_to user
+ prototype has_many protocomments
+ protocomments belongs_to prototype
+ prototype belongs_to tag
+ belongs_to user
+ belongs_to prototype

