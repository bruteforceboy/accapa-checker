#!/bin/bash

exec 2>/dev/null

# path for c++ (change for some other language)
executable="../build/stella-interpreter"

# excludes extra-tests 
exclude_directory_extra_tests="/extra-tests/"

run_test() {
    input_file=$1

    if [[ $input_file == *"$exclude_directory_extra_tests"* ]]; then
        echo "Excluded (extra-tests): $input_file"
        return
    fi

    actual_output=$($executable < $input_file)

    if [[ $input_file == *"well-typed"* ]] && [[ $actual_output == *"ERROR"* ]]; then
        # checks that the output from a well-typed doesn't contain the substring "ERROR"
        echo "(well-typed) Test failed: $input_file"
        echo "Actual output contains an error."
        echo "Actual output:"
        echo $actual_output
        exit 1
    elif [[ $input_file == *"ill-typed"* ]]; then
        expected_output_file="${input_file/tests\/input/tests\/output}"
        expected_output=$(<"$expected_output_file")
        if [[ $actual_output == *"$expected_output"* ]]; then
            # checks that the error message is a substring of the actual output 
            echo "(ill-typed) Test passed: $input_file"
        else
            echo "(ill-typed) Test failed: $input_file"
            echo "Expected error:"
            echo $expected_output
            echo "Actual error:"
            echo $actual_output
            exit 1
        fi
    else
        echo "(well-typed) Test passed: $input_file"
    fi
}

echo "Running tests..."

for input_file in tests/input/*/*/*/*/*.stella; do
    run_test $input_file
done

for input_file in tests/input/*/*/*/*.stella; do
    run_test $input_file
done

for input_file in tests/input/*/*/*.stella; do
    run_test $input_file
done

echo "Tests complete. All tests passed."
