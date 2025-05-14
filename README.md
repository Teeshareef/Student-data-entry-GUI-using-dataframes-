Student Data Entry GUI Using Dataframes in R
This is a simple R-based GUI application for entering, validating, and analyzing student information using the `tcltk` package.
Features
•	Enter student details like name, age, class, height, weight, and subject scores.
•	Real-time input validation (e.g., no letters in age, scores ≤ 100).
•	Automatically calculates the average score.
•	Assigns a performance status: Excellent, Good, Average, or Poor.
•	Displays final data table and analytics:
o	Average weight
o	Oldest student
o	Lowest scoring student
Interface
The application uses a native R GUI built with the `tcltk` package. Keyboard navigation is supported: press `Enter` to jump to the next field.
Requirements
•	R (version ≥ 3.6)
•	`tcltk` (comes with base R)
How to Run
1. Open R or RStudio or VScode.
2. Run the main script:
    Highlight all the code (ctrl +A) then hit ctrl+enter
Screenshots
![ GUI Screenshot](images/gui.png)
![ Output Screenshot](images/output.png)

