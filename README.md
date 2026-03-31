# oss-audit--24BAI407-
# 🐍 Open Source Software — Python Audit Capstone Project

> **Course:** Open Source Software  
> **Focus:** Auditing Python in a Linux/Ubuntu Environment  
> **Student:** Friend's Name  
> **Registration Number:** Friend's Reg No  
> **Environment:** Ubuntu / WSL (Windows Subsystem for Linux)

---

## 📋 Project Overview

This capstone project consists of **5 Bash shell scripts** designed to audit and explore an Ubuntu/WSL environment, with a focus on Python3 and open-source software principles. Each script demonstrates core shell scripting concepts including system introspection, package management, file permission analysis, log parsing, and interactive user input.

---

## 📁 Project Structure

```
capstone_project/
├── 01_system_identity_report.sh   # System info: distro, kernel, user, uptime, license
├── 02_package_inspector.sh        # dpkg check for Python3 installation & version
├── 03_directory_auditor.sh        # For-loop audit of key directory sizes & permissions
├── 04_log_file_analyzer.sh        # While-loop parser for dpkg.log install entries
├── 05_open_source_quiz.sh         # Interactive 3-question quiz saved to a text file
└── README.md                      # This file
```

---

## ⚙️ Prerequisites

- **OS:** Ubuntu 20.04+ or WSL2 (Windows Subsystem for Linux)
- **Shell:** Bash (default on Ubuntu)
- **Packages:** `dpkg`, `coreutils`, `bash` (all pre-installed on Ubuntu)
- **Python3:** Required for Script 2 to return runtime version (usually pre-installed)

To verify your environment:
```bash
bash --version
python3 --version
dpkg --version
```

---

## 🚀 How to Run the Scripts

### Step 1 — Make All Scripts Executable

Navigate to the project folder and grant execute permissions to all scripts at once:

```bash
cd capstone_project/
chmod +x *.sh
```

Or grant permissions individually:
```bash
chmod +x 01_system_identity_report.sh
chmod +x 02_package_inspector.sh
chmod +x 03_directory_auditor.sh
chmod +x 04_log_file_analyzer.sh
chmod +x 05_open_source_quiz.sh
```

---

### Script 1 — System Identity Report

**File:** `01_system_identity_report.sh`  
**Purpose:** Displays a complete system identity snapshot including Linux distribution name and version, kernel version and architecture, current logged-in user, system uptime and boot time, and OS license information.

**Run:**
```bash
./01_system_identity_report.sh
```

**Expected Output (sample):**
```
==============================================
         SYSTEM IDENTITY REPORT
==============================================

--- Distribution ---
Distro Name   : Ubuntu
Distro Version: 22.04.3 LTS (Jammy Jellyfish)

--- Kernel ---
Kernel Version: 5.15.90.1-microsoft-standard-WSL2

--- User ---
Current User  : yourname

--- Uptime ---
System Uptime : up 3 hours, 42 minutes
...
```

---

### Script 2 — Package Inspector

**File:** `02_package_inspector.sh`  
**Purpose:** Uses `dpkg` to check whether Python3 is installed on the system. If found, it displays the installed package version, the runtime version, and the binary path.

**Run:**
```bash
./02_package_inspector.sh
```

**Expected Output (sample):**
```
==============================================
           PACKAGE INSPECTOR
==============================================

Checking installation status of: python3
Status        : INSTALLED ✔

dpkg Version  : 3.10.12-1~22.04.3
Runtime Check : Python 3.10.12
Binary Path   : /usr/bin/python3
```

---

### Script 3 — Directory Auditor

**File:** `03_directory_auditor.sh`  
**Purpose:** Uses a `for` loop to iterate over `/etc`, `/var/log`, `/usr/bin`, and `/etc/python3`. For each directory it reports disk size, read permission status, write permission status, and full permission string (e.g., `drwxr-xr-x`).

**Run:**
```bash
./03_directory_auditor.sh
```

**Note:** Some directories (like `/etc/python3`) may not exist on all systems; the script handles this gracefully.

**Expected Output (sample):**
```
==============================================
            DIRECTORY AUDITOR
==============================================

Directory            Size            Readable   Writable   Permissions
----------------------------------------------------------------------
/etc                 2.1M            YES ✔      NO  ✘      drwxr-xr-x
/var/log             28M             YES ✔      NO  ✘      drwxrwxr-x
/usr/bin             332M            YES ✔      NO  ✘      drwxr-xr-x
/etc/python3         N/A             N/A        N/A        DOES NOT EXIST
```

---

### Script 4 — Log File Analyzer

**File:** `04_log_file_analyzer.sh`  
**Purpose:** Uses a `while` loop to read `/var/log/dpkg.log` line by line, collecting every line that contains the word `install`. Prints the **last 5 matching entries**.

**Run:**
```bash
./04_log_file_analyzer.sh
```

**Note:** If you have a fresh WSL installation with no dpkg history, first install a package to generate log entries:
```bash
sudo apt update && sudo apt install curl
```
Then re-run the script.

**Expected Output (sample):**
```
==============================================
           LOG FILE ANALYZER
==============================================

Log File      : /var/log/dpkg.log
Search Term   : 'install'
Total matches found: 347

--- Last 5 Matching Lines ---

  [1] 2024-11-10 09:12:04 install python3:amd64 <none> 3.10.12
  [2] 2024-11-10 09:12:05 install python3-pip:amd64 <none> 22.0.2
  ...
```

---

### Script 5 — Interactive Open Source Quiz

**File:** `05_open_source_quiz.sh`  
**Purpose:** Prompts the user with 3 questions about open-source software concepts. Answers are collected interactively and saved to a timestamped `.txt` file in the same directory as the script.

**Run:**
```bash
./05_open_source_quiz.sh
```

**Questions Asked:**
1. What is Open Source Software, and how does it differ from proprietary software?
2. Name at least TWO popular open-source licenses and briefly explain each.
3. Why is Python considered a major open-source language?

**Output File:** The answers are saved automatically to:
```
open_source_answers_YYYYMMDD_HHMMSS.txt
```

---

## 🔒 Permissions Note

Scripts 3 and 4 read system directories and log files. While reading is usually permitted for regular users, if you encounter **"Permission denied"** errors, run with `sudo`:

```bash
sudo ./03_directory_auditor.sh
sudo ./04_log_file_analyzer.sh
```

---

## 🧪 Testing All Scripts at Once

You can run all five scripts sequentially with:

```bash
for script in 01 02 03 04 05; do
    echo ""
    echo "=============================="
    echo " Running script ${script}..."
    echo "=============================="
    ./${script}_*.sh
done
```

> **Tip:** Script 05 is interactive — it will pause and wait for your typed answers.

---

## 📚 Concepts Demonstrated

| Script | Key Concept |
|--------|-------------|
| 01 | System variables, `/etc/os-release`, `uname`, `uptime` |
| 02 | `dpkg` package management, conditional checks |
| 03 | `for` loops, `du`, `stat`, permission testing (`-r`, `-w`, `-x`) |
| 04 | `while` loop, file reading, array accumulation, log parsing |
| 05 | `read` for user input, file redirection (`>`), `>>`, timestamps |

---

## 👨‍💻 Author

| Field | Details |
|-------|---------|
| **Name** | Friend's Name |
| **Registration No.** | Friend's Reg No |
| **Course** | Open Source Software |
| **Project** | Python Audit — Capstone Bash Scripts |
| **Environment** | Ubuntu 22.04 / WSL2 |

---

## 📄 License

This project is submitted as academic coursework. All scripts are original work written for educational purposes under the principles of open-source software development.

---

*"Open source is not just a development model — it's a philosophy of collaboration, transparency, and shared progress."*
