System Monitoring Scripts

This collection of Bash scripts provides a simple yet powerful way to monitor and report on your system's CPU utilization, free memory, and disk usage. The scripts are designed to be lightweight and easily integrable into existing systems or workflows.
Features

    CPU Utilization Check: Reports on CPU usage and alerts if usage exceeds a specified threshold.
    Memory Free Check: Reports on the percentage of free memory available and alerts if it falls below a specified threshold.
    Disk Usage Check: Reports on the disk usage percentage and alerts if it exceeds a specified threshold.
    Email Report: Combines all the checks into a single report and sends it via email to a specified address.

Requirements

    Linux-based operating system
    AWK, sed, grep, and bc utilities (usually pre-installed in most Linux distributions)
    mail command for sending emails (may require additional setup, like installing postfix or sendmail)

Installation

    Clone or download the scripts to your local system or server where you wish to perform the system monitoring.
    Ensure executability of the scripts by running chmod +x script_name.sh for each script.
    Configure the mail command if not already set up, to enable the sending of email reports.

Usage

Before running the scripts, ensure they are marked as executable. You can use chmod +x script_name.sh to achieve this.
Monitoring Scripts

    CPU Utilization: The script accepts one argument, which is the CPU usage threshold percentage.
    Memory Free Check: The script accepts one argument, which is the minimum free memory percentage threshold.
    Disk Usage Check: The script accepts one argument, which is the maximum allowed disk usage percentage.
    Sending Report

Send Report
The send_report function compiles a report based on the CPU utilization, free memory, and disk usage checks and sends it to the specified email address.
