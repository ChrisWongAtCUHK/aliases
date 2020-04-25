#!/bin/bash

sln=${1}
lib=${2}
if [ -z ${sln} ]
then
	# default solution name unit-testing-using-nunit
	sln=unit-testing-using-nunit
fi

if [ -z ${lib} ]
then
	# default class library name unit-testing-using-nunit
	lib=ClassLib
fi

# create solution
mkdir ${sln}
cd ${sln}
dotnet new sln

# create class library and add reference
mkdir ${lib}
cd ${lib}
dotnet new classlib

cd ..
dotnet sln add ${lib}/${lib}.csproj

# create NUnit tests and add reference
test=${lib}.Tests
mkdir ${test}
cd ${test}
dotnet new nunit
dotnet add reference ../${lib}/${lib}.csproj

cd ..
dotnet sln add ${test}/${test}.csproj
