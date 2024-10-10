# Подходы к повышению отказоустойчивости БД

## 1)Master-Slave схема

<img src="./figures/master-slave-architecture.png" alt="Master-Slave Architecture" width="400"/>

*Figure 1: Master-Slave Architecture*

Главный узел обрабатывает операции записи, а вторые узлы реплицируют данные для операций чтения. С главного узла доступно чтение.

## 2)Master-Master схема

<img src="./figures/master-master-architecture.png" alt="Master-Master Architecture" width="400"/>

*Figure 2: Master-Master Architecture*

Все узлы действуют как главные базы данных, позволяя выполнять чтение и запись на любом узле, которые затем копируются
на другой.

## 3)Сравнение двух вариантов

| Feature                   | Master-Slave Replication                    | Master-Master Replication                                                 |
|---------------------------|---------------------------------------------|---------------------------------------------------------------------------|
| **Write Operations**      | Only on the master                          | On any master                                                             |
| **Read Operations**       | On slaves                                   | On any master                                                             |
| **Replication Direction** | One-way                                     | Two-way                                                                   |
| **Conflict Handling**     | None                                        | Required for write conflicts                                              |
| **Scalability**           | Read scalability only                       | Write and read scalability                                                |
| **Failover Complexity**   | Difficulties with proper promotion of slave | Easy automatic failover possible                                          |
| **Consistency (Latency)** | Generally consistent, with lag              | Very hard to maintain consistency issues, resolved by conflict resolution |
| **Complexity**            | Simpler to set up and manage                | More complex due to conflict resolution and synchronization               |

## 4)Synchronous vs Asynchronous реплицирование

* Synchronous
  Записи подтверждаются только после репликации на все узлы, что обеспечивает более надежные гарантии согласованности во
  вред производительности.
* Asynchronous
  Записи подтверждаются немедленно, а репликация выполняется позже, что повышает производительность, но создает риск
  потери данных в случае сбоя и есть возможность чтения неактуальных данных.

## 5)Sharding

Данные поделены на части между несколькими узлами.

Хорошее
объяснение: [https://aws.amazon.com/what-is/database-sharding/](https://aws.amazon.com/what-is/database-sharding/)

<img src="./figures/sharding.png" alt="Sharding" width="400"/>

*Figure 3: Sharding*

### Виды шардинга

* Сегментирование на основе диапазона
* Хэшированное сегментирование
* Сегментирование каталогов
* Геосегментирование