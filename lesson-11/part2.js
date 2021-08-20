// task 1
HINCRBY addresses '127.0.0.1' 1

HINCRBY addresses '127.0.0.2' 2

HGETALL addresses


// task 2
HSET emails 'alex' 'alex111@gmail.com'
HSET emails 'tom' 'tom111@gmail.com'
HSET emails 'kate' 'kate111@gmail.com'

HGETALL emails
HGET emails 'alex'

HSET users 'alex111@gmail.com' 'alex'
HSET users 'tom111@gmail.com' 'tom'
HSET users 'kate111@gmail.com' 'kate'

HGETALL users
HGET users 'alex111@gmail.com'


// task 3
use shop
db.createCollection('catalogs')
db.createCollection('products')

db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])

db.products.insertMany([
	{"name": "ASUS GeForce GT710", "description": "Видеокарта 1Gb ASUS GT710", "price": "4500.00", "catalog_id": "Видеокарты"},
	{"name": "Intel Celeron G5925", "description": "Процессор Intel Celeron Dual Core 5925", "price": "5000.00", "catalog_id": "Процессоры"},
	{"name": "ASUS GTX 1660", "description": "Видеокарта 6Gb Asus GTX 1660 Phoenix", "price": "47000.00", "catalog_id": "Видеокарты"}])

db.catalogs.find()
db.products.find()
db.products.find({catalog_id: "Процессоры"})
