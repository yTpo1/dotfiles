#!/bin/bash

# Description: set up a .NET solution with a class library project and a unit test project

# Check if exactly 2 arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi


SOLUTION_TITLE=$1
PROJECT_TITLE=$2
TEST_PROJECT=$PROJECT_TITLE.Tests
PATH_TEST_PROJECT_CSPROJ="$TEST_PROJECT"/"$TEST_PROJECT".csproj


mkdir "$SOLUTION_TITLE"
cd "$SOLUTION_TITLE"
dotnet new classlib -n "$PROJECT_TITLE"
dotnet new xunit -n "$TEST_PROJECT"
dotnet add "$PATH_TEST_PROJECT_CSPROJ" reference "$PROJECT_TITLE"/"$PROJECT_TITLE".csproj

dotnet add "$PATH_TEST_PROJECT_CSPROJ" package xunit
dotnet add "$PATH_TEST_PROJECT_CSPROJ" package xunit.runner.visualstudio
dotnet add "$PATH_TEST_PROJECT_CSPROJ" package FluentAssertions

dotnet new sln -n "$SOLUTION_TITLE"
dotnet sln "$SOLUTION_TITLE".sln add "$PROJECT_TITLE"/"$PROJECT_TITLE".csproj
dotnet sln "$SOLUTION_TITLE".sln add $PATH_TEST_PROJECT_CSPROJ
