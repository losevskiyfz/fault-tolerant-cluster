# ������� � ��������� ������������������ ��

## 1)Master-Slave �����
![Master-Slave Architecture](./figures/master-slave-architecture.png)
*Figure 1: Master-Slave Architecture*

������� ���� ������������ �������� ������, � ������ ���� ����������� ������ ��� �������� ������.

## 2)Master-Master �����
![Master-Slave Architecture](./figures/master-master-architecture.png)
*Figure 2: Master-Master Architecture*

��� ���� ��������� ��� ������� ���� ������, �������� ��������� ������ � ������ �� ����� ����, ������� ����� ���������� �� ������.

## 3)��������� ���� ���������
| Feature                | Master-Slave Replication                    | Master-Master Replication                                     |
|------------------------|---------------------------------------------|---------------------------------------------------------------|
| **Write Operations**    | Only on the master                          | On any master                                                 |
| **Read Operations**     | On slaves                                   | On any master                                                 |
| **Replication Direction** | One-way (master ? slaves)                   | Two-way (masters ? masters)                                   |
| **Conflict Handling**   | None                                        | Required for write conflicts                                  |
| **Scalability**         | Read scalability only                       | Write and read scalability                                    |
| **Failover Complexity** | Difficulties with proper promotion of slave | Easy automatic failover possible                              |
| **Consistency (Latency)** | Generally consistent, with lag              | Potential consistency issues, resolved by conflict resolution |
| **Complexity**          | Simpler to set up and manage                | More complex due to conflict resolution and synchronization   |


## 4)Synchronous vs Asynchronous ��������������
* Synchronous
������ �������������� ������ ����� ���������� �� ��� ����, ��� ������������ ����� �������� �������� ��������������� �� ���� ������������������.
* Asynchronous
������ �������������� ����������, � ���������� ����������� �����, ��� �������� ������������������, �� ������� ���� ������ ������ � ������ ���� � ���� ����������� ������ ������������ ������.

## 5)Sharding
���������� ���������� (�������) � ����������� �� ���������� �����, ������ �� ������� �������� �� ����� ������.

������� ����������: [https://aws.amazon.com/what-is/database-sharding/](https://aws.amazon.com/what-is/database-sharding/)

![Master-Slave Architecture](./figures/sharding.png)
*Figure 3: Sharding*
### ���� ��������
* ��������������� �� ������ ���������
* ������������ ���������������
* ��������������� ���������
* ������������������