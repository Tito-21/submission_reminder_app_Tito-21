#!/bin/bash
Submission Reminder App
Overview
The Submission Reminder App helps track student assignment submissions. It reads a list of students and their submission status from a file and reminds students who have not yet submitted their assignments.
This project includes a script (create_environment.sh) that sets up the necessary directory structure and files required for the application to function.
Project Structure

After running create_environment.sh, the following directory structure will be created:
submission_reminder_{YourName}/
config/
 	config.env
 assets/
	Submissions.txt
app/	
	reminder.sh
modules/
	functions.sh
startup.sh

Setup Instructions

Step 1: Clone the Repository
git clone https://github.com/yourgithubusername/submission_reminder_app_githusername.git
cd submission_reminder_app_githusername

Step 2: Run the Environment Setup Script
Run the following command to set up the directory structure and files:
bash create_environment.sh

You will be prompted to enter your name. The main directory will be created as submission_reminder_{YourName}.
Step 3: Start the Application
Navigate into the newly created directory and execute the startup script:
cd submission_reminder_{YourName}
bash startup.sh

This will execute reminder.sh, which will check student submissions and display reminders for those who have not submitted their assignments.
How It Works
config.env - Contains the assignment name and days remaining until the deadline.
submissions.txt - Stores student names, assignment names, and submission statuses.
functions.sh - Defines functions to check submission statuses.
reminder.sh - Reads data from submissions.txt, checks who has not submitted, and prints reminders.
startup.sh - Runs the reminder script to display submission status.
Making Scripts Executable
If the scripts are not executable, run:
chmod +x create_environment.sh
chmod +x submission_reminder_{YourName}/startup.sh
chmod +x submission_reminder_{YourName}/app/reminder.sh
chmod +x submission_reminder_{YourName}/modules/functions.sh

