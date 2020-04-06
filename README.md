# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  - ruby '2.5.3'


* System dependencies
  - Docker


* Configuration
  - Run the command ```docker-compose build``` to build docker environment
  - To run the project run the command: ```docker-compose up```


* Database creation
  - To create the database run the command: ```docker-compose run --rm web rails db:create```

* Database initialization
  - To migrate the database run the command: ```docker-compose run --rm web rails db:migrate```
  - To seed the database run the command: ```docker-compose run --rm web rails db:seed```

* How to run the test suite
  - To run the rspec suite, run the command ```docker-compose run --rm web rspec spec/```


* API schema:

  * For searching a book by 'isbn' or 'title':
    ```
    method: get
    ```
    ```
    url: '/api/books?q='9781577312192' -> for searching for a book by isbn
    ```

    or

    ```
    url: '/api/books?q='The Power of Now' -> for searching for a book by title

    ```

  * To get a book by id:
    ```
    method: get
    ```
    ```
    url: '/api/books/2'
    ```

  * To create book:
    ```
    method: post
    ```
    ```
    params:
    {
      book: {
        title: 'Book Title',
        isbn: '8937192379173',
        description: 'Description',
        price: '30.00',
        year: '2000',
        author_id: author.id,
        collection_id: collection.id
      }
    }

    url: '/api/books/
    ```
  * To delete book:
    ```
    method: delete
    ```
    ```
    url: '/api/books/1'
    ```

  * To get a specific collection
    ```
    method: get
    ```
    ```
    url: '/api/collections/2'
    ```

* PS:
  - The Search strategy used for this project is way too simple. With some extra time I would develop a feature using ElasticSearch to index the books into the ElasticSearch database and use it for the searching feature which would result a much better and flexible solution.
  - Beyond unit tests there are also some association tests and integration tests for the api results. Please check out all rspec files.
