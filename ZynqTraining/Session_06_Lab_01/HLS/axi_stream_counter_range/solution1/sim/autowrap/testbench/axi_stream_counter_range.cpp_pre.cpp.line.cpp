#pragma line 1 "D:/Github/Zynq7000/ZynqTraining/Session_06_Lab_01/HLS/C/axi_stream_counter_range.cpp"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "D:/Github/Zynq7000/ZynqTraining/Session_06_Lab_01/HLS/C/axi_stream_counter_range.cpp"
#pragma empty_line
#pragma empty_line
int axi_stream_counter_range(int count_range, int * counter_output)
{
 int counterValue = 0;
#pragma empty_line
 for (counterValue = 0; counterValue < count_range; counterValue++)
 {
  *counter_output = counterValue;
 }
 counterValue++;
#pragma empty_line
 return 0;
}
