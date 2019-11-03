# Documentation

## Introduction

JDBC stands for Java Data Base Connectivity. The API for JDBC, is java.sql. package. In order to connect to database, we need a driver. 

There are four types of drivers.

1.  JDBC-ODBC bridge driver
2.  Native-API driver (partially java driver)
3.  Network Protocol driver (fully java driver)
4.  Thin driver (fully java driver)

### JDBC-ODBC Driver (Type 1 Driver)

The JDBC-ODBC bridge driver uses ODBC driver to connect to the database. The JDBC-ODBC bridge driver converts JDBC method calls into the ODBC function calls. This is now discouraged because of thin driver.

ODBC Stands for Open Database Connectivity, since ODBC drivers are entirely written in C language, therefore, they are platform dependent and cause the portability issues. Hence, the performance issues.

In Java 8, the JDBC-ODBC Bridge has been removed.

![]()

#### Advantages:

-   easy to use.
-   can be easily connected to any database.

#### Disadvantages:

-   Performance degraded because JDBC method call is converted into the ODBC function calls.
-   The ODBC driver needs to be installed on the client machine.

### Native-Api Driver (Type 2 Driver)

The Native API driver uses the client-side libraries of the database. The driver converts JDBC method calls into native calls of the database API. It is not written entirely in java.

![]()

### Advantage:

-   performance upgraded than JDBC-ODBC bridge driver.

### Disadvantage:

-   The Native driver needs to be installed on the each client machine.
-   The Vendor client library needs to be installed on client machine.

### Network Protocol Driver (Type 3 Driver)

The Network Protocol driver uses middleware (application server) that converts JDBC calls directly or indirectly into the vendor-specific database protocol. It is fully written in java.

![]()

#### Advantage:

-   No client side library is required because of application server that can perform many tasks like auditing, load balancing, logging etc.

#### Disadvantages:

-   Network support is required on client machine.
-   Requires database-specific coding to be done in the middle tier.
-   Maintenance of Network Protocol driver becomes costly because it requires database-specific coding to be done in the middle tier.

### Thin Driver (Type 4 Driver)

The thin driver converts JDBC calls directly into the vendor-specific database protocol. That is why it is known as thin driver. It is fully written in Java language.

![]()

#### Advantage:

-   Better performance than all other drivers.
-   No software is required at client side or server side.

#### Disadvantage:

-   Drivers depend on the Database.

Nowadays, applications are using Type 4 JDBC drivers.

For this application, we are using PostgreSQL among other common types like MySQL, Oracle, MariaDB etc.

## JDBC Code

