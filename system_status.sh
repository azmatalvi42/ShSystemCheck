#!/bin/sh

# Validate input threshold
validate_threshold() {
    if [ -z "$1" ]; then
        echo "$2"
        return 1
    elif ! echo "$1" | grep -Eq '^[0-9]+$' || [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "$3"
        return 1
    fi
}

cpu_utilization() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    local result="CPU utilization: $cpu_usage%"
    if [ "${cpu_usage%.*}" -lt "$1" ]; then
        result="$result - CPU ok!!"
    else
        result="$result - CPU warning!!"
    fi
    echo "$result"
}

mem_free() {
    local total_memory=$(free | grep Mem: | awk '{print $2}')
    local available_memory=$(free | grep Mem: | awk '{print $7}')
    local free_memory_percentage=$(awk "BEGIN {print ($available_memory/$total_memory)*100}")
    local result="Percent memory free is: $free_memory_percentage%"
    if [ "$(echo "$free_memory_percentage >= $1" | bc -l)" -eq 1 ]; then
        result="$result - Memory ok!!"
    else
        result="$result - Memory warning!!"
    fi
    echo "$result"
}

disk_usage() {
    local disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    local result="Disk usage: $disk_usage%"
    if [ "$disk_usage" -lt "$1" ]; then
        result="$result - Disk ok!!"
    else
        result="$result - Disk warning!!"
    fi
    echo "$result"
}

#!/bin/bash

# Other function definitions remain the same...

#!/bin/sh

# All your other functions (validate_threshold, cpu_utilization, mem_free, disk_usage) remain unchanged...

#!/bin/bash

# Predefined functions (validate_threshold, cpu_utilization, mem_free, disk_usage) remain unchanged...

send_report() {
    if [ -z "$1" ]; then
        echo "Usage: send_report <email_address>"
        return 1
    fi

    # Generate the report content
    local cpu_report=$(cpu_utilization 80)
    local mem_report=$(mem_free 95)
    local disk_report=$(disk_usage 80)

    # Combine the reports into a single variable
    local report="Testing CPU utilization, free memory, disk usage status of the system on $(date)\n"
    report+="###########################\n"
    report+="$cpu_report\n$mem_report\n$disk_report\n"
    report+="###########################\n"
    report+="Capturing the system status\n"
    report+="Sending email with the system status to $1\n"
    report+="###########################"

    # Use the 'mail' command to send the email
    echo -e "$report" | mail -s "System Status Report" "$1"

    if [ $? -eq 0 ]; then
        echo "Email sent to $1."
    else
        echo "Failed to send email to $1. Check your mail configuration."
    fi
}

# Example usage
send_report "azmatalvi2@gmail.com"

