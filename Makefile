all:
	as -arch arm64 -o $(source).o $(source).s
	ld -o $(source) $(source).o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64