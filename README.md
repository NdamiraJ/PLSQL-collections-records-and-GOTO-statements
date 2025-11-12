# Smart Access Control Audit – PL/SQL

This repository demonstrates how to build a **Smart Access Control Audit System** using **PL/SQL collections**, **records**, **GOTO statements**, and **exception handling**. It simulates access attempts to secure zones and logs both successful and unauthorized entries with alerts.



## Project Objective

Design and simulate a secure access control system that:

- Tracks access attempts to sensitive zones (e.g., Server Room, Executive Suite)
- Logs events using **PL/SQL collections and records**
- Uses **GOTO** to branch logic for failed access attempts
- Implements **exception handling** for robust and error-resilient execution
- Outputs grouped audit logs for clarity and review



## Features Demonstrated

- **nested table collection type** to store multiple AccessAttemptRec records in memory, letting you loop through them like an array.
- **a user-defined record type** to group together fields (user_id, zone_id, status) into one structured unit, similar to a row in a table.
- **GOTO Statements** for control flow redirection between success and alert logic
- **Exception Handling** for constraint violations and runtime errors
- **Grouped Output Formatting** for clean audit presentation



## How to Use

1. **Set up schema**  
   Run scripts in `Create tables/` to create `Users`, `Zones`, `Access_Logs`, and `Alerts`.

2. **Insert data**  
   Use scripts in `Insert data/` to populate realistic users, zones, and access attempts.

3. **Simulate access logic**  
   Execute demo blocks in `collections, records, and GOTO/` to process access attempts using:
   - Collections and records
   - GOTO-based branching
   - Grouped output formatting

4. **Review exception handling**  
   Explore `exceptions/` to see how runtime errors are caught and logged.

5. **Analyze output**  
   Check `outputs/` for console logs showing success and alert messages, grouped by status.



## Reference

Based on **Lecture 06 – PL/SQL Collections and Records**  
Instructor: Eric Maniraguha



By Josias Ndamira 
Group C – Wednesday  
Student ID: 27838


