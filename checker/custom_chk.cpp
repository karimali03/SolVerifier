#define _CRT_SECURE_NO_WARNINGS
#include "testlib.h"
#include <bits/stdc++.h>

int correct_num,test_num;
int readAns(InStream& stream) {
    int n = stream.readInt(); stream.readEoln();
    return n;
}


void checker() {
   correct_num = readAns(ans);
   test_num = readAns(ouf);
   if( (correct_num&1) == (test_num&1) ) quitf(_ok, "The answer is correct.");
   else quitf(_wa, "The answer is wrong: expected = %d, found = %d", correct_num, test_num);
}

int main(int argc, char *argv[])
{
    registerTestlibCmd(argc, argv);
    checker();
	// inf - for the input
	// ouf - for the test output
	// ans - for the correct output
	// quitf(_ok, "The answer is correct.");
	// quitf(_wa, "The answer is wrong: expected = %d, found = %d", jans, pans);
    // quitf(_fail, "The answer is failed.");
    // quitf(_pe, "Presentation Error");
	// ensuref(bool condition, const char* message)
}