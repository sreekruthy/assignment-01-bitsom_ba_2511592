## Storage Systems

For this hospital network, I avoided using a single storage system because the data is too varied to fit neatly into one place. For real-time operations like updating patient records and storing current vitals, I used an OLTP database. This ensures fast and reliable transactions since doctors and nurses depend on this system during patient care.
For predicting patient readmission (Goal 1), I chose a data lakehouse storage system. Historical treatment data is often clumsy and comes from different sources. So, using a data lakehouse allows storing raw data without forcing it into a strict structure while making it accessible for analysis and machine learning.
For the doctor query feature (Goal 2), I used a vector database. Regular SQL queries are not very helpful when doctors ask questions in natural language. When patient records are converted into embeddings, the system can understand meaning instead of exact words. So even if the wording is different, relevant medical history can still be retrieved.
For management reporting (Goal 3), I used on a data warehouse. These reports involve large-scale aggregation like costs and occupancy, so it’s better to run them on a system optimized for analytics rather than slowing down operational systems.
For real-time ICU vitals (Goal 4), I chose a time-series database. ICU devices continuously generate timestamped data and time-series databases are designed to handle high frequency writes and time based queries efficiently.


## OLTP vs OLAP Boundary

The OLTP part of the system is the operational database where real-time patient interactions happen, such as updating records or logging vitals. This system needs to be fast and reliable because it directly affects patient care.
The OLAP layer begins after the ingestion pipelines. Once data is moved through batch and streaming pipelines into the data lakehouse and data warehouse, it is used for analytics and machine learning. This separation ensures that heavy analytical queries, like monthly reports, do not interfere with day to day hospital operations.
There is a small delay in moving data from OLTP to OLAP, but this trade-off is acceptable because it keeps the core system stable and responsive.


## Trade-offs

A major trade-off in this design is increased system complexity. Instead of using a single database, the system uses multiple storage systems like OLTP, data lakehouse, data warehouse, vector database and time-series database. This makes the system harder to manage and monitor.
To handle this, I would use workflow orchestration tools like Apache Airflow to manage data pipelines and ensure consistency across systems. Monitoring and data validation checks would also be important to make sure that data in the warehouse and lakehouse remains accurate. This approach might add complexity but it is necessary to support both real-time hospital operations and advanced analytics without affecting performance.
