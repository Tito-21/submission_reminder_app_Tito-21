#!/bin/bash

# Prompt for user's name
read -p "Enter your name: " usr

# Define main directory
subdir="submission_reminder_${usr}"

# Create directory structure
mkdir -p "$subdir/config"
mkdir -p "$subdir/modules"
mkdir -p "$subdir/app"
mkdir -p "$subdir/assets"

# Create necessary files
touch "$subdir/config/config.env"
touch "$subdir/assets/submissions.txt"
touch "$subdir/app/reminder.sh"
touch "$subdir/modules/functions.sh"
touch "$subdir/startup.sh"


# Populate config.env
cat << EOF > "$subdir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate submissions.txt with sample student records
cat << EOF > "$subdir/assets/submissions.txt"
student, assignment, submission status
Ian, Shell Navigation, not submitted
Totine, Git, submitted
Ishema, Shell Navigation, not submitted
Elvis, Shell Basics, submitted
Titus, Shell Navigation, not submitted
Teta, Shell Navigation, not submitted
Sibo, Shell Navigation, not submitted
Kagaba, Shell Navigation, not submitted
Leger, Shell Navigation, submitted
EOF

# Populate functions.sh
cat << 'EOF' > "$subdir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Populate reminder.sh
cat << 'EOF' > "$subdir/app/reminder.sh"
#!/bin/bash
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Populate startup.sh
cat << 'EOF' > "$subdir/startup.sh"
#!/bin/bash
echo "Starting Submission Reminder App..."
./app/reminder.sh
EOF

# Make scripts executable
chmod +x "$subdir/modules/functions.sh"
chmod +x "$subdir/startup.sh"
chmod +x "$subdir/app/reminder.sh"
