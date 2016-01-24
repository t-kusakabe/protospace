#DBdesign

##Model
+ user
+ prototype
+ protocomment
+ tag

##Association
+ user has_many prototypes
+ prototype belongs_to user
+ prototype has_many protocomments
+ protocomments belongs_to prototype
+ tag has_many prototype
+ prototype belongs_to tag

