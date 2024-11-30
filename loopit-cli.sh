#!/bin/bash

# List of IDs to loop through
ids=(
'9781633437166'
'9781098150952'
'9781098153427'
)

# Loop through each ID and run the command
for id in "${ids[@]}"; do
    echo "Processing ID: $id"
    
    # Run the command and wait for it to finish
    python3 safaribooks.py "$id"
    
    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "ID $id processed successfully!"
    else
        echo "Error processing ID $id. Retrying..."
        # You can add a retry mechanism here if desired, for example:
        # for i in {1..3}; do
        #   python3 safaribooks.py "$id" && break
        #   echo "Retrying ID $id..."
        # done
    fi

    echo "Proceeding to next ID..."
done
