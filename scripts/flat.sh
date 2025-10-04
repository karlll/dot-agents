#!/bin/bash

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide an input file as the first argument" >&2
    exit 1
fi

input_file="$1"
input_file_path="$(dirname "$input_file")"
spec_file_path="$input_file_path/../../specs"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' does not exist" >&2
    exit 1
fi

# Step 1: Find which profiles are referenced in the input file
profiles_found=()
profile_versions=()
profile_files=()

# Extract YAML block from markdown
in_yaml_block=false
yaml_content=""

while IFS= read -r line; do
    if [ "$line" = '```yaml' ] || [ "$line" = '```yml' ]; then
        in_yaml_block=true
        continue
    elif [ "$line" = '```' ] && [ "$in_yaml_block" = true ]; then
        break
    elif [ "$in_yaml_block" = true ]; then
        yaml_content+="$line"$'\n'
    fi
done < "$input_file"

# Parse profiles from YAML content using awk
if [ -n "$yaml_content" ]; then
    # Use awk to extract profile name and version pairs
    profile_pairs=$(echo "$yaml_content" | awk '
    BEGIN { in_profiles = 0 }
    /^profiles:$/ { in_profiles = 1; next }
    /^[^ ]/ && in_profiles { in_profiles = 0 }
    in_profiles && /- name:/ { 
        gsub(/^[[:space:]]*- name:[[:space:]]*/, ""); 
        name = $0; 
        getline; 
        gsub(/^[[:space:]]*version:[[:space:]]*/, "");
        gsub(/^"/, ""); gsub(/"$/, "");
        version = $0;
        print name "@" version
    }')
    
    # Process each profile pair
    while IFS= read -r profile_string; do
        if [ -n "$profile_string" ]; then
            # Extract name and version
            profile_name="${profile_string%@*}"
            profile_version="${profile_string#*@}"
            
            # Search for spec file
            spec_file=""
            for ext in md yaml yml; do
                candidate="$spec_file_path/${profile_string}.${ext}"
                if [ -f "$candidate" ]; then
                    spec_file="$candidate"
                    break
                fi
            done
            
            # If spec file found, store its information
            if [ -n "$spec_file" ]; then
                profiles_found+=("$profile_name")
                profile_versions+=("$profile_version")
                profile_files+=("$spec_file")
            fi
        fi
    done <<< "$profile_pairs"
fi

# Step 2: Output input file
cat "$input_file"

# Step 3: If any profiles were found, output them
if [ ${#profiles_found[@]} -gt 0 ]; then
    echo "---"
    
    for i in "${!profiles_found[@]}"; do
        profile_name="${profiles_found[$i]}"
        profile_version="${profile_versions[$i]}"
        spec_file="${profile_files[$i]}"

        echo "---"
        echo "**$profile_name ($profile_version)**"
        echo "---"
        cat "$spec_file"
        echo
    done
fi