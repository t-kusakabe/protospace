# table

### prototypes
|name|type|
|:-:|:-:|
|title|string|
|catch_copy|text|
concept|text|
|user_id|references
|like_count|int|

### thumbnails
|name|type|
|:-:|:-:|
|status|int|
|thumbnail|text|
|prototype_id|references|

### users
|name|type|
|:-:|:-:|
|name|string|
|email|string|
|password|string|
|profile|text|
|position|string|
|ocapation|string|
|avatar|string|

### likes
|name|type|
|:-:|:-:|
|user_id|references|
|prototype_id|references|

### comment
|name|type|
|:-:|:-:|
|content|string|
|prototype_id|references|
|user_id|references|

# association
## prototypes
+ belongs_to :user
+ has_many :thumbnails
+ has_many :comments
+ has_many :likes

## thumbnails
+ belongs_to :prototype

## users
+ has_many :prototypes
+ has_many :comments
+ has_many :likes

## comments
+ belongs_to :user
+ belongs_to :prototype

## likes
+ belongs_to :user
+ belongs_to :prototype
