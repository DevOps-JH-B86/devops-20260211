#!/bin/bash



        #Write a shell script that names with my name.sh and he need to accept one argument ( a number) .the script should pring all the even numbers starting from 0 tup to the value
        print_evennumber() {
                        #The below code will print both even and odd numbers
                                # a=0
                                # limit=$1
                                # odd_numbers=''
                                # even_numbers=''

                                # while [ $a -lt $limit ]; do
                                #         if [ $(( a % 2 )) -eq 0 ]; then
                                #                 #echo " EvenNum: $a"
                                #                 even_numbers="${even_numbers} ${a}\n"
                                #         else
                                #                 #echo "OddNum: $a"
                                #                  odd_numbers="${odd_numbers} ${a}\n"
                                #         fi
                                #         a=$((a + 1))
                                # done

                                #         echo "evenNumbers: "
                                #         echo -e "$even_numbers"

                                #         echo "OddNumbers: "
                                #         echo -e "$odd_numbers"



                        # code for only to print only even numbers
                                # a=0
                                # limit=$1
                                # even_numbers=''
                                # while [ $a -lt $limit ]; do
                                #         if [ $(( a % 2 )) -eq 0 ]; then
                                #                 #echo " EvenNum: $a"
                                #                 even_numbers="${even_numbers} ${a}\n"
                                #         fi
                                #         a=$((a + 1))
                                # done

                                #         echo "evenNumbers: "
                                #         echo -e "$even_numbers"


                         # code to print only even numbers using for loop
                                # for num in $(seq 0 $1); do
                                #         if [ $((num % 2)) -eq 0 ]; then
                                #                 echo "$num"
                                #         fi
                                # done

                #Another way to print even numbers using for loop
                for ((i=0; i<$1; i++)); do
                        if [ $((i % 2)) -eq 0 ]; then
                                echo " $i"
                        fi
                done

editIgGit() {
        echo "this is an sample message"
}






                }
                print_evennumber $1
                #./<filename.sh > <$1 value> "if wan store the values in saperate file then" > <filename>








            #Assignment:2 in devops

            echo "Checking for nginx package..."

# Check if nginx is installed
if [[ -x "$(command -v nginx)" ]]
then
    echo "nginx is already installed."
else
    echo "nginx is not installed."

    # Check OS type
    if [[ -f /etc/os-release ]] && grep -qi ubuntu /etc/os-release
    then
        echo "Ubuntu detected. Installing nginx using apt..."
        sudo apt update
        sudo apt install nginx -y
    else
        echo "Non-Ubuntu system detected. Installing nginx using yum..."
        sudo yum install nginx -y
    fi

    echo "nginx installation complete."
fi

echo "Checking nginx service status..."

# Check nginx service status
if [[ "$(systemctl is-active nginx)" == "active" ]]
then
    echo "nginx is running."
else
    echo "nginx is not running."
fi





#Assignment:1 in devops
#!/bin/bash

echo "----------------------------------------------"
echo "Script execution started: $(date '+%Y-%m-%d %H:%M:%S')"
echo "----------------------------------------------"

# Total number of lines
total_lines=$(cat system.log | wc -l)
echo "Total lines in the file: $total_lines"

echo "----------------------------------------------"

# Total number of ERROR entries
total_num_entries=$(cat system.log | grep "ERROR" | wc -l)
echo "Total ERRORs: $total_num_entries"

echo "----------------------------------------------"

# User with most failed login attempts
user_most_login_failed=$(cat system.log | grep "Failed login attempt" | awk '{print $NF}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
echo "User with most failed login attempts: $user_most_login_failed"

echo "----------------------------------------------"

# User with most successful logins
user_most_login_success=$(cat system.log | grep "logged in" | cut -d' ' -f3 | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
echo "User with most successful logins: $user_most_login_success"

echo "----------------------------------------------"

# Disk usage warnings
disk_warn_count=$(grep "Disk usage" system.log | wc -l)
echo "Number of disk usage warnings: $disk_warn_count"

echo "----------------------------------------------"

# Files accessed by users
echo "Files accessed by users:"

users=$(cat system.log | grep "User" | cut -d' ' -f3 | sort -u)

for user in $users
do
    files=$(cat system.log | grep "User $user accessed" | cut -d' ' -f5)

    if [ "$files" = "" ]
    then
        echo "  $user: None"
    else
        for file in $files
        do
            echo "  $user: $file"
        done
    fi
done



assignment:3 in devops

#!/bin/bash

echo "Checking users from users.txt..."

found_count=0
not_found_count=0
total_count=0

for user in $(cat users.txt)
do
    total_count=$((total_count+1))

    result=$(grep -w "User $user" system.log)

    if [[ -n "$result" ]]
    then
        echo "User $user exists."
        found_count=$((found_count+1))
    else
        echo "User $user does not exist."
        not_found_count=$((not_found_count+1))
    fi
done

echo "Summary:"
echo "Total users checked: $total_count"
echo "Users found: $found_count"
echo "Users not found: $not_found_count"



