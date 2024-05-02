#!/bin/bash

# List of commit messages to choose from
commit_messages=(
    "Fixed a bug"
    "Added new feature"
    "Refactored code"
    "Updated documentation"
    "Optimized performance"
    "Resolved merge conflict"
    "Implemented unit tests"
)

# List of holidays to skip
holidays=(
    "2020-01-01"  # New Year's Day
    "2020-01-02"  # New Year's Day
    "2020-04-09"  # Araw ng Kagitingan
    "2020-04-10"  # Eid’l Fitr
    "2020-05-01"  # Labor Day 
    "2020-06-12"  # Independence Day
    "2020-08-26"  # National Heroes Day
    "2020-11-30"  # Bonifacio Day
    "2020-12-25"  # Christmas Day
    "2020-12-30"  # Rizal Day
    "2020-12-31"  # New Year's eve
    "2021-01-01"  # New Year's Day
    "2021-01-02"  # New Year's Day
    "2021-04-09"  # Araw ng Kagitingan
    "2021-04-10"  # Eid’l Fitr
    "2021-05-01"  # Labor Day 
    "2021-06-12"  # Independence Day
    "2021-08-26"  # National Heroes Day
    "2021-11-30"  # Bonifacio Day
    "2021-12-25"  # Christmas Day
    "2021-12-30"  # Rizal Day
    "2021-12-31"  # New Year's eve
    "2022-01-01"  # New Year's Day
    "2022-01-02"  # New Year's Day
    "2022-04-09"  # Araw ng Kagitingan
    "2022-04-10"  # Eid’l Fitr
    "2022-05-01"  # Labor Day 
    "2022-06-12"  # Independence Day
    "2022-08-26"  # National Heroes Day
    "2022-11-30"  # Bonifacio Day
    "2022-12-25"  # Christmas Day
    "2022-12-30"  # Rizal Day
    "2022-12-31"  # New Year's eve
    "2023-01-01"  # New Year's Day
    "2023-01-02"  # New Year's Day
    "2023-04-09"  # Araw ng Kagitingan
    "2023-04-10"  # Eid’l Fitr
    "2023-05-01"  # Labor Day 
    "2023-06-12"  # Independence Day
    "2023-08-26"  # National Heroes Day
    "2023-11-30"  # Bonifacio Day
    "2023-12-25"  # Christmas Day
    "2023-12-30"  # Rizal Day
    "2023-12-31"  # New Year's eve
    "2024-01-01"  # New Year's Day
    "2024-01-02"  # New Year's Day
    "2024-04-09"  # Araw ng Kagitingan
    "2024-04-10"  # Eid’l Fitr
    "2024-05-01"  # Labor Day 
    "2024-06-12"  # Independence Day
    "2024-08-26"  # National Heroes Day
    "2024-11-30"  # Bonifacio Day
    "2024-12-25"  # Christmas Day
    "2024-12-30"  # Rizal Day
    "2024-12-31"  # New Year's eve
)

# Function to check if a date is a holiday
is_holiday() {
    for holiday in "${holidays[@]}"; do
        if [[ "$1" == "$holiday" ]]; then
            return 0  # Holiday found
        fi
    done
    return 1  # Not a holiday
}

# Generate random commits for the last 4 years
generate_commits() {
    start_date=$(date --date="4 years ago" +%Y-%m-%d)
    end_date=$(date +%Y-%m-%d)
    current_date=$start_date

    while [[ "$current_date" < "$end_date" ]]; do
        num_commits=$((RANDOM % 11))  # Randomly choose 0 to 10 commits per week
        for (( i=0; i<num_commits; i++ )); do
            if [[ "$(date -d "$current_date" +%u)" -lt 6 && ! $(is_holiday "$current_date") ]]; then
                commit_message=${commit_messages[$((RANDOM % ${#commit_messages[@]}))]}
                commit_date="$current_date $(date +%H:%M:%S)"
                echo "Creating commit: $commit_message"
                echo "Content for commit: $commit_message" > temp_file.txt
                git add temp_file.txt
                git commit --date="$commit_date" -m "$commit_message"
            fi
        done
        current_date=$(date -d "$current_date + 7 days" +%Y-%m-%d)
    done
    rm temp_file.txt  # Remove temporary file
}

# Generate commits
generate_commits

# Push changes to remote
echo "Pushing changes to remote..."
git push origin master
