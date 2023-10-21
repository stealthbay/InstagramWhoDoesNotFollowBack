# Created by Harry Taheem
# Stealthbay.com
# Oct 10, 2023

echo "Running the script now"

# Extract usernames from the HTML files
echo "Extracting the usernames and storing them in a new file"
grep -oP 'https://www.instagram.com/\K[^>"]+' files/following.html > files/following_names
grep -oP 'https://www.instagram.com/\K[^>"]+' files/followers.html > files/followers_names

# Sort and compare the followers and following files and generate a report
echo "Generating the report for you"
comm -23 <(sort following_names) <(sort followers_names) > files/WhoDoesNotFollowBack.txt

# Clean up temp files
echo "Cleaning up old files"
rm files/following_names
rm files/followers_names

# Print out work is done
echo "Work completed, a file called WhoDoesNotFollowBack has been created with the results"