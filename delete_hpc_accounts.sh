#!/bin/bash

# Delete all existing slurm accounts.

accounts=$(sacctmgr show account format=Account --parsable2 -n | grep '^hpc_')

for account in $accounts; do
    echo "Canceling jobs for account $account"
    scancel --account="$account"
	
    echo "Deleting acc $account"
    sacctmgr delete account name="$account" --immediate
done

echo "All hpc accounts deleted from slurm cluster."
