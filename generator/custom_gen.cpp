#define _CRT_SECURE_NO_WARNINGS
#include "testlib.h"
#include <bits/stdc++.h>
using namespace std;


  
// rnd.next(l, r), or it can take regex like: "[a-zA-z0-9]{1,10}"
// println will not print additional spaces  at the end of the line
 // cout << rnd.next("[a-zA-Z0-9]{1,1000}") << endl;
int main(int argc, char** argv) {
    registerGen(argc, argv, 1);
  
    // generate premutation of n numbers
    int n = rnd.next(1, 1000);
    cout << n << "\n";
    vector<int> a(n);
    iota(a.begin(),a.end(),1);
    shuffle(a.begin(),a.end());
    println(a);

    return 0;
}
