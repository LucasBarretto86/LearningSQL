# Calendar Table

Some of the content of this file will be a copy or a abstraction from [Desinging Calendar Table by Ed Pollack](https://www.sqlshack.com/designing-a-calendar-table).

- [Calendar Table](#calendar-table)
  - [Concept](#concept)
  - [Implementing](#implementing)
    - [The most common data](#the-most-common-data)
    - [Addtional dates relative in time](#addtional-dates-relative-in-time)
    - [Holidays and Business days flags](#holidays-and-business-days-flags)
    - [Miscellaneous Metrics](#miscellaneous-metrics)
  - [Boolean types](#boolean-types)
    - [Populating table](#populating-table)
  - [References](#references)

## Concept

A calendar table is a permanent table containing a list of dates and various components of those dates. These may be the result of DATEPART operations, time of year, holiday analysis, or any other creative operations we can think of.

A calendar table may have the lenght we think it's important to obtain the data we need

## Implementing

First step is to define the infos we need for our table, which will lead to our columns structure

### The most common data

| Data                 | Description                                                                                                                                           |
|:---------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------|
| Day                  | The numeric representation of the calendar day, a number from 1-31. The maximum value depends on the month and on whether it is a leap year.          |
| Month                | The numeric representation of the month, a number from 1-12.                                                                                          |
| Year                 | The numeric representation of the year, such as 1979 or 2017                                                                                          |
| Quarter              | The numeric representation of the quarter, a number from 1-4                                                                                          |
| Day Name             | The common name for the day of the week, such as Tuesday or Saturday                                                                                  |
| Day of Week          | The numeric representation of the day of the week, a number from 1(Sunday) through 7 (Saturday). In some countries the number 1 is used to represent  |
| Month Name           | The common name for the month, such as February or October                                                                                            |

### Addtional dates relative in time

| Data                   | Description                                                                                                                                         |
|:-----------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
| Day of Week in Month   | The occurrence of a day of week within the current month. Ie: The third Thursday of the current month.                                              |
| Day of Week in Year    | The occurrence of a day of week within the current year. Ie: The seventeenth Monday of the current year.                                            |
| Day of Week in Quarter | The occurrence of a day of week within the current quarter. Ie: The seventh Saturday of the current quarter.                                        |
| Day of Quarter         | The day number within the current quarter.                                                                                                          |
| Day of Year            | The day number out of the current year.                                                                                                             |
| Week of Month          | The week number within the current month. With this calculation, the weeks count starting on the first of the month, regardless of the day of week. |
| Week of Quarter        | The week number within the current quarter.                                                                                                         |
| Week of Year           | The week number within the current year.                                                                                                            |
| First Date of Week     | The start date of the week. Sunday is assumed here, but could be defined differently.                                                               |
| Last Date of Week      | The end date of the week. Saturday is assumed here, but could be defined differently.                                                               |
| First Date of Month    | The first date of the current month.                                                                                                                |
| Last Date of Month     | The last date of the current month.                                                                                                                 |
| First Date of Quarter  | The first date of the current quarter.                                                                                                              |
| Last Date of Quarter   | The last date of the current quarter.                                                                                                               |
| Last Date of Year      | TThe last date of the current year.                                                                                                                 |

### Holidays and Business days flags

| Data                   | Description                                                                                                                                         |
|:-----------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
|Is Holiday?             | A bit that indicates if a given date is a holiday or not.                                                                                           |
|Is Holiday Season?      | A bit that indicates if a given date is part of a holiday season or not.                                                                            |
|Holiday Name            | Indicates the name of the holiday, if applicable.                                                                                                   |
|Holiday Season Name     | Indicates the name of the holiday season, if applicable.                                                                                            |
|Is Weekday?             | A bit that indicates if a given day is a weekday, typically Monday-Friday.                                                                          |
|Is Business Day?        | A bit that combines weekday and holiday data to determine if it is a business/work day.                                                             |
|Previous Business Day   | This is the immediately preceding business day.                                                                                                     |
|Next Business Day       | This is the immediately following business day.                                                                                                     |

### Miscellaneous Metrics

| Data                   | Description                                                                                                                                         |
|:-----------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
|Is Leap Year?           | Is the current date is contained within a leap year, then this bit would be set to 1.                                                               |
|Days in Month           | Contains the number of days in the current month.                                                                                                   |
|Calendar Date String    | Literraly the date in string like "2022-01-24"                                                                                                      |

## Boolean types

| Database     | Boolean?      | Use Instead      |
|:------------ |:------------- | :--------------- |
| Oracle       | No            | NUMBER(1)        |
| SQL Server   | No            | BIT              |
| MySQL        | No            | BIT or TINYINT   |
| PostgreSQL   | Yes           | Boolean          |

### Populating table

## References

- [Desinging Calendar Table by Ed Pollack](https://www.sqlshack.com/designing-a-calendar-table)
