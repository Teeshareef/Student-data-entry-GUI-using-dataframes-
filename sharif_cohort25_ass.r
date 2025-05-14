# Load tcltk for GUI
library(tcltk)

# Initialize empty dataframe
student_df <- data.frame(
  Name = character(),
  Age = integer(),
  Class = integer(),
  Height = numeric(),
  Weight = numeric(),
  Math_Score = integer(),
  Eng_Score = integer(),
  Science_Score = integer(),
  Average_Score = numeric(),
  stringsAsFactors = FALSE
)

# Function to show GUI form and add one student
add_student_gui <- function() {
  win <- tktoplevel()
  tkwm.title(win, "Enter Student Details")

  # Create input fields
  fields <- c("Name", "Age", "Class", "Height", "Weight", "Math Score", "English Score", "Science Score")
  entries <- list()
  
  for (i in seq_along(fields)) {
    tkgrid(tklabel(win, text = fields[i]))
    entries[[fields[i]]] <- tkentry(win)
    tkgrid(entries[[fields[i]]])
  }

  # Function to save data
  save_data <- function() {
    name <- tclvalue(tkget(entries[["Name"]]))
    age <- as.integer(tclvalue(tkget(entries[["Age"]])))
    class <- as.integer(tclvalue(tkget(entries[["Class"]])))
    height <- as.numeric(tclvalue(tkget(entries[["Height"]])))
    weight <- as.numeric(tclvalue(tkget(entries[["Weight"]])))
    math <- as.integer(tclvalue(tkget(entries[["Math Score"]])))
    eng <- as.integer(tclvalue(tkget(entries[["English Score"]])))
    sci <- as.integer(tclvalue(tkget(entries[["Science Score"]])))
    avg <- round((math + eng + sci) / 3, 2)

    # Add row to global dataframe
    student_df <<- rbind(student_df, data.frame(
      Name = name,
      Age = age,
      Class = class,
      Height = height,
      Weight = weight,
      Math_Score = math,
      Eng_Score = eng,
      Science_Score = sci,
      Average_Score = avg,
      stringsAsFactors = FALSE
    ))

    tkdestroy(win)  # Close window after saving
  }

  # Save Button
  save_btn <- tkbutton(win, text = "Add Student", command = save_data)
  tkgrid(save_btn)
}

# Loop to add 20 students via GUI
for (i in 1:20) {
  cat(paste0("Entering student ", i, " of 20...\n"))
  add_student_gui()
  # Wait for GUI to close before continuing
  tkwait.window(toplevel())
}

# Show result
cat("\n=== Final Student Data ===\n")
print(student_df)
