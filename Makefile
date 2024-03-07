postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres:16.2-alpine3.19

createdb:
	docker exec -it postgres16 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres16 dropdb -U postgres simple_bank

migrateup:
	migrate -path db/migration/ -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration/ -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown