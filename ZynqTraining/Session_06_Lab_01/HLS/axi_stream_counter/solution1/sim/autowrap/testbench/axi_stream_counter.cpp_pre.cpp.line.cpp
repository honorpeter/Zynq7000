#pragma line 1 "D:/Github/Zynq7000/ZynqTraining/Session_06_Lab_01/HLS/C/axi_stream_counter.cpp"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "D:/Github/Zynq7000/ZynqTraining/Session_06_Lab_01/HLS/C/axi_stream_counter.cpp"
#pragma empty_line
#pragma empty_line
int axi_stream_counter(int * counter_output)
{
 static int counterValue = 0;
#pragma empty_line
 counterValue++;
#pragma empty_line
 *counter_output = counterValue;
#pragma empty_line
 return 0;
}