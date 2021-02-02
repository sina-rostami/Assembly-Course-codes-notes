make main_64 -s

for i in $(seq 20)
do
	echo "=========$i========="
	./main_64 < in.ex	
	echo "==================="
done
make clean -s 
